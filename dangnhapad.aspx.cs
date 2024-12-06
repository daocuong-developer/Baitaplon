using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class dangnhapad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        string ckn = @"Data Source=DAOCUONG\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True";

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM ad WHERE TenDangNhap=@TenDangNhap AND MatKhau=@MatKhau";

            // Sử dụng `using` để tự động đóng kết nối và giải phóng tài nguyên
            using (SqlConnection conn = new SqlConnection(ckn))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    // Thêm tham số để tránh SQL Injection
                    cmd.Parameters.AddWithValue("@TenDangNhap", txttendn.Text);
                    cmd.Parameters.AddWithValue("@MatKhau", txtmk.Text);

                    // Thực thi truy vấn
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        // Đăng nhập thành công
                        Response.Redirect("trangchinhad.aspx");
                    }
                    else
                    {
                        // Thông báo lỗi đăng nhập
                        lblThongBao.Text = "Đăng nhập không thành công. Vui lòng kiểm tra lại thông tin.";
                    }
                }
            }
        }
    }
}