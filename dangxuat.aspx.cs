using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class dangxuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Hủy Session
            Session.Clear();   // Xóa hết session
            Session.Abandon(); // Kết thúc phiên đăng nhập

            // Chuyển hướng về trang chủ hoặc trang đăng nhập
            Response.Redirect("trangchu.aspx");
        }
    }
}