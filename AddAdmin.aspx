<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddAdmin.aspx.cs" Inherits="AddAdmin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Add New Admin - Aurangabad Bank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        :root {
            --primary-dark: #002744;
            --secondary-dark: #003d66;
            --accent-teal: #00e6e6;
            --card-bg: #f8f9fa;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            margin: 0;
            padding: 0;
        }

        /* Sidebar */
        .sidebar {
            height: 100vh;
            width: 220px;
            background: linear-gradient(to bottom, var(--primary-dark), var(--secondary-dark));
            position: fixed;
            top: 0;
            left: 0;
            color: white;
            padding: 20px;
            box-shadow: 4px 0 15px rgba(0,0,0,0.2);
        }
        .sidebar h3 {
            color: var(--accent-teal);
            text-align: center;
            margin-bottom: 40px;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 10px 15px;
            margin-bottom: 10px;
            border-radius: 8px;
            text-decoration: none;
            transition: background 0.3s ease;
        }
        .sidebar a:hover {
            background-color: rgba(255,255,255,0.2);
        }

        /* Main Content */
        .main {
            margin-left: 240px;
            padding: 30px;
        }

        /* Header and Footer */
        .header, .footer {
            background-color: var(--primary-dark);
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 1.2rem;
        }

        /* Admin Form Card */
        .card-form {
            background: var(--card-bg);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            border-radius: 15px;
            padding: 30px;
            max-width: 600px;
            margin: auto;
        }
        .form-control {
            border-radius: 8px;
        }
        .btn-primary {
            background: linear-gradient(145deg, #007bff, #0056b3);
            border: none;
            border-radius: 8px;
        }
        .btn-primary:hover {
            background: linear-gradient(145deg, #0056b3, #003f8a);
        }
        .back-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            background: #007bff;
            color: white;
            border-radius: 20px;
            padding: 6px 14px;
            border: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Sidebar -->
        <div class="sidebar">
            <h3><i class="fas fa-user-shield"></i> Admin Menu</h3>
            <a href="AdminDashboard.aspx"><i class="fas fa-home"></i> Dashboard</a>
            <a href="Logout.aspx"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>

        <!-- Main Content -->
        <div class="main">
            <!-- Header -->
            <div class="header">
                Aurangabad Bank - Add New Admin
            </div>

            <!-- Back Button -->
            <asp:Button ID="btnBack" runat="server" Text="← Back" CssClass="back-btn" OnClick="btnBack_Click" />

            <!-- Admin Form Card -->
            <div class="card-form mt-5">
                <h4 class="text-center text-primary mb-4"><i class="fas fa-user-plus"></i> Register New Admin</h4>

                <div class="mb-3">
                    <label for="txtFullName" class="form-label">Full Name</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter full name" />
                </div>

                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter email" />
                </div>

                <div class="mb-3">
                    <label for="txtUsername" class="form-label">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Choose username" />
                </div>

                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Create password" />
                </div>

                <asp:Button ID="btnRegisterAdmin" runat="server" CssClass="btn btn-primary w-100" Text="Add Admin" OnClick="btnRegisterAdmin_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="text-center mt-3 text-success d-block" />
            </div>

            <!-- Footer -->
            <div class="footer mt-5">
                &copy; 2025 Aurangabad Bank. All rights reserved.
            </div>
        </div>
    </form>
</body>
</html>
