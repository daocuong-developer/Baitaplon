<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangnhapad.aspx.cs" Inherits="Baitaplon.dangnhapad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style type="text/css">
        body {
            font-family: 'Times New Roman', serif;
            background: linear-gradient(135deg, #141e30 0%, #243b55 100%); /* Gradient từ xanh đậm sang xanh sáng */
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #fff; /* Màu chữ trắng để tương phản với nền */
        }

        #form1 {
            max-width: 400px;
            background-color: rgba(255, 255, 255, 0.15); /* Màu nền trắng trong suốt */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.5); /* Bóng đổ để tạo cảm giác nổi */
            backdrop-filter: blur(10px); /* Hiệu ứng mờ nền form */
            box-sizing: border-box;
        }

        .form-title {
            text-align: center;
            font-size: 28px;
            color: #00c6ff; /* Màu xanh neon */
            font-weight: bold;
            margin-bottom: 25px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
        }

        .form-group label {
            color: #ddd;
            font-size: 16px;
            margin-bottom: 10px;
            display: block;
        }

        .form-group input[type="text"], 
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            background-color: rgba(255, 255, 255, 0.8); /* Màu trắng trong suốt */
            color: #333;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            background-color: rgba(255, 255, 255, 1); /* Khi focus màu nền trắng hơn */
            box-shadow: 0 0 10px rgba(0, 198, 255, 0.5); /* Bóng xanh nổi bật khi focus */
            outline: none;
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            background-color: #00c6ff; /* Màu xanh neon */
            border: none;
            border-radius: 5px;
            font-size: 16px;
            color: #fff;
            text-transform: uppercase;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 198, 255, 0.4); /* Bóng đổ xanh nhạt */
        }

        .btn-primary:hover {
            background-color: #00a3cc; /* Đậm hơn khi hover */
            box-shadow: 0 6px 20px rgba(0, 198, 255, 0.6); /* Tăng bóng khi hover */
            transform: translateY(-2px); /* Hiệu ứng nhấc lên khi hover */
        }

        .auto-style7 {
            margin-top: 20px;
        }

        @media (max-width: 768px) {
            #form1 {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2 class="form-title">Đăng Nhập</h2>

        <div class="form-group">
            <label for="txtdn">Tên Đăng Nhập</label>
            <asp:TextBox ID="txttendn" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtmk">Mật Khẩu</label>
            <asp:TextBox ID="txtmk" runat="server" CssClass="form-control" Visible="True" TextMode="Password"></asp:TextBox>
        </div>

        <div class="auto-style7">
            <asp:Button ID="Button1" runat="server" Text="Đăng Nhập"  CssClass="btn btn-primary" OnClick="Button1_Click" />
        </div>
    </form>
    <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-U1TRv4K8F71jRuo56dZ2XewaR5VIEeFzXSO4R8MAhRzBif7b4pU7FsoGOVp82uqF" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
