using System;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace Baitaplon
{
    public partial class trangchu : System.Web.UI.Page
    {
        private List<CartItem> cartItems = new List<CartItem>();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra nếu đây là lần đầu tải trang
            if (!IsPostBack)
            {
                // Các logic để tải dữ liệu ban đầu vào trang (nếu có)
                BindData(1);
            }
        }
        private void BindData(int currentPage)
        {
            string connectionString = "Data Source=DAOCUONG\\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True"; // Thay thế bằng chuỗi kết nối thực tế của bạn

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                int pageSize = 8; // Số sản phẩm trên mỗi trang
                int startRowIndex = (currentPage - 1) * pageSize + 1;
                int endRowIndex = startRowIndex + pageSize - 1;

                string query = $"SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY MaSanPham) AS RowNum, * FROM SanPham) AS P WHERE RowNum BETWEEN {startRowIndex} AND {endRowIndex}";

                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                try
                {
                    connection.Open();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        DataList1.DataSource = dataTable;
                        DataList1.DataBind();

                        int totalRecords = GetTotalRecordCount(); // Hàm để lấy tổng số bản ghi
                        CreatePager(currentPage, pageSize, totalRecords); // Tạo phân trang
                    }
                }
                catch (Exception ex)
                {
                    // Xử lý lỗi
                }
                finally
                {
                    connection.Close();
                }
            }
        }
        private void CreatePager(int currentPage, int pageSize, int totalRecords)
        {
            {
                int totalPages = (int)Math.Ceiling((double)totalRecords / pageSize);

                List<object> pages = new List<object>();
                for (int i = 1; i <= totalPages; i++)
                {
                    pages.Add(new
                    {
                        PageIndex = i,
                        PageText = i.ToString(),
                        IsCurrentPage = i == currentPage
                    });
                }

                rptPager.DataSource = pages;
                rptPager.DataBind();

                // Kiểm tra điều kiện nếu rptPager.Controls có phần tử trước khi truy cập
                if (rptPager.Controls.Count > 0)
                {
                    LinkButton lnkPrevious = rptPager.Controls[0].FindControl("lnkPrevious") as LinkButton;
                    LinkButton lnkNext = rptPager.Controls[rptPager.Controls.Count - 1].FindControl("lnkNext") as LinkButton;

                    if (lnkPrevious != null)
                    {
                        lnkPrevious.Enabled = currentPage > 1;
                    }

                    if (lnkNext != null)
                    {
                        lnkNext.Enabled = currentPage < totalPages;
                    }
                }
            }
        }
        // Phương thức đếm tổng số sản phẩm trong cơ sở dữ liệu
        private int GetTotalRecordCount()
        {
            string connectionString = "Data Source=DAOCUONG\\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM SanPham"; // Đếm tổng số sản phẩm

                SqlCommand command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    return (int)command.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    // Ghi log lỗi hoặc hiển thị thông báo lỗi cụ thể
                    string errorMessage = "Đã xảy ra lỗi khi đếm sản phẩm: " + ex.Message;
                    Response.Write("<script>alert('" + errorMessage + "');</script>");
                    return 0;
                }
            }
        }

        // Phương thức xử lý sự kiện thêm sản phẩm vào giỏ hàng từ DataList
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int MaSP = Convert.ToInt32(e.CommandArgument);
                AddToCart(MaSP);
            }
        }

        // Phương thức thêm sản phẩm vào giỏ hàng
        private void AddToCart(int MaSanPham)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=DAOCUONG\\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True"))
            {
                string query = "SELECT MaSanPham, TenSanPham, GiaSanPham FROM SanPham WHERE MaSanPham = @MaSanPham";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MaSanPham", MaSanPham);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            CartItem cartItem = new CartItem
                            {
                                MaSP = MaSanPham,
                                TenSP = reader["TenSanPham"].ToString(),
                                Gia = Convert.ToDecimal(reader["GiaSanPham"])
                            };

                            List<CartItem> cart;
                            if (Session["Cart"] == null)
                            {
                                cart = new List<CartItem>();
                            }
                            else
                            {
                                cart = (List<CartItem>)Session["Cart"];
                            }

                            cart.Add(cartItem);
                            Session["Cart"] = cart;

                            string script = "alert('Sản phẩm đã được thêm vào giỏ hàng.');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "addToCartAlert", script, true);
                        }
                    }
                }
            }
        }
        protected void Page_Changed(object sender, EventArgs e)
        {
            LinkButton linkButton = sender as LinkButton;
            if (linkButton != null && !string.IsNullOrEmpty(linkButton.CommandArgument))
            {
                int pageIndex;
                if (int.TryParse(linkButton.CommandArgument, out pageIndex))
                {
                    BindData(pageIndex);
                    return;
                }
            }
        }
        // Phương thức xử lý sự kiện khi người dùng nhấn nút Thêm vào giỏ hàng
        protected void Button1_Click(object sender, EventArgs e)
        {
            Button btnAddToCart = (Button)sender;
            string productId = btnAddToCart.CommandArgument;

            List<string> cart;
            if (Session["Cart"] == null)
            {
                cart = new List<string>();
            }
            else
            {
                cart = (List<string>)Session["Cart"];
            }

            cart.Add(productId);
            Session["Cart"] = cart;

            // Hiển thị thông báo JavaScript và chuyển hướng sau khi nhấp vào nút OK
            string script = "alert('Sản phẩm đã được thêm vào giỏ hàng.'); redirectToCart();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "addToCartAlert", script, true);
        }

        // Đối tượng CartItem để lưu thông tin sản phẩm trong giỏ hàng
        private class CartItem
        {
            public int MaSP { get; set; }
            public string TenSP { get; set; }
            public decimal Gia { get; set; }
        }
        private int GetTotalPages(int pageSize)
        {
            int totalRecords = GetTotalRecordCount();
            return (int)Math.Ceiling((double)totalRecords / pageSize);
        }

        protected void rptPager_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Page")
            {
                int pageIndex = Convert.ToInt32(e.CommandArgument);
                BindData(pageIndex); // Gọi lại BindData với trang mới
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
