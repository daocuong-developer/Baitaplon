using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class dangnhapkhach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra nếu đã đăng nhập, chuyển về trang chủ
            if (Session["Username"] != null)
            {
                Response.Redirect("trangchu.aspx");
            }
        }
        SqlConnection conn = null;
        SqlCommand cmd;
        string ckn = "Data Source=DAOCUONG\\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True";
        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM KhachHang WHERE TenDangNhap=@tendangnhap AND MatKhau=@matkhau";
            conn = new SqlConnection(ckn);
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@tendangnhap", txtdn.Text);
            cmd.Parameters.AddWithValue("@matkhau", txtmk.Text);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                // Đăng nhập thành công, lưu tên tài khoản vào session
                Session["Username"] = dr["TenDangNhap"].ToString();
                Response.Redirect("trangchu.aspx");
            }
            else
            {
                // Thông báo lỗi
                string script = "alert('Sai tài khoản hoặc mật khẩu');";
                ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", script, true);
            }
            conn.Close();
        }
    }
}