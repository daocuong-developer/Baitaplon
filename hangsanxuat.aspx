<%@ Page Title="" Language="C#" MasterPageFile="~/trangad.Master" AutoEventWireup="true" CodeBehind="hangsanxuat.aspx.cs" Inherits="Baitaplon.hangsanxuat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Toàn bộ trang */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        /* Bảng chính */
        table {
            width: 80%;
            margin: 50px auto;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        /* Tiêu đề */
        .auto-style4 {
            text-align: center;
            font-weight: bold;
            font-size: 28px;
            color: #d1a953;
            margin-bottom: 20px;
        }

        /* Nhãn và input */
        .auto-style5 {
            width: 200px;
            font-weight: bold;
            color: #333;
        }

        /* TextBox */
        input[type="text"], .auto-style5 input, .auto-style5 select {
            width: calc(100% - 220px);
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s ease-in-out;
        }

        input[type="text"]:focus {
            border-color: #d35400;
            box-shadow: 0 0 5px rgba(211, 84, 0, 0.5);
        }

        /* Nút */
        .btn {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out, transform 0.2s;
        }

        .btn:hover {
            transform: scale(1.05);
}
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
                <td colspan="2" class="auto-style4">HÃNG SẢN XUẤT</td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td colspan="2" class="auto-style2">&nbsp;</td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td class="auto-style5">Mã Hãng :</td>
                <td>
                    <asp:TextBox ID="txtmahang" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td class="auto-style5">Tên Hãng :</td>
                <td>
                    <asp:TextBox ID="txttenh" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr style="page-break-inside: avoid">
                <td class="auto-style5">&nbsp;Nhà Cung Cấp :</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
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
                    <asp:Button ID="them" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="them_Click"   />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="sua" runat="server" Text="Sửa" CssClass="btn btn-warning" OnClick="sua_Click"  />
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
                    <asp:GridView ID="GridView1"  runat="server" AllowPaging="true" PageSize="3" AutoGenerateColumns="False" CssClass="gridview" Width="776px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="mahang" HeaderText="Mã Hãng" />
                            <asp:BoundField DataField="tenhang" HeaderText="Tên Hãng" />
                            <asp:BoundField DataField="mancc" HeaderText="Mã Nhà Cung Cấp" />
                            <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
