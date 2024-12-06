using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class CTdonhang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load();
            }
        }
        Ketnoi kn=new Ketnoi();
        public void load()
        {
            kn.Open();
            GridView1.DataSource = kn.laydulieu("select * from CTDatHang");
            GridView1.DataBind();
            kn.close();
            DropDownList1.DataSource = kn.laydulieu("select * from DonDatHang");
            DropDownList1.DataMember = "SoDonHang";
            DropDownList1.DataValueField = "SoDonHang";
            DropDownList1.DataBind();
            DropDownList2.DataSource = kn.laydulieu("select * from SanPham");
            DropDownList2.DataMember = "MaSanPham";
            DropDownList2.DataValueField = "MaSanPham";
            DropDownList2.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("INSERT INTO CTDatHang VALUES('" + DropDownList1.Text + "','" + DropDownList2.Text + "','" + txtsl.Text + "','" + txtdongia.Text + "')");
            kn.close();
            load();
            string cript = "alert('Thêm dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtsl.Text = "";
            txtdongia.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("update CTDatHang set SoDonHang='" + DropDownList1.Text + "', MaSanPham='" + DropDownList2.Text + "', SoLuong='" + txtsl.Text + "', DonGia='" + txtdongia.Text + "' where SoDonHang='" + DropDownList1.Text + "'AND DonGia='" + txtdongia.Text + "'");
            kn.close();
            load();
            string cript = "alert('Sửa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtsl.Text = "";
            txtdongia.Text = "";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("delete from CTDatHang where SoDonHang = '" + DropDownList1.Text + "'");
            kn.close();
            load();
            string cript = "alert('Xóa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtsl.Text = "";
            txtdongia.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            DropDownList1.SelectedValue= HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[0].Text.ToString()));
            DropDownList2.SelectedValue= HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
            txtsl.Text = GridView1.Rows[t].Cells[2].Text;
            txtdongia.Text=GridView1.Rows[t].Cells[3].Text;
        }
    }
}