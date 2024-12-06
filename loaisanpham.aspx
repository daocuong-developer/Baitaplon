<%@ Page Title="" Language="C#" MasterPageFile="~/trangad.Master" AutoEventWireup="true" CodeBehind="loaisanpham.aspx.cs" Inherits="Baitaplon.loaisanpham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">

body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f9fa; /* Màu nền nhẹ */
}

table {
    width: 100%;
    max-width: 800px;
    margin: 50px auto;
    background-color: #ffffff;
    border-radius: 8px;
    padding: 20px;
}
th, td {
    padding: 8px; /* Giảm padding tổng thể để các phần tử gần nhau hơn */
    text-align: left;
    vertical-align: middle;
}

.auto-style4 {
    text-align: center;
    font-weight: bold;
    font-size: 24px;
    color: #d1a953; /* Màu xanh Bootstrap */
    margin-bottom: 20px;
}

.auto-style5 {
    font-weight: 600;
    font-size: 16px;
    color: #333;
    width: 150px; /* Điều chỉnh lại width */
    padding-right: 10px; /* Giảm khoảng cách giữa label và textbox */
}

input[type="text"] {
    width: calc(100% - 160px); /* Tự động điều chỉnh kích thước cho phù hợp với label */
    padding: 8px;
    font-size: 16px;
    border: 1px solid #ced4da;
    border-radius: 4px;
    transition: border-color 0.3s ease-in-out;
}

input[type="text"]:focus {
    border-color: #007bff;
    outline: none;
}

.btn-container {
    text-align: center;
    margin-top: 30px;
}

.btn {
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    transition: background-color 0.3s ease-in-out, transform 0.2s;
}

.btn:hover {
    transform: scale(1.05);
}

/* Màu sắc các nút theo phong cách trangad */
.btn-primary {
    background-color: #333;
    border-color: #333;
    color: #fff;
}

.btn-warning {
    background-color: #d1a953; /* Màu vàng trangad */
    border-color: #d1a953;
    color: #fff;
}

.btn-danger {
    background-color: #c0392b;
    border-color: #c0392b;
    color: #fff;
}
.gridview {
    width: 100%;
    border: 1px solid #ddd;
    border-radius: 5px;
    overflow: hidden;
    margin-top: 20px;
}

/* Màu nền header cho GridView */
.gridview th {
    background-color: #343a40; /* Màu xám đậm */
    color: #ffffff; /* Màu chữ trắng */
    padding: 10px;
}

/* Màu nền các dòng dữ liệu */
.gridview td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
    background-color: #f8f9fa; /* Màu nền nhạt */
}

/* Màu nền cho các dòng chẵn */
.gridview tr:nth-child(even) td {
    background-color: #e9ecef; /* Màu nền cho dòng chẵn */
}

/* Hiệu ứng khi rê chuột */
.gridview tr:hover td {
    background-color: #d6d8db; /* Màu nền khi rê chuột */
    cursor: pointer;
}
            .auto-style6 {
                text-align: center;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width:80%;" align="center">
            <tr style="page-break-inside: avoid">
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td colspan="2" class="auto-style4">LOẠI SẢN PHẨM</td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td colspan="2" class="auto-style2">&nbsp;</td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td class="auto-style5">Mã Loại :</td>
                <td>
                    <asp:TextBox ID="txtmaloai" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td class="auto-style5">Tên Loại :</td>
                <td>
                    <asp:TextBox ID="txttenloai" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td colspan="2">&nbsp;</td>
            </tr>
                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-U1TRv4K8F71jRuo56dZ2XewaR5VIEeFzXSO4R8MAhRzBif7b4pU7FsoGOVp82uqF" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style3" colspan="2">
                        <asp:Button ID="them" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="them_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="sua" runat="server" Text="Sửa" CssClass="btn btn-warning" OnClick="sua_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="xoa" runat="server" Text="Xóa" CssClass="btn btn-danger" OnClick="xoa_Click" />
                    </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td colspan="2" class="auto-style6">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="776px" CssClass="gridview">
                        <Columns>
                            <asp:BoundField DataField="MaLoaiHang" HeaderText="Mã Loại" />
                            <asp:BoundField DataField="TenLoaiHang" HeaderText="Tên Loại" />
                            <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
