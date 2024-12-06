<%@ Page Title="" Language="C#" MasterPageFile="~/trangad.Master" AutoEventWireup="true" CodeBehind="CTdonhang.aspx.cs" Inherits="Baitaplon.CTdonhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
font-family: 'Arial', sans-serif;
background-color: #f4f4f4; /* Màu nền nhẹ nhàng, giống trangad */
margin: 0;
padding: 0;
}
.auto-style2 {
    font-size: 2em;
    font-weight: bold;
    text-align: center;
    padding: 10px;
    color: #d1a953;
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

/* Nút sử dụng màu sắc như trangad */
.btn-primary {
    background-color: #333;
    border-color: #333;
    color: #fff;
}

.btn-warning {
    background-color: #d1a953; /* Màu vàng tương tự trangad */
    border-color: #d1a953;
    color: #fff;
}

.btn-danger {
    background-color: #c0392b;
    border-color: #c0392b;
    color: #fff;
}

/* Hiệu ứng cho GridView */
.gridview {
    margin-top: 20px;
    border-collapse: collapse;
    width: 100%;
}

.gridview th, .gridview td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #dee2e6;
}

.gridview th {
    background-color: #333;
    color: white;
}

.gridview tr:nth-child(even) {
    background-color: #f2f2f2;
}

.gridview tr:hover {
    background-color: #f1f1f1;
}

.gridview .SelectedRowStyle {
    background-color: #e67e22;
    color: #fff;
}

/* Responsive cho di động */
@media (max-width: 768px) {
    .form-container {
        padding: 15px;
    }
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
            <td colspan="2" class="auto-style2"><B>CHI TIẾT ĐƠN ĐẶT HÀNG </B></td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>Số Đơn Đặt Hàng &nbsp; :</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="194px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>Mã Sản Phẩm :</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" Width="193px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>Số Lượng :</td>
            <td>
                <asp:TextBox ID="txtsl" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>Đơn Giá :</td>
            <td>
                <asp:TextBox ID="txtdongia" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td class="auto-style3" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="Button1_Click"  />
                <asp:Button ID="Button2" runat="server" Text="Sửa"  CssClass="btn btn-warning" OnClick="Button2_Click"/>
                <asp:Button ID="Button3" runat="server"  Text="Xóa" CssClass="btn btn-danger" OnClick="Button3_Click" />
            </td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td colspan="2">
                <asp:GridView ID="GridView1" CssClass="gridview" runat="server" AutoGenerateColumns="False"  Width="776px" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="SoDonHang" HeaderText="Số Đơn Hàng " />
                        <asp:BoundField DataField="MaSanPham" HeaderText="Mã Sản Phẩm" />
                        <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng " />
                        <asp:BoundField DataField="DonGia" HeaderText="Đơn Giá" />
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
