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
    public partial class khachhang : System.Web.UI.Page
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
            GridView1.DataSource = knoi.laydulieu("select * from KhachHang");
            GridView1.DataBind();
            knoi.close();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ngaysinh=txtngaysinh.Value;
            string gt = rbNam.Checked ? "Nam" : "Nữ";
            knoi.Open();
            knoi.xuly("INSERT INTO KhachHang VALUES(N'" + txttenkhach.Text + "',N'" + ngaysinh + "',N'" + gt + "',N'" + txtdiachi.Text + "','" + txtsdt.Text + "','" + txtemail.Text + "',N'" + txtdangnhap.Text + "','" + txtmk.Text + "')");
            knoi.close();
            load();
            string cript = "alert('Thêm dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txttenkhach.Text = "";
            txtngaysinh.Value = "";
            rbNam.Checked = false;
            rbNu.Checked = false;
            txtdiachi.Text = "";
            txtsdt.Text = "";
            txtemail.Text = "";
            txtdangnhap.Text = "";
            txtmk.Text = "";
            

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = GridView1.SelectedIndex;
            txtmakhach.Text = GridView1.Rows[t].Cells[0].Text;
            txttenkhach.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[1].Text.ToString()));
            // Lấy và thiết lập giá trị ngày sinh
            //Text1.Value = GridView1.Rows[t].Cells[6].Text.ToString();
            // Lấy giá trị ngày sinh từ GridView
            string ngaySinh = GridView1.Rows[t].Cells[2].Text;
            // Chuyển đổi giá trị ngày sinh thành định dạng yyyy-MM-dd để phù hợp với input type="date"
            DateTime parsedDate;
            if (DateTime.TryParse(ngaySinh, out parsedDate))
            {
                // Định dạng ngày thành yyyy-MM-dd
                txtngaysinh.Value = parsedDate.ToString("yyyy-MM-dd");
            }
            else
            {
                // Nếu không lấy được ngày sinh, gán giá trị rỗng
                txtngaysinh.Value = "";
            }
            string gioitinh = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[3].Text.ToString()));
            if (gioitinh == "Nam")
            {
                rbNam.Checked = true;
            }
            else
            {
                rbNu.Checked = true;
            }
            txtdiachi.Text = HttpUtility.HtmlDecode((string)(GridView1.Rows[t].Cells[4].Text.ToString()));
            txtsdt.Text = GridView1.Rows[t].Cells[5].Text;
            txtemail.Text = GridView1.Rows[t].Cells[6].Text;
            txtdangnhap.Text = GridView1.Rows[t].Cells[7].Text;
            txtmk.Text = GridView1.Rows[t].Cells[8].Text;           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string gt = rbNam.Checked ? "Nam" : "Nữ";
            knoi.Open();
            knoi.xuly("update KhachHang set TenKhach=N'" + txttenkhach.Text + "', NgaySinh=N'" + txtngaysinh.Value + "', GioiTinh=N'" + gt + "', DiaChi=N'" + txtdiachi.Text + "', SDT='" + txtsdt.Text + " ', Email='" + txtemail.Text + " ', TenDangNhap=N'" + txtdangnhap.Text + " ', MatKhau='" + txtmk.Text + " ' where MaKhach='" + txtmakhach.Text + "'");
            knoi.close();
            load();
            string cript = "alert('Sửa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmakhach.Text = "";
            txttenkhach.Text = "";
            txtngaysinh.Value = "";
            rbNam.Checked = false;
            rbNu.Checked = false;
            txtdiachi.Text = "";
            txtsdt.Text = "";
            txtemail.Text = "";
            txtdangnhap.Text = "";
            txtmk.Text = "";

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            knoi.Open();
            knoi.xuly("delete from KhachHang where MaKhach = '" + txtmakhach.Text + "'");
            knoi.close();
            load();
            string cript = "alert('Xóa dữ liệu thành công');";
            ClientScript.RegisterStartupScript(this.GetType(), "Thông báo", cript, true);
            txtmakhach.Text = "";
            txttenkhach.Text = "";
            txtngaysinh.Value = "";
            rbNam.Checked = false;
            rbNu.Checked = false;
            txtdiachi.Text = "";
            txtsdt.Text = "";
            txtemail.Text = "";
            txtdangnhap.Text = "";
            txtmk.Text = "";

        }

        protected void tk_Click(object sender, EventArgs e)
        {
            string tenkhach = txttk.Text.Trim(); // Lấy từ khóa tìm kiếm

            // Gọi phương thức tìm kiếm 
            DataTable dt = TimKiemad(tenkhach);

            // Gán kết quả vào GridView
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        private DataTable TimKiemad(string tenkhach)
        {
            // Thay đổi chuỗi kết nối với chuỗi kết nối thực tế của cơ sở dữ liệu 
            string chuoiKetNoi = @"Data Source=DAOCUONG\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True";


            // Sử dụng câu lệnh using để đảm bảo việc giải phóng tài nguyên đúng cách
            using (SqlConnection connection = new SqlConnection(chuoiKetNoi))
            {
                connection.Open();


                using (SqlCommand command = new SqlCommand("SELECT * FROM KhachHang WHERE TenKhach LIKE @tenkhach", connection))
                {
                    // Thêm một tham số để ngăn chặn SQL injection
                    command.Parameters.AddWithValue("@tenkhach", "%" + tenkhach + "%");

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
        }
    }
}