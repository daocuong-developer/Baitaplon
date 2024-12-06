<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangnhapkhach.aspx.cs" Inherits="Baitaplon.dangnhapkhach" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #243B55, #141E30);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        #form1 {
            width: 100%;
            max-width: 400px;
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        }

        .form-title {
            font-size: 28px;
            font-weight: 600;
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-label {
            font-size: 14px;
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
        }

        .form-control {
            height: 45px;
            border-radius: 5px;
        }

        .btn-primary {
            width: 100%;
            font-size: 18px;
            padding: 12px;
            border-radius: 5px;
            background-color: #007bff;
            border-color: #007bff;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .register-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .register-link a {
            color: #007bff;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .icon {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="form-title">Đăng Nhập</div>
            <div class="form-group">
                <label for="txtdn" class="form-label">Tên đăng nhập:</label>
                <asp:TextBox ID="txtdn" runat="server" CssClass="form-control" placeholder="Nhập tên đăng nhập"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtmk" class="form-label">Mật khẩu:</label>
                <asp:TextBox ID="txtmk" runat="server" TextMode="Password" CssClass="form-control" placeholder="Nhập mật khẩu"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="Button1" runat="server" Text="Đăng Nhập" CssClass="btn btn-primary" OnClick="Button1_Click" />
            </div>
            <div class="register-link">
                <i class="fas fa-user-plus icon"></i><a href="dangkikhach.aspx">Vui lòng đăng ký</a>
            </div>
        </div>
        
        <!-- Các script cần thiết cho Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-U1TRv4K8F71jRuo56dZ2XewaR5VIEeFzXSO4R8MAhRzBif7b4pU7FsoGOVp82uqF" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </form>
</body>
</html>
