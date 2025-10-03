<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerDashboard.aspx.cs" Inherits="ManagerDashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manager Dashboard - Aurangabad Central Bank</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #004d40, #00695c);
            color: white;
            padding-top: 50px;
        }
        .dashboard-container {
            max-width: 1000px;
            margin: auto;
            padding: 30px;
            background: #ffffff;
            color: #004d40;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #00695c;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        .card h4 {
            font-size: 22px;
            font-weight: bold;
        }
        .btn-view {
            margin-top: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h2>👨‍💼 Manager Dashboard - Aurangabad Central Bank</h2>
            <hr />
            <asp:Label ID="lblWelcome" runat="server" CssClass="h5 text-success d-block mb-4 text-center"></asp:Label>

            <div class="row text-center">
                <div class="col-md-4 mb-4">
                    <div class="card bg-light p-3">
                        <h4>Total Bank Amount</h4>
                        <asp:Label ID="lblTotalAmount" runat="server" CssClass="h5 text-primary font-weight-bold"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card bg-light p-3">
                        <h4>Total Deposits</h4>
                        <asp:Label ID="lblDeposits" runat="server" CssClass="h5 text-success font-weight-bold"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card bg-light p-3">
                        <h4>Total Withdrawals</h4>
                        <asp:Label ID="lblWithdrawals" runat="server" CssClass="h5 text-danger font-weight-bold"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="text-center btn-view">
                <asp:Button ID="btnViewUsers" runat="server" Text="🔍 View All Users" CssClass="btn btn-success px-5 py-2" OnClick="btnViewUsers_Click" />
            </div>
        </div>
    </form>
</body>
</html>
