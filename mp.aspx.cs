using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class mp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string masp = Request.QueryString.Get("MaSanPham");
            if (!string.IsNullOrEmpty(masp))
            {
                ViewState["maloailay"] = masp;
                Load(); // Gọi hàm Load
            }
            else
            {
                // Xử lý khi không có masp trong query string
                Response.Write("Mã sản phẩm không hợp lệ.");
            }
        }
        Ketnoi kn = new Ketnoi();
        public void Load()
        {
            kn.Open();
            // Thêm dấu nháy đơn để bao quanh giá trị chuỗi nchar
            string query = "select * from SanPham where MaSanPham = N'" + ViewState["maloailay"] + "'";
            DataList1.DataSource = kn.laydulieu(query);
            DataList1.DataBind();
            kn.close();
        }

    }
}