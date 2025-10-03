<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Aurangabad Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color: white;
        }
        .navbar {
            background-color: #0056b3;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .register-box {
            background-color: rgba(255, 255, 255, 0.05);
            padding: 30px;
            border-radius: 15px;
            margin: 80px auto;
            max-width: 600px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
        }
        .form-control {
            border-radius: 8px;
        }
        .btn-primary {
            background: linear-gradient(to right, #007bff, #0056b3);
            border: none;
            width: 100%;
            border-radius: 8px;
        }
        footer {
            background-color: #002b5c;
            color: white;
            text-align: center;
            padding: 20px 10px;
        }
    </style>
</head>
<body>

    <!-- Header Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="Home.aspx">Aurangabad Bank</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="Login.aspx">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Registration Form -->
    <form id="form1" runat="server">
        <div class="container">
            <div class="register-box mt-5">
                <h2 class="text-center mb-4">📝 Create Bank Account</h2>

                <div class="mb-3">
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" placeholder="Date of Birth"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone Number"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Choose a Username"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Create a Password" TextMode="Password"></asp:TextBox>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Register Now" CssClass="btn btn-primary" OnClick="btnRegister_Click" />

                <div class="text-center mt-3">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Yellow" Font-Bold="true"></asp:Label>
                </div>

                <div class="text-center mt-3">
                    <a href="Login.aspx" class="btn btn-light btn-sm">⬅ Back to Login</a>
                </div>
            </div>
        </div>
    </form>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Aurangabad Bank. All Rights Reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>