using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class hangsanxuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load();
            }
        }
        Ketnoi kn = new Ketnoi();

        public void load()
        {
            kn.Open();
            GridView1.DataSource = kn.laydulieu("select * from Hang");
            GridView1.DataBind();
            kn.close();
            DropDownList1.DataSource = kn.laydulieu("select * from NhaCungCap");
            DropDownList1.DataTextField = "TenNCC";
            DropDownList1.DataValueField = "MaNCC";
            DropDownList1.DataBind();

        }
        protected void them_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("INSERT INTO Hang VALUES(N'" + txtmahang.Text + "',N'" + txttenh.Text + "',N'" + DropDownList1.Text + "')");
            kn.close();
            load();
            string cript = "alert('Thêm dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmahang.Text = "";
            txttenh.Text = "";
            
        }

        protected void sua_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("update Hang set TenHang=N'" + txttenh.Text + "', MaNCC='" + DropDownList1.Text + " ' where MaHang='" + txtmahang.Text + "'");
            kn.close();
            load();
            string cript = "alert('Sửa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmahang.Text = "";
            txttenh.Text = "";
            
        }

        protected void xoa_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("delete from Hang where MaHang = '" + txtmahang.Text + "'");
            kn.close();
            load();
            string cript = "alert('Xóa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmahang.Text = "";
            txttenh.Text = "";
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            txtmahang.Text = GridView1.Rows[t].Cells[0].Text;
            txttenh.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
        }
    }
}