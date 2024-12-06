<%@ Page Title="" Language="C#" MasterPageFile="~/formgiaodien.Master" AutoEventWireup="true" CodeBehind="dangxuat.aspx.cs" Inherits="Baitaplon.dangxuat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .logout a{
            text-decoration:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="logout">
            Bạn đã đăng xuất. <a href="dangnhapkhach.aspx">Đăng nhập lại</a>
        </div>
    </form>
</asp:Content>
