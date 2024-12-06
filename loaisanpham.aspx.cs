using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class loaisanpham : System.Web.UI.Page
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
            GridView1.DataSource = knoi.laydulieu("select * from LoaiHang");
            GridView1.DataBind();
            knoi.close();


        }
        protected void them_Click(object sender, EventArgs e)
        {
            knoi.Open();
            knoi.xuly("INSERT INTO LoaiHang VALUES(N'" + txtmaloai.Text+"' ,N'" + txttenloai.Text + "')");
            knoi.close();
            load();
            string cript = "alert('Thêm dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmaloai.Text = "";
            txttenloai.Text = "";
        }

        protected void sua_Click(object sender, EventArgs e)
        {
            knoi.Open();
            knoi.xuly("update LoaiHang set TenLoaiHang=N'" + txttenloai.Text + "' where MaLoaiHang='" + txtmaloai.Text + "'");
            knoi.close();
            load();
            string cript = "alert('Sửa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmaloai.Text = "";
            txttenloai.Text = "";
        }

        protected void xoa_Click(object sender, EventArgs e)
        {
            knoi.Open();
            knoi.xuly("delete from LoaiHang where MaLoaiHang = '" + txtmaloai.Text + "'");
            knoi.close();
            load();
            string cript = "alert('Xóa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmaloai.Text = "";
            txttenloai.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            txtmaloai.Text = GridView1.Rows[t].Cells[0].Text;
            txttenloai.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
        }
    }
}