using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Kiểm tra xem có tham số tìm kiếm được truyền từ trang con không
                if (Request.QueryString["search"] != null)
                {
                    // Lấy giá trị từ tham số tìm kiếm
                    string searchKeyword = Server.UrlDecode(Request.QueryString["search"]);

                    BindSearchResults(searchKeyword);

                }


            }
        }
        private void BindSearchResults(string searchKeyword)
        {
            // Kết nối với cơ sở dữ liệu và truy vấn dữ liệu tìm kiếm
            using (SqlConnection connection = new SqlConnection("Data Source=DAOCUONG\\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True"))
            {
                connection.Open();
                string query = "SELECT MaSanPham,TenSanPham,GiaSanPham,HinhAnh FROM SanPham  WHERE TenSanPham LIKE '%' + @searchKeyword + '%'";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@searchKeyword", searchKeyword);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataList1.DataSource = reader;
                        DataList1.DataBind();
                    }
                }


            }
        }
    }
}