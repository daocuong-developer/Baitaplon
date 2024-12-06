<%@ Page Title="" Language="C#" MasterPageFile="~/trangad.Master" AutoEventWireup="true" CodeBehind="dondathang.aspx.cs" Inherits="Baitaplon.dondathang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        form {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        max-width: 900px;
        margin: 20px auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        td {
            padding: 15px 10px;
            vertical-align: middle;
            font-size: 1em;
            font-weight:bolder;
        }

        .auto-style2 {
            font-size: 2em;
            font-weight: bold;
            text-align: center;
            padding: 10px;
            color: #d1a953;
        }

        .auto-style3 {
            text-align: center;
            padding-top: 20px;
        }

        input[type="text"], 
        asp:TextBox {
            width: 100%;
            padding: 12px;
            border: 2px solid #ced4da;
            border-radius: 8px;
            font-size: 1.1em;
            color: #495057;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="text"]:focus, 
        asp:TextBox:focus {
            border-color: #007bff;
            background-color: #fff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
            outline: none;
        }

        input[type="text"]:focus, 
        select:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        select, 
        asp:DropDownList {
            width: 100%;
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 1em;
            color: #495057;
            background-color: white;
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

        /* Hiệu ứng GridView */
.gridview {
    margin-top: 20px;
    border-collapse: collapse;
    width: 100%;
    
}

.gridview th, .gridview td {
    padding: 5px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width:80%;" align="center">
            <tr style="page-break-inside: avoid">
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td colspan="2" class="auto-style2"><B>ĐƠN ĐẶT HÀNG </B></td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td colspan="2" class="auto-style2">&nbsp;</td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td>Số Đơn Đặt Hàng &nbsp; :</td>
                <td>
                    <asp:TextBox ID="txtmadh" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td>Ngày Đặt Hàng :</td>
                <td>
                    <input id="txtngay" type="date" runat="server" />
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td>Trị Giá:</td>
                <td>
                    <asp:TextBox ID="txttrigia" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td>Ngày Giao :</td>
                <td>
                    <input id="txtngaygiao" type="date" runat="server" />
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td>Tên Người Nhận :</td>
                <td>
                    <asp:TextBox ID="txtten" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td>Địa Chỉ Nhận :</td>
                <td>
                    <asp:TextBox ID="txtdiachi" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td>Số Điện Thoại :</td>
                <td>
                    <asp:TextBox ID="txtsdt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td>Hình Thức Thanh Toán :</td>
                <td>
                    <asp:DropDownList ID="ddlHTThanhToan" runat="server">
                        <asp:ListItem>Thanh toán khi nhận hàng</asp:ListItem>
                        <asp:ListItem>Thẻ tín dụng / Thẻ ghi nợ</asp:ListItem>
                        <asp:ListItem>Trả trước</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td class="auto-style4">Hình Thức Giao Hàng </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="ddlHTGiaoHang" runat="server">
                        <asp:ListItem>Giao hàng tiết kiệm</asp:ListItem>
                        <asp:ListItem>Giao hàng nhanh</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td class="auto-style4">Mã Khách :</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="197px">
                    </asp:DropDownList>
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

                    <asp:Button ID="Button1" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="Button1_Click"  />

                    <asp:Button ID="Button2" runat="server" Text="Sửa"  CssClass="btn btn-warning" OnClick="Button2_Click"/>

                    <asp:Button ID="Button3" runat="server" Text="Xóa" CssClass="btn btn-danger" OnClick="Button3_Click" />
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
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="3" AutoGenerateColumns="False" CssClass="gridview" Width="776px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="SoDonHang" HeaderText="Số Đơn Hàng " />
                            <asp:BoundField DataField="NgayDatHang" HeaderText="Ngày Đặt Hàng" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="TriGia" HeaderText="Trị Giá" />
                            <asp:BoundField DataField="NgayGiao" HeaderText="Ngày Giao" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="TenNguoiNhan" HeaderText="Tên Người Nhận" />
                            <asp:BoundField DataField="DiaChiNhan" HeaderText="Địa Chỉ Nhận" />
                            <asp:BoundField DataField="SDTNhan" HeaderText="Số Điện Thoại" />
                            <asp:BoundField DataField="HTThanhToan" HeaderText="Hình Thức Thanh Toán " />
                            <asp:BoundField DataField="HTGiaoHang" HeaderText="Hình Thức Giao Hàng" />
                            <asp:BoundField DataField="MaKhach" HeaderText="Mã Khách" />
                            <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
