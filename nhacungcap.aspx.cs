using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class nhacungcap : System.Web.UI.Page
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
            GridView1.DataSource = knoi.laydulieu("select * from NhaCungCap");
            GridView1.DataBind();
            knoi.close();


        }
        protected void them_Click(object sender, EventArgs e)
        {
            knoi.Open();
            knoi.xuly("INSERT INTO NhaCungCap VALUES(N'" + txtmanha.Text + "',N'" + txttennha.Text + "',N'" + txtdiachi.Text + "','" + txtsdt.Text + "')");
            knoi.close();
            load();
            string cript = "alert('Thêm dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmanha.Text = "";
            txttennha.Text = "";
            txtdiachi.Text = "";
            txtsdt.Text = "";
        }

        protected void sua_Click(object sender, EventArgs e)
        {
            knoi.Open();
            knoi.xuly("update NhaCungCap set TenNCC=N'" + txttennha.Text + "', DiaChi=N'" + txtdiachi.Text + "', SDT='" + txtsdt.Text + "' where MaNCC='" + txtmanha.Text + "'");
            knoi.close();
            load();
            string cript = "alert('Sửa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmanha.Text = "";
            txttennha.Text = "";
            txtdiachi.Text = "";
            txtsdt.Text = "";
        }

        protected void xoa_Click(object sender, EventArgs e)
        {
            knoi.Open();
            knoi.xuly("delete from NhaCungCap where MaNCC = '" + txtmanha.Text + "'");
            knoi.close();
            load();
            string cript = "alert('Xóa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmanha.Text = "";
            txttennha.Text = "";
            txtdiachi.Text = "";
            txtsdt.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            txtmanha.Text = GridView1.Rows[t].Cells[0].Text;
            txttennha.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
            txtdiachi.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[2].Text.ToString()));
            txtsdt.Text = GridView1.Rows[t].Cells[3].Text;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
        }
    }
}