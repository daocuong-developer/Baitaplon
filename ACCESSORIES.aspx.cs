using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class ACCESSORIES : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string maLoaiHang = "LH5"; // Ví dụ: lấy sản phẩm của Mã Loại Hàng 1
                BindData(1, maLoaiHang);
            }
        }
        private void BindData(int currentPage, string maLoaiHang)
        {
            string connectionString = "Data Source=DAOCUONG\\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                int pageSize = 4; // Số sản phẩm trên mỗi trang
                int startRowIndex = (currentPage - 1) * pageSize + 1;
                int endRowIndex = startRowIndex + pageSize - 1;

                // Truy vấn SQL để lấy sản phẩm theo Mã Loại Hàng
                string query = $"SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY MaSanPham) AS RowNum, * FROM SanPham WHERE MaLoaiHang = @MaLoaiHang) AS P WHERE RowNum BETWEEN {startRowIndex} AND {endRowIndex}";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@MaLoaiHang", maLoaiHang);

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

                        int totalRecords = GetTotalRecordCount(maLoaiHang); // Hàm để lấy tổng số bản ghi theo MaLoaiHang
                        CreatePager(currentPage, pageSize, totalRecords); // Tạo phân trang
                    }
                }
                catch (Exception ex)
                {
                    // Xử lý lỗi
                    string errorMessage = "Đã xảy ra lỗi: " + ex.Message;
                    Response.Write("<script>alert('" + errorMessage + "');</script>");
                }
                finally
                {
                    connection.Close();
                }
            }
        }
        private int GetTotalRecordCount(string maLoaiHang)
        {
            string connectionString = "Data Source=DAOCUONG\\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM SanPham WHERE MaLoaiHang = @MaLoaiHang";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@MaLoaiHang", maLoaiHang);

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
    }
}