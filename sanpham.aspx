<%@ Page Title="" Language="C#" MasterPageFile="~/trangad.Master" AutoEventWireup="true" CodeBehind="sanpham.aspx.cs" Inherits="Baitaplon.sanpham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Định dạng chung cho trang */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f9fa;
    color: #333;
}

/* Định dạng cho table */
table {
    margin-top: 3px;
    background-color: white;
    border-radius: 10px;
    padding: 5px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

/* Tiêu đề sản phẩm */
.auto-style3 {
    font-size: 24px;
    font-weight: bold;
    color: #d1a953;
    text-align: center;
}
button{
    padding: 10px 15px;
}
/* Các trường thông tin */
.auto-style7 {
    font-weight: bold;
    font-size: 18px;
    color: #495057;
}

/* Textbox */
input[type=text], .auto-style7 input[type=text], textarea {
    border: 1px solid #ced4da;
    border-radius: 4px;
    padding: 8px;
    width: 100%;
    box-sizing: border-box;
}

/* Nút bấm */
/* Hiệu ứng đèn neon cho các nút */
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
.btn-success{
    background-color: #93b100;
    border-color: #93b100;
    color: #fff;
}

/* CSS cho DropDownList */
select, .dropdownlist {
  width: 100%;
  padding: 8px 16px;
  border-radius: 5px;
  border: 1px solid #ddd;
  background-color: #f8f9fa;
  font-size: 16px;
  color: #333;
  appearance: none;
  cursor: pointer;
  transition: border-color 0.3s ease;
}

select:hover, .dropdownlist:hover {
  border-color: #333;
}

select:focus, .dropdownlist:focus {
  outline: none;
  border-color: #00ff99;
}

/* Style cho GridView */
.gridview {
  width: 100%;
  border-collapse: collapse;
}

.gridview th, .gridview td {
  padding: 5px;
  border: 1px solid #ddd;
}

.gridview th {
  background-color: #333;
  color: #fff;
}

.gridview tr:nth-child(even) {
  background-color: #f9f9f9;
}

.gridview tr:hover {
  background-color: #e9e9e9;
}
    .auto-style8 {
        text-align: right;
    }
    .auto-style9 {
        width: 353px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
            <table style="width:100%;" align="center">
        <tr>
            <td colspan="2" class="auto-style6"></td>
            <td class="auto-style6"></td>
            
        </tr>

        <tr>
            <td colspan="2" class="auto-style6">&nbsp;</td>
            <td class="auto-style8">
                <asp:TextBox ID="txttk" runat="server" Width="147px"></asp:TextBox>
&nbsp;
                <asp:Button ID="tksp" runat="server" Text="Tìm Kiếm" CssClass="btn btn-primary" OnClick="tksp_Click"/>
            </td>
            
        </tr>
        <tr>
            <td colspan="3" class="auto-style3">SẢN PHẨM</td>
            
        </tr>
        <tr>
            <td colspan="2" class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            
        </tr>
        <tr>
            <td class="auto-style7">Mã Sản Phẩm:</td>
            <td class="auto-style9">
                <asp:TextBox ID="txtmasp" runat="server" ></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                Ảnh minh họa:</td>
            
        </tr>
        <tr>
            <td class="auto-style7">Tên Sản Phẩm:</td>
            <td class="auto-style9">
                <asp:TextBox ID="txttensp" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txttensp" ErrorMessage="Không được trống ">(*)</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtanh" runat="server" Width="311px"></asp:TextBox>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            
        </tr>
        <tr>
            <td class="auto-style7">Giá:</td>
            <td class="auto-style9">
                <asp:TextBox ID="txtgia" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtgia" ErrorMessage="Không được trống ">(*)</asp:RequiredFieldValidator>
                    
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Tải Lên " CssClass="btn btn-success" OnClick="Button1_Click" />
            </td>
            
        </tr>
        <tr>
            <td class="auto-style7">Mô Tả:</td>
            <td class="auto-style9">
                <asp:TextBox ID="txtmt" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtmt" ErrorMessage="Không được trống ">(*)</asp:RequiredFieldValidator>
            </td>
            <td rowspan="4">
                <asp:Image ID="Image1" runat="server" Height="200px" BackColor="Silver" Width="250px" />
                
            </td>
            
        </tr>
        
        <tr>
            <td class="auto-style7">Tên Cung Cấp:</td>
            <td class="auto-style9">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" Width="184px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Tên Loại:</td>
            <td class="auto-style9">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList2" runat="server" Width="184px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Tên Hãng:</td>
            <td class="auto-style9">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList3" runat="server" Width="183px">
                </asp:DropDownList>
            </td>
        </tr>
        
        <tr>
            <td>

            </td>
            <td class="auto-style9"></td>
            <td>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style7" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
            
        </tr>
          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-U1TRv4K8F71jRuo56dZ2XewaR5VIEeFzXSO4R8MAhRzBif7b4pU7FsoGOVp82uqF" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <tr>
            <td class="button" colspan="2">
                <asp:Button ID="them" runat="server" Text="Thêm"  CssClass="btn btn-primary" OnClick="them_Click"  />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Sua" runat="server" Text="Sửa" CssClass="btn btn-warning" OnClick="Sua_Click"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="xoa" runat="server" Text="Xóa" CssClass="btn btn-danger" OnClick="xoa_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Hủy" CssClass="btn btn-success" OnClick="Button2_Click"/>
            </td>
            <td>&nbsp;</td>
            
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
            
        </tr>
        <tr id="pag">
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview table table-bordered"  AllowPaging="True"
                    PageSize="5"  CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaSanPham" HeaderText="Mã Sản Phẩm" />
                        <asp:BoundField DataField="TenSanPham"  HeaderText="Sản Phẩm"       />
                        <asp:BoundField DataField="GiaSanPham" HeaderText="Giá" />
                        <asp:BoundField DataField="MoTa" HeaderText="Mô Tả" />
                        <asp:BoundField DataField="HinhAnh" HeaderText="Ảnh " />
                        <asp:BoundField DataField="MaNCC" HeaderText="Mã Cung Cấp" />
                        <asp:BoundField DataField="MaLoaiHang" HeaderText="Mã Loại" />
                        <asp:BoundField DataField="MaHang" HeaderText="Mã Hãng" />
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#333333" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#333333" ForeColor="black" HorizontalAlign="Center" />
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
