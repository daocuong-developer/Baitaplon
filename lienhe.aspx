<%@ Page Title="" Language="C#" MasterPageFile="~/Contact.Master" AutoEventWireup="true" CodeBehind="lienhe.aspx.cs" Inherits="Baitaplon.lienhe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* CSS cho toàn bộ trang */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding-top:20px;
            
        }

        /* Định dạng tiêu đề */
        h2 {
            color: #333;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Định dạng form liên hệ */
        .contact-form {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Định dạng input và textarea */
        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        /* Định dạng button */
        .btn-submit {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        /* Định dạng thông tin liên hệ */
        .contact-info {
            margin-top: 30px;
            text-align: center;
        }

        .contact-info p {
            margin: 5px 0;
            color: #666;
        }

        .contact-info a {
            color: #007bff;
            text-decoration: none;
        }

        .contact-info a:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <h2>Liên Hệ Với Chúng Tôi</h2>
            <div class="contact-form">
                <asp:TextBox ID="txtName" runat="server" placeholder="Họ và Tên" />
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" />
                <asp:TextBox ID="txtPhone" runat="server" placeholder="Số Điện Thoại" />
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" placeholder="Tin Nhắn" />
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn-submit" Text="Gửi" OnClick="btnSubmit_Click"  />
            </div>

            <div class="contact-info">
                <h3>Thông Tin Liên Hệ</h3>
                <p>Địa chỉ: TP.Thanh Hóa, Thanh Hóa</p>
                <p>Điện thoại: <a href="tel:+0362181049">+0362 181 049</a></p>
                <p>Email: <a href="mailto:contact@example.com">contact@example.com</a></p>
            </div>
        </div>
    </form>
</asp:Content>
