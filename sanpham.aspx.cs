using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class sanpham : System.Web.UI.Page
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
            GridView1.DataSource = kn.laydulieu("select * from SanPham");
            GridView1.DataBind();
            kn.close();
            DropDownList1.DataSource = kn.laydulieu("select * from NhaCungCap");
            DropDownList1.DataTextField = "TenNCC";
            DropDownList1.DataValueField = "MaNCC";
            DropDownList1.DataBind();
            DropDownList2.DataSource = kn.laydulieu("select * from LoaiHang");
            DropDownList2.DataTextField = "TenLoaiHang";
            DropDownList2.DataValueField = "MaLoaiHang";
            DropDownList2.DataBind();
            DropDownList3.DataSource = kn.laydulieu("select * from Hang");
            DropDownList3.DataTextField = "TenHang";
            DropDownList3.DataValueField = "MaHang";
            DropDownList3.DataBind();
        }
        protected void them_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("INSERT INTO SanPham VALUES(N'" + txtmasp.Text + "',N'" + txttensp.Text + "',N'" + txtgia.Text + "',N'" + txtmt.Text + "','" + txtanh.Text + "',N'" + DropDownList1.Text + "','" + DropDownList2.Text + "','" + DropDownList3.Text + "')");
            kn.close();
            load();
            string cript = "alert('Thêm dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txttensp.Text = "";
            txtgia.Text = "";
            txtanh.Text = "";
            txtmt.Text = "";
            txttk.Text = "";
            txtmasp.Text = "";
        }

        protected void Sua_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("update SanPham set TenSanPham=N'" + txttensp.Text + "', GiaSanPham='" + txtgia.Text + "', MoTa=N'" + txtmt.Text + " ', HinhAnh='" + txtanh.Text + " ', MaNCC='" + DropDownList1.Text + " ', MaHang='" + DropDownList3.Text + " ', MaLoaiHang='" + DropDownList2.Text + " ' where MaSanPham='" + txtmasp.Text + "'");
            kn.close();
            load();
            string cript = "alert('Sửa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txttensp.Text = "";
            txtgia.Text = "";
            txtanh.Text = "";
            txtmt.Text = "";
            txttk.Text = "";
            txtmasp.Text = "";
        }

        protected void xoa_Click(object sender, EventArgs e)
        {
            kn.Open();
            kn.xuly("delete from SanPham where MaSanPham = '" + txtmasp.Text + "'");
            kn.close();
            load();
            string cript = "alert('Xóa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txttensp.Text = "";
            txtgia.Text = "";
            txtanh.Text = "";
            txtmt.Text = "";
            txttk.Text = "";
            txtmasp.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            txttensp.Text = "";
            txtgia.Text = "";
            txtanh.Text = "";
            txtmt.Text = "";
            txttk.Text = "";
            txtmasp.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                // Kiểm tra loại tập tin (chỉ cho phép hình ảnh)
                string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                if (allowedExtensions.Contains(fileExtension))
                {
                    try
                    {
                        // Lưu ảnh vào thư mục /anh
                        string tenanh = FileUpload1.FileName;
                        FileUpload1.SaveAs(MapPath("~/img/") + tenanh);

                        // Hiển thị ảnh và lưu tên ảnh vào TextBox
                        Image1.ImageUrl = "~/img/" + tenanh;
                        txtanh.Text = tenanh;
                    }
                    catch (Exception ex)
                    {
                        // Thông báo lỗi nếu xảy ra ngoại lệ
                        lblMessage.Text = "Có lỗi xảy ra khi tải lên: " + ex.Message;
                    }
                }
                else
                {
                    lblMessage.Text = "Chỉ được tải lên các tập tin ảnh (.jpg, .jpeg, .png, .gif).";
                }
            }
            else
            {
                lblMessage.Text = "Vui lòng chọn tập tin để tải lên.";
            }
        }

        protected void tksp_Click(object sender, EventArgs e)
        {
            string TenSP = txttk.Text.Trim(); // Lấy từ khóa tìm kiếm

            // Gọi phương thức tìm kiếm 
            DataTable dt = TimKiemad(TenSP);

            // Gán kết quả vào GridView
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        private DataTable TimKiemad(string TenSP)
        {
            // Thay đổi chuỗi kết nối với chuỗi kết nối thực tế của cơ sở dữ liệu của bạn
            string chuoiKetNoi = @"Data Source=DAOCUONG\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True";


            // Sử dụng câu lệnh using để đảm bảo việc giải phóng tài nguyên đúng cách
            using (SqlConnection connection = new SqlConnection(chuoiKetNoi))
            {
                connection.Open();


                using (SqlCommand command = new SqlCommand("SELECT * FROM SanPham WHERE TenSanPham LIKE @TenSP", connection))
                {
                    // Thêm một tham số để ngăn chặn SQL injection
                    command.Parameters.AddWithValue("@TenSP", "%" + TenSP + "%");

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        return dt;
                    }
                }
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            txtmasp.Text = GridView1.Rows[t].Cells[0].Text;
            txttensp.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
            txtgia.Text = GridView1.Rows[t].Cells[2].Text;
            txtmt.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[3].Text.ToString()));
            // Lấy tên ảnh (giả sử cột ảnh nằm ở cột số 5 - chỉnh lại nếu vị trí cột khác)
            string tenAnh = GridView1.Rows[t].Cells[4].Text;

            // Đẩy tên ảnh lên TextBox nếu cần
            txtanh.Text = tenAnh;

            // Hiển thị ảnh trong Image control
            Image1.ImageUrl = "~/img/" + tenAnh;
            DropDownList1.Text= HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[5].Text.ToString()));
            DropDownList2.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[6].Text.ToString()));
            DropDownList3.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[7].Text.ToString()));
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
        }
    }
}