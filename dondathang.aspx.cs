using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class dondathang : System.Web.UI.Page
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
            GridView1.DataSource = knoi.laydulieu("select * from DonDatHang");
            GridView1.DataBind();
            knoi.close();
            DropDownList1.DataSource = knoi.laydulieu("select * from KhachHang");
            DropDownList1.DataMember = "MaKhach";
            DropDownList1.DataValueField = "MaKhach";
            DropDownList1.DataBind();


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            knoi.Open();
            knoi.xuly("INSERT INTO DonDatHang VALUES('" + txtngay.Value + "',N'" + txttrigia.Text + "','" + txtngaygiao.Value + "',N'" + txtten.Text + "',N'" + txtdiachi.Text + "','" + txtsdt.Text + "',N'" + ddlHTThanhToan.Text + "',N'" + ddlHTGiaoHang.Text + "','" + DropDownList1.Text + "')");
            knoi.close();
            load();
            string cript = "alert('Thêm dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtdiachi.Text = "";
            txtngay.Value = "";
            txtngaygiao.Value = "";
            txtsdt.Text = "";
            txtten.Text = "";
            txttrigia.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            knoi.Open();
            knoi.xuly("update DonDatHang set NgayDatHang='" + txtngay.Value + "', TriGia=N'" + txttrigia.Text + "', NgayGiao='" + txtngaygiao.Value + "', TenNguoiNhan=N'" + txtten.Text + "', DiaChiNhan=N'" + txtdiachi.Text + " ', SDTNhan='" + txtsdt.Text + " ', HTThanhToan=N'" + ddlHTThanhToan.Text + " ', HTGiaoHang=N'" + ddlHTGiaoHang.Text + " ', MaKhach='" + DropDownList1.Text + " ' where SoDonHang='" + txtmadh.Text + "'");
            knoi.close();
            load();
            string cript = "alert('Sửa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmadh.Text = "";
            txtdiachi.Text = "";
            txtngay.Value = "";
            txtngaygiao.Value = "";
            txtsdt.Text = "";
            txtten.Text = "";
            txttrigia.Text = "";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            knoi.Open();
            knoi.xuly("delete from DonDatHang where SoDonHang = '" + txtmadh.Text + "'");
            knoi.close();
            load();
            string cript = "alert('Xóa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmadh.Text = "";
            txtdiachi.Text = "";
            txtngay.Value = "";
            txtngaygiao.Value = "";
            txtsdt.Text = "";
            txtten.Text = "";
            txttrigia.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            txtmadh.Text = GridView1.Rows[t].Cells[0].Text;
            string ngayDat = GridView1.Rows[t].Cells[1].Text;
            // Chuyển đổi giá trị ngày sinh thành định dạng yyyy-MM-dd để phù hợp với input type="date"
            DateTime parsedDate;
            if (DateTime.TryParse(ngayDat, out parsedDate))
            {
                // Định dạng ngày thành yyyy-MM-dd
                txtngay.Value = parsedDate.ToString("yyyy-MM-dd");
            }
            else
            {
                // Nếu không lấy được ngày sinh, gán giá trị rỗng
                txtngay.Value = "";
            }
            txttrigia.Text = GridView1.Rows[t].Cells[2].Text;
            string ngayGiao = GridView1.Rows[t].Cells[3].Text;
            // Chuyển đổi giá trị ngày sinh thành định dạng yyyy-MM-dd để phù hợp với input type="date"
            DateTime parsedOrderDate;
            if (DateTime.TryParse(ngayGiao, out parsedDate))
            {
                // Định dạng ngày thành yyyy-MM-dd
                txtngaygiao.Value = parsedDate.ToString("yyyy-MM-dd");
            }
            else
            {
                // Nếu không lấy được ngày sinh, gán giá trị rỗng
                txtngaygiao.Value = "";
            }
            txtten.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[4].Text.ToString()));
            txtdiachi.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[5].Text.ToString()));
            txtsdt.Text = GridView1.Rows[t].Cells[6].Text;
            ddlHTThanhToan.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[7].Text.ToString()));
            ddlHTGiaoHang.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[8].Text.ToString()));
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
        }
    }
}