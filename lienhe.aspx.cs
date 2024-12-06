using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class lienhe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            string message = txtMessage.Text;

            // Gửi email hoặc lưu thông tin vào cơ sở dữ liệu ở đây
            // Ví dụ: Gửi thông báo cho admin qua email

            // Thông báo thành công cho người dùng
            Response.Write("<script>alert('Cảm ơn bạn đã liên hệ với chúng tôi!');</script>");
        }
    }
}