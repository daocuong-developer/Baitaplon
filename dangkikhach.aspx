<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangkikhach.aspx.cs" Inherits="Baitaplon.dangkikhach" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng Ký</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #2c3e50; /* Nền tối */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Chiều cao chiếm hết màn hình */
        }

        #form1 {
            max-width: 800px;
            width: 100%;
            background-color: #617781; /* Nền form tối hơn */
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5); /* Bóng mềm hơn */
            padding: 40px;
            color: #ecf0f1; /* Màu chữ sáng */
        }

        .form-title {
            text-align: center;
            font-size: 32px;
            color: #e67e22; /* Màu cam nổi bật */
            font-weight: bold;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        .form-group input[type="text"], .form-group input[type="password"], .form-group input[type="email"], .form-group input[type="date"], .form-group select {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            margin-top: 5px;
            background-color: #c9c9c9;
            color: #4a5659;
            transition: all 0.3s ease;
        }
        .form-group label {
            font-size: 16px;
            color: #bdc3c7; /* Màu nhãn nhẹ hơn */
        }

        .form-group input[type="text"], 
        .form-group input[type="password"], 
        .form-group input[type="email"], 
        .form-group input[type="date"], 
        .form-group select {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            margin-top: 5px;
            background-color: #3b4b5b;
            color: #ecf0f1; /* Màu chữ sáng */
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            outline: none;
            box-shadow: 0 0 10px rgba(230, 126, 34, 0.6);
        }

        .btn-primary {
            width: 100%;
            padding: 14px;
            background-color: #f39c12; /* Màu vàng đèn */
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 18px;
            text-transform: uppercase;
            transition: all 0.3s ease;
            box-shadow: 0 4px 20px rgba(243, 156, 18, 0.6); /* Bóng hiệu ứng "đèn" */
        }

        .btn-primary:hover {
            background-color: #e67e22;
            box-shadow: 0 6px 25px rgba(243, 156, 18, 0.8); /* Bóng mạnh hơn khi hover */
            transform: translateY(-3px); /* Nhấc nút lên khi hover */
        }

        .form-group {
            margin-bottom: 20px;
        }

        .text-center a {
            font-size: 14px;
            margin-top: 10px;
            display: inline-block;
            color: #e67e22; /* Link cam nổi bật */
        }

        .text-center a:hover {
            text-decoration: underline;
        }

        .form-row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .col-md-6 {
            flex: 1;
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2 class="form-title">Đăng ký</h2>

        <div class="form-row">
            <!-- Nhóm thông tin cá nhân -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="Txtma">Mã Khách</label>
                    <asp:TextBox ID="txtma" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtkhach">Tên Khách</label>
                    <asp:TextBox ID="txtten" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="Txtdc">Địa Chỉ</label>
                    <asp:TextBox ID="txtdc" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="Txtsdt">Số Điện Thoại</label>
                    <asp:TextBox ID="txtsdt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtns">Ngày Sinh</label>
                    <input id="txtns" type="date" CssClass="form-control" runat="server"/>
                </div>
                <div class="form-group">
                    <label for="Txtgt">Giới Tính</label>
                    <asp:TextBox ID="txtgt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <!-- Nhóm thông tin đăng nhập -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="txtemail">Email</label>
                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="Txtdn">Tên Đăng Nhập</label>
                    <asp:TextBox ID="txttendn" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtmk">Mật Khẩu</label>
                    <asp:TextBox ID="txtmk" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtmkConfirm">Nhập lại Mật Khẩu</label>
                    <asp:TextBox ID="txtnhaplaimk" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:CompareValidator ID="cvNhaplaimk" runat="server" ControlToCompare="txtmk" ControlToValidate="txtnhaplaimk" ErrorMessage="Mật khẩu không khớp" CssClass="text-danger" Display="Dynamic" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Đăng kí" CssClass="btn btn-primary" OnClick="Button1_Click"/>
        </div>

        <div class="text-center">
            <a href="dangnhapkhach.aspx">Đã có tài khoản? Đăng nhập ngay</a>
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" DisplayMode="BulletList" HeaderText="Lỗi:" />
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-U1TRv4K8F71jRuo56dZ2XewaR5VIEeFzXSO4R8MAhRzBif7b4pU7FsoGOVp82uqF" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </form>
</body>
</html>
