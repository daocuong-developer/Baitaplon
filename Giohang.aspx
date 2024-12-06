<%@ Page Title="" Language="C#" MasterPageFile="~/formgiaodien.Master" AutoEventWireup="true" CodeBehind="Giohang.aspx.cs" Inherits="Baitaplon.Giohang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
            .main{
                background: honeydew;
                margin-bottom:20px;
            }

            h2 {
                color: #333;
                text-align: center; 
                margin-bottom: 20px;
            }

/*             Định dạng bảng giỏ hàng */
            .table {
                width: 100%;
                border-collapse: collapse;
                margin: auto;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);  
                background-color: white; 
            }

            tr, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: center; 
            }

            tr {
                background-color: #fff; 
                color: black;
            }

            /* Định dạng nút xóa */
            .btn-primary {
                background-color: #dc3545;
                border: none;
                padding: 10px 15px;
                color: white;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .btn-primary:hover {
                background-color: #c82333;            }

            /* Định dạng hình ảnh sản phẩm */
            .img {
                max-width: 100px; 
                height: auto; 
                display: block;
                margin: auto; 
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="main">
       <h2>Giỏ hàng của bạn</h2>
       <asp:Repeater ID="rptProductsInCart" runat="server"  >
           <HeaderTemplate>
               <table class="table" border="1">
                   <tr>
                        <th></th>
                       <th>Mã sản phẩm</th>
                       <th>Tên sản phẩm</th>
                       <th>Giá</th>
                       <th></th>
                      
                   </tr>
           </HeaderTemplate>
           <ItemTemplate>
               <tr>
                   <td>  <asp:Image ID="Image1" CssClass="img" runat="server" Height="150px" ImageUrl='<%# "~/img/"+Eval("HinhAnh") %>' Width="208px" /></td>
                   <td><%# Eval("MaSanPham") %></td>
                   <td><%# Eval("TenSanPham") %></td>
                   <td><%# Eval("GiaSanPham") %></td>
                   <td> 
                       <asp:Button ID="Bxoa" runat="server" CssClass="btn btn-primary" Text="Xóa" OnClick="Bxoa_click" CommandArgument='<%# Eval("MaSanPham") %>' />
                   </td>           
               </tr>
           </ItemTemplate>
           <FooterTemplate>
               </table>
           </FooterTemplate>
       </asp:Repeater>
   </div>
</asp:Content>
