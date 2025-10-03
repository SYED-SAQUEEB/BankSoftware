<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Transactions.aspx.cs" Inherits="Transactions" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Transaction History - Aurangabad Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(to right, #232526, #414345);
            color: white;
            font-family: 'Segoe UI', sans-serif;
        }

        .header {
            background-color: #001f3f;
            padding: 15px;
            text-align: center;
            font-size: 22px;
            color: white;
            font-weight: bold;
        }

        .container-box {
            background-color: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 25px;
            max-width: 900px;
            margin: 30px auto;
            box-shadow: 0 0 15px #000;
        }

        .btn-back {
            position: absolute;
            top: 20px;
            left: 20px;
            padding: 8px 16px;
            background-color: transparent;
            border: 2px solid white;
            color: white;
            font-weight: bold;
            border-radius: 12px;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-back:hover {
            background-color: white;
            color: #001f3f;
            text-decoration: none;
        }

        table {
            background-color: white;
            color: black;
        }

        th {
            background-color: #001f3f;
            color: white;
        }

        .footer {
            background-color: #001f3f;
            color: white;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Back Button -->
        <a href="UserDashboard.aspx" class="btn-back">⬅ Back</a>

        <!-- Header -->
        <div class="header">
            📋 Transaction History
        </div>

        <!-- Transaction Box -->
        <div class="container-box">
            <asp:GridView ID="gvTransactions" runat="server" CssClass="table table-bordered table-striped table-hover"
                AutoGenerateColumns="False" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="TransactionDate" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy hh:mm tt}" />
                    <asp:BoundField DataField="TransactionType" HeaderText="Type" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount (₹)" DataFormatString="{0:N2}" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="TargetAccount" HeaderText="Target Account" />
                    <asp:BoundField DataField="RunningBalanceAfterTransaction" HeaderText="Balance After (₹)" DataFormatString="{0:N2}" />
                </Columns>
            </asp:GridView>
        </div>

        <!-- Footer -->
        <div class="footer">
            &copy; 2025 Aurangabad Bank. All Rights Reserved.
        </div>

    </form>
</body>
</html>
