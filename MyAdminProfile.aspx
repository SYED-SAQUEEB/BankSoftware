<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyAdminProfile.aspx.cs" Inherits="MyAdminProfile" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>My Admin Profile - Aurangabad Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background-color: #0f1115;
            color: white;
            font-family: 'Segoe UI', sans-serif;
            padding: 0;
            margin: 0;
        }

        .sidebar {
            background-color: #1a1d23;
            height: 100vh;
            padding: 30px 20px;
        }

        .sidebar a {
            color: #bbb;
            text-decoration: none;
            display: block;
            padding: 10px 15px;
            margin: 10px 0;
            border-radius: 8px;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: #2b2f3a;
            color: #fff;
        }

        .form-container {
            padding: 40px;
            background-color: #1a1d23;
            border-radius: 12px;
            margin: 40px auto;
            max-width: 700px;
        }

        .form-control {
            background-color: #2b2f3a;
            border: none;
            color: white;
        }

        .form-control::placeholder {
            color: #aaa;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2 sidebar">
                    <h4 class="text-white mb-4">🏦 Admin Panel</h4>
                    <a href="AdminDashboard.aspx">Dashboard</a>
                    <a href="MyAdminProfile.aspx" class="active">My Profile</a>
                    <a href="AddAdmin.aspx">Add New Admin</a>
                </div>

                <!-- Profile Form -->
                <div class="col-md-10">
                    <div class="form-container">
                        <h2 class="text-center mb-4">My Admin Profile</h2>

                        <div class="mb-3">
                            <label>Admin Name</label>
                            <asp:TextBox ID="txtAdminName" runat="server" CssClass="form-control" placeholder="Enter Name" />
                        </div>

                        <div class="mb-3">
                            <label>Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" />
                        </div>

                        <div class="mb-3">
                            <label>Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" ReadOnly="true" />
                        </div>

                        <div class="mb-3">
                            <label>New Password (optional)</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Change Password" />
                        </div>

                        <div class="d-flex justify-content-between">
                            <asp:Button ID="btnBack" runat="server" CssClass="btn btn-secondary" Text="⬅ Back to Dashboard" PostBackUrl="AdminDashboard.aspx" />
                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Update Profile" OnClick="btnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
