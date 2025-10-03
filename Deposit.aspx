<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Deposit.aspx.cs" Inherits="Deposit" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Deposit - Aurangabad Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f4f9ff;
        }

        .sidebar {
            width: 220px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            background-color: #003366;
            color: white;
            padding-top: 60px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.2);
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: #0059b3;
        }

        .header {
            width: 100%;
            position: fixed;
            top: 0;
            height: 60px;
            background-color: #002244;
            color: white;
            display: flex;
            align-items: center;
            padding-left: 240px;
            padding-right: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.3);
            z-index: 1000;
        }

        .main {
            margin-left: 240px;
            padding-top: 80px;
            padding: 40px;
        }

        .form-box {
            max-width: 500px;
            margin: auto;
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .btn-back {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: bold;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            margin-bottom: 20px;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }

        .footer {
            background-color: #002244;
            color: white;
            text-align: center;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
            margin-left: -0px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Sidebar -->
        <div class="sidebar">
            <h5 class="text-center mb-4">🏦 Aurangabad Bank</h5>
            <a href="UserDashboard.aspx">Dashboard</a>
            <a href="Deposit.aspx" style="background-color:#0059b3;">Deposit</a>
            <a href="Withdraw.aspx">Withdraw</a>
            <a href="Transfer.aspx">Transfer</a>
            <a href="ViewStatement.aspx">View Statement</a>
            <a href="LockerRequest.aspx">Locker Request</a>
            <a href="Login.aspx">Logout</a>
        </div>

        <!-- Header -->
        <div class="header">
            <h4>💰 Deposit Funds</h4>
        </div>

        <!-- Main Content -->
        <div class="main">
            <div class="form-box">

                <asp:Button ID="btnBack" runat="server" Text="⬅ Back to Dashboard" CssClass="btn-back" OnClick="btnBack_Click" />

                <h3 class="text-center mb-4">Deposit Money</h3>

                <div class="mb-3">
                   <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="Enter Amount to Deposit" TextMode="SingleLine" />

                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Optional Description (e.g. Salary)" />
                </div>

                <div class="d-grid mb-3">
                    <asp:Button ID="btnDeposit" runat="server" CssClass="btn btn-primary btn-block" Text="Deposit Now" OnClick="btnDeposit_Click" />
                </div>

                <asp:Label ID="lblMsg" runat="server" ForeColor="Green" Font-Bold="true" />

            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            &copy; 2025 Aurangabad Bank — All Rights Reserved.
        </div>

    </form>
</body>
</html>
