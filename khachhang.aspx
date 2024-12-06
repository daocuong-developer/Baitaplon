<%@ Page Title="" Language="C#" MasterPageFile="~/trangad.Master" AutoEventWireup="true" CodeBehind="khachhang.aspx.cs" Inherits="Baitaplon.khachhang" %>
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
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td ></td>
                <td>
                    <asp:TextBox ID="txttk" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
                    <asp:Button ID="tk" runat="server" Text="Tìm Kiếm" CssClass="btn btn-primary" OnClick="tk_Click"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style2"> KHÁCH HÀNG </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style2"> &nbsp;</td>
            </tr>
            <tr>
                <td>Mã Khách :</td>
                <td>
                    <asp:TextBox ID="txtmakhach" runat="server" ReadOnly="true" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td>Tên Khách :</td>
                <td>
                    <asp:TextBox ID="txttenkhach" runat="server"></asp:TextBox>
            
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txttenkhach" ErrorMessage="Tên không được trống ">(*)</asp:RequiredFieldValidator>
            
                </td>
            </tr>
            <tr>
                <td>Ngày Sinh :</td>
                <td>
                    <input id="txtngaysinh" type="date" runat="server"/>
                &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" BackColor="#FF9999" ControlToValidate="txtngaysinh" ErrorMessage="Không hợp lệ" Operator="DataTypeCheck" Type="Date">(*)</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>Giới Tính :</td>
                <td colspan="1" class="text-left">
                    <asp:RadioButton ID="rbNam" runat="server" Text="Nam" GroupName="gt" />
                    <asp:RadioButton ID="rbNu" runat="server" Text="Nữ" GroupName="gt"/>
                    
                </td>
            </tr>
            <tr>
                <td>Địa Chỉ :</td>
                <td>
                    <asp:TextBox ID="txtdiachi" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtdiachi" ErrorMessage="Không được trống ">(*)</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Số Điện Thoại :</td>
                <td>
                    <asp:TextBox ID="txtsdt" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtsdt" ErrorMessage="Không được trống ">(*)</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Email :</td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Email không hợp lệ" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">(*)</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Tên Đăng Nhập :</td>
                <td>
                    <asp:TextBox ID="txtdangnhap" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtdangnhap" ErrorMessage="Không được trống ">(*)</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Mật Khẩu :</td>
                <td>
                    <asp:TextBox ID="txtmk" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtmk" ErrorMessage="Không được trống ">(*)</asp:RequiredFieldValidator>
                </td>
            </tr>
            
            
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
                  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-U1TRv4K8F71jRuo56dZ2XewaR5VIEeFzXSO4R8MAhRzBif7b4pU7FsoGOVp82uqF" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Thêm " CssClass="btn btn-primary" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Sửa" CssClass="btn btn-warning" OnClick="Button2_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" Text="Xóa" CssClass="btn btn-danger" OnClick="Button3_Click"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style1"></td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <asp:GridView ID="GridView1" runat="server" CssClass="gridview" PageSize="3" AutoGenerateColumns="False" AllowPaging="true" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="MaKhach" HeaderText="Mã Khách" />
                            <asp:BoundField DataField="TenKhach" HeaderText="Tên Khách" />
                            <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="GioiTinh" HeaderText="Giới Tính" />
                            <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" />
                            <asp:BoundField DataField="SDT" HeaderText="SDT" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="TenDangNHap" HeaderText="Tên Đăng Nhập" />
                            <asp:BoundField DataField="MatKhau" HeaderText="Mật Khẩu" />
                            <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#333" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#333" ForeColor="White" HorizontalAlign="Center" />
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

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</asp:Content>
