using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class formgiaodien : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                // User is logged in, show the logout dropdown and hide the login link
                loginLink.Visible = false;
                logoutDropdown.Visible = true;
            }
            else
            {
                // User is not logged in, show the login link and hide the logout dropdown
                loginLink.Visible = true;
                logoutDropdown.Visible = false;
            }
        }
        
        Ketnoi kn = new Ketnoi();
        
        

        protected void tk_Click1(object sender, EventArgs e)
        {
            string searchKeyword = txttk.Text.Trim();
            // Chuyển từ khóa tìm kiếm 
            Response.Redirect("~/Search.aspx?search=" + Server.UrlEncode(searchKeyword));
        }
    }
}