<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chondangnhap.aspx.cs" Inherits="Baitaplon.chondangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="css/chondangnhap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>BẠN ĐĂNG NHẬP THEO QUYỀN</p>
            <div id="binhtk"> 
                <a href="dangnhapkhach.aspx">
                    <div class="icon-dang-nhap">
                        <i class="fa fa-user" aria-hidden="true"></i> Khách Hàng
                    </div>
                </a>
                <a href="dangnhapad.aspx">
                    <div class="icon-dang-nhap">
                        <i class="fas fa-user-shield" aria-hidden="true"></i> Quản Trị Viên
                    </div>
                </a>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-U1TRv4K8F71jRuo56dZ2XewaR5VIEeFzXSO4R8MAhRzBif7b4pU7FsoGOVp82uqF" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
