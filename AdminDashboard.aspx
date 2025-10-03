<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="AdminDashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Dashboard - Aurangabad Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #0f1115;
            color: #ffffff;
            font-family: 'Segoe UI', sans-serif;
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

        .card-dark {
            background-color: #1f232b;
            border: none;
            border-radius: 12px;
            color: #fff;
        }

        .card-dark h4 {
            font-size: 20px;
        }

        .dashboard-container {
            padding: 40px;
        }

        .logout-btn {
            background-color: #dc3545;
            border: none;
            color: white;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2 sidebar">
                <h4 class="text-white mb-4">🏦 Bank Admin</h4>
                <a href="AdminDashboard.aspx" class="active">Dashboard</a>
                <a href="AdminProfile.aspx">Admin Profile</a>
                <a href="MyAdminProfile.aspx">Your Profile</a>
                <a href="AddAdmin.aspx">Add New Admin</a>
                <a href="BankDetails.aspx">Bank Details</a>
                <asp:Button ID="btnLogout" runat="server" CssClass="btn logout-btn w-100" Text="Logout" OnClick="btnLogout_Click" />
            </div>

            <!-- Main Content -->
            <div class="col-md-10 dashboard-container">
                <h2 class="mb-4">Welcome back, Admin</h2>
                <div class="row mb-4">
                    <div class="col-md-6">
                        <div class="card card-dark p-4">
                            <h4>Bank Balance</h4>
                            <h2><asp:Label ID="lblTotalBankAmount" runat="server" Text="$0"></asp:Label></h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card card-dark p-4">
                            <h4>Total Transactions</h4>
                            <h2><asp:Label ID="lblTotalTransactions" runat="server" Text="0"></asp:Label></h2>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-dark p-4 mb-4">
                            <h4>Total Users</h4>
                            <asp:GridView ID="gvUsers" runat="server" CssClass="table table-bordered text-white" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="UserID" HeaderText="User ID" />
                                    <asp:BoundField DataField="FullName" HeaderText="Name" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card card-dark p-4 mb-4">
                            <h4>Customer Growth</h4>
                            <canvas id="growthChart" width="400" height="200"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    var ctx = document.getElementById('growthChart').getContext('2d');
    var growthChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'],
            datasets: [{
                label: 'Customers',
                data: [800, 850, 870, 900, 950, 1000, 1100, 1200],
                backgroundColor: 'rgba(13, 110, 253, 0.2)',
                borderColor: '#0d6efd',
                borderWidth: 2,
                fill: true,
                tension: 0.4
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    labels: {
                        color: '#ffffff'
                    }
                }
            }
        }
    });
</script>
</body>
</html>
