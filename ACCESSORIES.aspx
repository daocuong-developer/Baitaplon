<%@ Page Title="" Language="C#" MasterPageFile="~/formgiaodien.Master" AutoEventWireup="true" CodeBehind="ACCESSORIES.aspx.cs" Inherits="Baitaplon.ACCESSORIES" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
    .container {
        max-width: 100%;
        overflow-x: hidden; /* Đảm bảo không có tràn ngang */
        width:94%;
        margin: 0 auto;
    }
    /* General styling for DataList items */
    .product-grid {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin: 0 -15px;
        
    }

    .card {
        flex: 0 0 calc(25% - 30px);
        margin: 15px;
        padding: 15px;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: box-shadow 0.3s ease;
        background-color: white;
        position: relative;
        overflow: hidden;
        box-sizing:border-box;
    }

    .card:hover {
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }

    .card img {
        width: 100%;
        height: 400px;
        border-radius: 5px;
        transition: transform 0.3s ease;
    }

    .card:hover img {
        transform: scale(1.05);
    }

    /* Button styling, hidden initially */
    .card .btn {
        position: absolute;
        bottom: -50px;
        left: 0;
        right: 0;
        margin: 0 auto;
        opacity: 0;
        transition: all 0.3s ease;
        width: 100%;
        background-color: #007bff;
        border: none;
        color: white;
        padding: 10px 0;
        text-align: center;
        font-size: 14px;
        border-radius: 5px;
    }

    .card:hover .btn {
        bottom: 80px;
        opacity: 1;
    }

    /* Styling for product info */
    .product-info {
        text-align: center;
        margin-top: 10px;
    }

    .product-info h5 {
        font-size: 1.1em;
        margin-bottom: 10px;
        color: #333;
    }

    .product-info p {
        font-size: 1em;
        margin: 5px 0;
        color: #888;
    }

    /* Pagination styling */
    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .pagination .active {
        font-weight: bold;
        color: red;
    }

    .pagination .page-link {
        margin: 0 5px;
        text-decoration: none;
        color: #007bff;
    }

    .pagination .page-link:hover {
        text-decoration: underline;
    }
    .hplink{
        text-decoration:none;
        color:black;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
    <div class="product-grid">
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" >
            <ItemTemplate>
                <div class="card">
                    <a href='<%# "MaSanPham=" + Eval("MaSanPham") %>'>
                    <!-- Product Image -->
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/img/"+Eval("HinhAnh") %>' CssClass="img-fluid" />
                    </a>
                    <!-- Button Hidden by Default -->
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary"  Text="Thêm Vào Giỏ Hàng" CommandArgument='<%# Eval("MaSanPham") %>' />

                    <!-- Product Information -->
                    <div class="product-info">
                        <h5><asp:HyperLink class="hplink" ID="HyperLink1" runat="server" NavigateUrl='<%# "mp.aspx?MaSanPham="+Eval("MaSanPham") %>' Text='<%# Eval("TenSanPham") %>'></asp:HyperLink></h5>
                        <p>Giá: <asp:Label ID="Label1" runat="server" Text='<%# Eval("GiaSanPham") %>'></asp:Label> VND</p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <!-- Pagination controls -->
    <div class="pagination">
        <asp:Repeater ID="rptPager" runat="server" >
            <ItemTemplate>
                <asp:LinkButton ID="lnkPage" runat="server" CommandArgument='<%# Eval("PageIndex") %>' CommandName="Page"
                    CssClass='<%# Convert.ToBoolean(Eval("IsCurrentPage")) ? "active page-link" : "page-link" %>'>
                    <%# Eval("PageText") %>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
</asp:Content>
