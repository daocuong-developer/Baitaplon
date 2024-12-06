<%@ Page Title="" Language="C#" MasterPageFile="~/trangad.Master" AutoEventWireup="true" CodeBehind="nhacungcap.aspx.cs" Inherits="Baitaplon.nhacungcap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .container {
    max-width: 70%;
    margin: 40px auto;
    padding: 30px;
    background-color: #f8f9fa;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    font-family: 'Arial', sans-serif;
}

h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #d1a953; /* Màu vàng ánh kim từ trangad */
    font-size: 28px;
    font-weight: 600;
}

.form-group {
    margin-bottom: 20px;
    position: relative;
}

label {
    font-weight: bold;
    font-size: 14px;
    color: #333;
}

input.form-control {
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ced4da;
    width: 100%;
    font-size: 14px;
    transition: border-color 0.3s ease-in-out;
}

input.form-control:focus {
    border-color: #333; /* Màu đen từ trangad */
    box-shadow: 0 0 5px rgba(51, 51, 51, 0.5); /* Hiệu ứng shadow đen */
    outline: none;
}

.text-danger {
    font-size: 12px;
    color: #e3342f;
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

.grid-container {
    margin-top: 40px;
}

.table {
    width: 100%;
    margin-bottom: 20px;
    border-collapse: collapse;
    
}

.table th,
.table td {
/*    display:flex;*/
    padding: 5px;
    border-bottom: 1px solid #dee2e6;
/*    justify-content:center;*/
}

.table th {
    background-color: #333; /* Màu đen từ trangad */
    color: #fff;
    font-weight: 500;
}

.table tbody tr:hover {
    background-color: #f1f1f1;
}

@media screen and (max-width: 768px) {
    .container {
        width: 90%;
        padding: 20px;
    }

    h2 {
        font-size: 24px;
    }

    .btn {
        margin-bottom: 10px;
    }
}

.auto-style1 {
    margin-top: 40px;
    text-align: center;
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <h2>QUẢN LÝ NHÀ CUNG CẤP</h2>
            <div class="form-group">
                <label for="txtmanha">Mã Nhà Cung Cấp</label>
                <asp:TextBox ID="txtmanha" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txttennha">Tên Nhà Cung Cấp</label>
                <asp:TextBox ID="txttennha" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txttennha" ErrorMessage="Không được trống " Display="Dynamic" CssClass="text-danger" />
            </div>

            <div class="form-group">
                <label for="txtdiachi">Địa Chỉ</label>
                <asp:TextBox ID="txtdiachi" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtdiachi" ErrorMessage="Không được trống " Display="Dynamic" CssClass="text-danger" />
            </div>

            <div class="form-group">
                <label for="txtsdt">Số Điện Thoại</label>
                <asp:TextBox ID="txtsdt" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtsdt" ErrorMessage="Không được trống " Display="Dynamic" CssClass="text-danger" />
            </div>

            <div class="btn-container">
                <asp:Button ID="them" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="them_Click" />
                <asp:Button ID="sua" runat="server" Text="Sửa" CssClass="btn btn-warning" OnClick="sua_Click" />
                <asp:Button ID="xoa" runat="server" Text="Xóa" CssClass="btn btn-danger" OnClick="xoa_Click" />
            </div>

            <div class="auto-style1">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="3" AutoGenerateColumns="False" CssClass="table table-bordered" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="mancc" HeaderText="Mã Nhà Cung Cấp" />
                        <asp:BoundField DataField="tenncc" HeaderText="Tên Nhà Cung Cấp" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa Chỉ" />
                        <asp:BoundField DataField="sdt" HeaderText="Số Điện Thoại " />
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</asp:Content>
