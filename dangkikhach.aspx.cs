using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class dangkikhach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load();
            }
        }
        Ketnoi knoi = new Ketnoi();
        public void load()
        {
            knoi.Open();
            knoi.close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtmk.Text != txtnhaplaimk.Text)
            {
                string script = "alert('Mật khẩu không khớp. Vui lòng nhập lại.');";
                ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", script, true);
                return;
            }
            knoi.Open();
            knoi.xuly("INSERT INTO KhachHang VALUES(N'" + txtten.Text + "',N'" + txtns.Value + "','" + txtgt.Text + "','" + txtdc.Text + "','" + txtsdt.Text + "','" + txtemail.Text + "',N'" + txttendn.Text + "','" + txtmk.Text + "')");
            knoi.close();
            load();
            string cript = "alert('Đăng Ký thành công . Vui lòng Bấm Đăng Nhập ');";          
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            Response.Redirect("dangnhapkhach.aspx");
        }
    }
}