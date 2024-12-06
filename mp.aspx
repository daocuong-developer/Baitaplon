<%@ Page Title="" Language="C#" MasterPageFile="~/formgiaodien.Master" AutoEventWireup="true" CodeBehind="mp.aspx.cs" Inherits="Baitaplon.mp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
      
.auto-style1 {
    width: 100%;
    border-collapse: collapse; 
    margin: 20px 0; 
    background-color: #ffffff61; /* Thêm nền trắng để nổi bật bảng */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Thêm bóng cho bảng */
    border-radius: 10px; /* Bo góc bảng */
}

.auto-style1 tr {
    border-bottom: 1px solid #ddd; 
}

.auto-style1 td {
    padding: 15px; /* Tăng padding để làm bảng thoáng hơn */
    vertical-align: top;
    color: #333; /* Đặt màu chữ mặc định */
    font-size: 16px; /* Điều chỉnh kích thước chữ */
    font-weight:bold;
}

.auto-style1 td:first-child {
    width: 200px; 
    vertical-align: middle; /* Căn giữa theo chiều dọc cho ảnh */
    font-weight:bold;
}

.auto-style1 td:nth-child(2) {
    
    color: #444; /* Màu chữ đậm hơn một chút */
}

.auto-style1 td:nth-child(3) {
    color: #555; 
}

.auto-style1 img {
    width: 100%; 
    height: auto; /* Giữ tỷ lệ ảnh */
    border-radius: 10px; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
    object-fit: cover; /* Đảm bảo ảnh không bị méo */
}

.auto-style1 .label {
    display: block;
    margin-bottom: 10px;
    font-size: 16px;
    color: #333;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f5f5f5; 
    margin: 0;
    padding: 0;
}

/* Căn chỉnh nút thêm vào giỏ hàng */
.auto-style1 tr:last-child {
    text-align: center;
}

.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    color: #fff;
    padding: 10px;
    font-size: 14px;
    border-radius: 5px;
    width: 100%;
    text-align: center;
    cursor: pointer;
    transition: background-color 0.3s ease, border-color 0.3s ease;
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #004085;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
             <table class="auto-style1">
                    <tr>
                        <td rowspan="6">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/img/"+Eval("HinhAnh") %>' /></td>
                        <td>Mã sản phẩm</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaSanPham") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Mã nhà cung cấp</td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("MaNCC") %>'></asp:Label></td>
                    </tr>
                     <tr>
                            <td>Giá</td>
                            <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("GiaSanPham") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Mã hãng</td>
                            <td><asp:Label ID="Label4" runat="server" Text='<%# Eval("MaHang") %>'></asp:Label></td>
                        </tr>
                         <tr>
                            <td>Mô tả</td>
                            <td><asp:Label ID="Label5" runat="server" Text='<%# Eval("MoTa") %>'></asp:Label></td>
                        </tr>
                     <tr>
                         <td>
                                <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Thêm vào giỏ hàng" />
                         </td>
                   
                     </tr>
                    </table>
            </ItemTemplate>
        </asp:DataList>
   
</asp:Content>
