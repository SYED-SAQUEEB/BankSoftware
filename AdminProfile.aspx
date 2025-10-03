<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminProfile.aspx.cs" Inherits="AdminProfile" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Profile Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .container-box {
            margin: 30px auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 10px #00000020;
        }
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container container-box">
            <h3 class="mb-4 text-primary text-center">👤 Admin Profile Management</h3>

            <asp:GridView ID="gvAdmins" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="AdminID" OnRowEditing="gvAdmins_RowEditing" OnRowCancelingEdit="gvAdmins_RowCancelingEdit" OnRowUpdating="gvAdmins_RowUpdating" OnRowDeleting="gvAdmins_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="AdminID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="AdminName" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="Password" HeaderText="Password" />

                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <asp:Button ID="btnBack" runat="server" Text="⬅ Back to Dashboard" CssClass="btn btn-secondary" PostBackUrl="~/AdminDashboard.aspx" />
        </div>
    </form>
</body>
</html>
