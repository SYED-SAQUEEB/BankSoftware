<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserDashboard.aspx.cs" Inherits="UserDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Aurangabad Central Bank</title>
    <!-- Google Fonts for Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS for responsive layout and basic components -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <!-- Custom CSS for enhanced styling -->
    <style>
        /* General Body Styling */
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to bottom right, #eef4f8, #e4ebf2); /* Soft, subtle gradient background */
            color: #333;
            margin: 0;
            padding: 0;
            overflow-x: hidden; /* Prevent horizontal scrolling */
            min-height: 100vh; /* Ensure body takes full viewport height */
            display: flex; /* Use flexbox for layout */
        }

        /* Sidebar Styling */
        .sidebar {
            height: 100vh;
            width: 250px; /* Wider sidebar */
            position: fixed;
            top: 0;
            left: 0;
            background: linear-gradient(to bottom, #004a99, #0056b3); /* Darker blue gradient */
            color: white;
            padding-top: 25px;
            box-shadow: 4px 0 15px rgba(0, 0, 0, 0.2); /* Shadow for sidebar */
            z-index: 1000; /* Ensure it stays on top */
            transition: transform 0.3s ease-in-out; /* Smooth slide transition */
            transform: translateX(0); /* Default visible state */
        }

        .sidebar.collapsed {
            transform: translateX(-250px); /* Hide sidebar on collapse */
        }

        .sidebar .sidebar-header {
            padding: 0 20px 20px 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            margin-bottom: 20px;
        }

        .sidebar .sidebar-header h4 {
            margin-bottom: 5px;
            font-weight: 700;
            color: #ffd700; /* Gold accent for welcome */
        }

        .sidebar .sidebar-header p {
            font-size: 0.9em;
            color: rgba(255, 255, 255, 0.8);
        }

        .sidebar a {
            padding: 15px 25px; /* More padding for links */
            display: flex; /* Flex for icon and text alignment */
            align-items: center;
            color: white;
            text-decoration: none;
            transition: background-color 0.3s ease, padding-left 0.3s ease;
            font-weight: 500;
        }

        .sidebar a i {
            margin-right: 15px; /* Space between icon and text */
            font-size: 1.2em;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: #007bff; /* Lighter blue on hover/active */
            padding-left: 30px; /* Slight indent on hover */
            border-left: 5px solid #ffd700; /* Gold accent line */
        }
        .sidebar a.active {
             background-color: #007bff; /* Explicit active background */
        }

        /* Main Content Area */
        .content-wrapper {
            flex-grow: 1; /* Allow content to take remaining space */
            margin-left: 250px; /* Space for fixed sidebar */
            padding: 30px;
            transition: margin-left 0.3s ease-in-out; /* Smooth margin transition */
        }

        .content-wrapper.full-width {
            margin-left: 0; /* No margin when sidebar collapsed */
        }

        /* Top Bar for Dashboard Name and Toggle */
        .top-navbar {
            background-color: #fff;
            padding: 15px 30px;
            border-radius: 15px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .top-navbar h2 {
            margin: 0;
            color: #004a99;
            font-weight: 700;
            font-size: 1.8rem;
        }

        .sidebar-toggle {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 8px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: none; /* Hidden on large screens */
        }
        .sidebar-toggle:hover {
            background-color: #0056b3;
        }


        /* Card Styling */
        .dashboard-card {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-left: 6px solid #007bff; /* Accent border */
            height: 100%; /* Ensure consistent height in grid */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        .dashboard-card h5.card-title {
            color: #004d99;
            font-weight: 700;
            font-size: 1.6rem;
            margin-bottom: 15px;
        }
        .dashboard-card h6.card-subtitle {
            color: #555;
            font-size: 1.1rem;
            margin-bottom: 10px;
        }
        .dashboard-card p.card-text {
            color: #333;
            font-size: 1.4rem;
            font-weight: 600;
        }

        .dashboard-card p.card-text .balance-label {
            font-size: 1.8rem; /* Larger for balance */
            color: #28a745; /* Green for positive balance */
            font-weight: 800;
        }

        .quick-actions-card .action-link {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            margin-bottom: 10px;
            background-color: #f8f9fa;
            border-radius: 10px;
            text-decoration: none;
            color: #0056b3;
            font-weight: 600;
            transition: background-color 0.3s ease, transform 0.2s ease;
            border: 1px solid #e0e0e0;
        }
        .quick-actions-card .action-link:hover {
            background-color: #e2f2ff;
            transform: translateX(5px);
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        .quick-actions-card .action-link i {
            margin-right: 10px;
            font-size: 1.1em;
            color: #007bff;
        }

        .recent-activity-item {
            background-color: #fff;
            border-bottom: 1px solid #eee;
            padding: 15px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .recent-activity-item:last-child {
            border-bottom: none;
        }
        .recent-activity-item .activity-icon {
            font-size: 1.5em;
            margin-right: 15px;
            color: #007bff;
        }
        .recent-activity-item .activity-details {
            flex-grow: 1;
            text-align: left;
        }
        .recent-activity-item .activity-details strong {
            display: block;
            color: #333;
            font-weight: 600;
        }
        .recent-activity-item .activity-details small {
            color: #777;
        }
        .recent-activity-item .activity-amount {
            font-weight: 700;
            font-size: 1.1em;
        }
        .recent-activity-item .activity-amount.credit {
            color: #28a745; /* Green for deposits/credits */
        }
        .recent-activity-item .activity-amount.debit {
            color: #dc3545; /* Red for withdrawals/debits */
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .sidebar {
                width: 200px;
            }
            .sidebar.collapsed {
                transform: translateX(-200px);
            }
            .content-wrapper {
                margin-left: 200px;
            }
            .top-navbar h2 {
                font-size: 1.6rem;
            }
            .dashboard-card h5.card-title {
                font-size: 1.4rem;
            }
            .dashboard-card p.card-text .balance-label {
                font-size: 1.5rem;
            }
        }

        @media (max-width: 768px) {
            body {
                padding-top: 0; /* No padding-top as navbar is no longer fixed-top, it's part of content */
            }
            .sidebar {
                transform: translateX(-250px); /* Hide sidebar by default on small screens */
                position: fixed; /* Keep it fixed for off-canvas effect */
                height: 100%;
                top: 0;
                left: 0;
            }
            .sidebar.show { /* Class to show sidebar when toggled */
                transform: translateX(0);
            }
            .content-wrapper {
                margin-left: 0; /* No left margin on mobile */
                padding: 15px; /* Adjust padding */
            }
            .content-wrapper.full-width {
                 margin-left: 0; /* Always 0 margin on mobile */
            }
            .top-navbar {
                border-radius: 0; /* Full width on mobile */
                margin-bottom: 20px;
                padding: 15px 20px;
            }
            .sidebar-toggle {
                display: block; /* Show toggle button on small screens */
            }
            .dashboard-card {
                padding: 20px;
                margin-bottom: 20px;
            }
            .dashboard-card h5.card-title {
                font-size: 1.3rem;
            }
            .dashboard-card p.card-text .balance-label {
                font-size: 1.3rem;
            }
            .quick-actions-card .action-link {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Sidebar Navigation -->
        <div class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <h4>Welcome!</h4>
                <p>User Dashboard</p>
            </div>
            <a href="UserDashboard.aspx" class="active"><i class="fas fa-home"></i> Dashboard</a>
            <a href="Deposit.aspx"><i class="fas fa-money-check-alt"></i> Deposit</a>
            <a href="Withdraw.aspx"><i class="fas fa-hand-holding-usd"></i> Withdraw</a>
            <a href="Transfer.aspx"><i class="fas fa-exchange-alt"></i> Transfer</a>
            <a href="ViewStatement.aspx"><i class="fas fa-file-invoice"></i> View Statement</a>
            <a href="LockerRequest.aspx"><i class="fas fa-lock"></i> Locker</a>
            <a href="ChangePassword.aspx"><i class="fas fa-lock"></i> ChangePassword</a>
           

            <hr style="border-color: rgba(255,255,255,0.1); margin: 20px 0;" />
            <a href="Login.aspx"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>

        <!-- Main Content -->
        <div class="content-wrapper" id="contentWrapper">
            <!-- Top Dashboard Bar -->
            <div class="top-navbar">
                <button class="sidebar-toggle" id="sidebarToggle">
                    <i class="fas fa-bars"></i>
                </button>
                <h2>User Dashboard</h2>
            </div>

            <div class="container-fluid">
                <h3 class="mb-4 text-primary font-weight-bold animate__animated animate__fadeInDown">Hello, <asp:Label ID="lblName" runat="server" Font-Bold="true" CssClass="text-secondary" />!</h3>

                <div class="row">
                    <!-- Account Summary Card -->
                    <div class="col-lg-6 col-md-12 mb-4">
                        <div class="dashboard-card shadow">
                            <h5 class="card-title"><i class="fas fa-university"></i> Account Summary</h5>
                            <h6 class="card-subtitle">Account Number: <asp:Label ID="lblAccount" runat="server" /></h6>
                            <p class="card-text">Available Balance: ₹<asp:Label ID="lblBalance" runat="server" Font-Bold="true" CssClass="balance-label" /></p>
                            <p class="text-muted small">Last updated: <%= DateTime.Now.ToString("dd MMM yyyy, hh:mm tt") %></p>
                        </div>
                    </div>

                    <!-- Quick Actions Card -->
                    <div class="col-lg-6 col-md-12 mb-4">
                        <div class="dashboard-card shadow quick-actions-card">
                            <h5 class="card-title"><i class="fas fa-bolt"></i> Quick Actions</h5>
                            <div>
                                <a href="Deposit.aspx" class="action-link"><i class="fas fa-plus-circle"></i> Make a Deposit</a>
                                <a href="Withdraw.aspx" class="action-link"><i class="fas fa-minus-circle"></i> Withdraw Funds</a>
                                <a href="Transfer.aspx" class="action-link"><i class="fas fa-paper-plane"></i> Transfer Money</a>
                                <a href="LockerRequest.aspx" class="action-link"><i class="fas fa-key"></i> Request Locker</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Activity Section -->
                <div class="row">
                    <div class="col-12">
                        <div class="dashboard-card shadow">
                            <h5 class="card-title"><i class="fas fa-history"></i> Recent Activity</h5>
                            <div class="recent-activity-list">
                                <!-- Example static data; typically populated from backend -->
                                <div class="recent-activity-item">
                                    <span class="activity-icon text-success"><i class="fas fa-arrow-circle-down"></i></span>
                                    <div class="activity-details">
                                        <strong>Online Deposit</strong>
                                        <small>25 Jun 2025, 10:30 AM</small>
                                    </div>
                                    <span class="activity-amount credit">+ ₹5,000.00</span>
                                </div>
                                <div class="recent-activity-item">
                                    <span class="activity-icon text-danger"><i class="fas fa-arrow-circle-up"></i></span>
                                    <div class="activity-details">
                                        <strong>ATM Withdrawal</strong>
                                        <small>24 Jun 2025, 03:15 PM</small>
                                    </div>
                                    <span class="activity-amount debit">- ₹1,000.00</span>
                                </div>
                                <div class="recent-activity-item">
                                    <span class="activity-icon text-info"><i class="fas fa-exchange-alt"></i></span>
                                    <div class="activity-details">
                                        <strong>Fund Transfer to Account XXXXX1234</strong>
                                        <small>23 Jun 2025, 11:00 AM</small>
                                    </div>
                                    <span class="activity-amount debit">- ₹2,500.00</span>
                                </div>
                                <div class="recent-activity-item">
                                    <span class="activity-icon text-success"><i class="fas fa-arrow-circle-down"></i></span>
                                    <div class="activity-details">
                                        <strong>Salary Credit</strong>
                                        <small>20 Jun 2025, 09:00 AM</small>
                                    </div>
                                    <span class="activity-amount credit">+ ₹45,000.00</span>
                                </div>
                                <div class="recent-activity-item">
                                    <span class="activity-icon text-danger"><i class="fas fa-shopping-cart"></i></span>
                                    <div class="activity-details">
                                        <strong>Online Purchase - E-commerce</strong>
                                        <small>18 Jun 2025, 05:40 PM</small>
                                    </div>
                                    <span class="activity-amount debit">- ₹850.00</span>
                                </div>
                                <div class="recent-activity-item">
                                    <span class="activity-icon text-info"><i class="fas fa-lightbulb"></i></span>
                                    <div class="activity-details">
                                        <strong>Bill Payment - Electricity</strong>
                                        <small>17 Jun 2025, 02:00 PM</small>
                                    </div>
                                    <span class="activity-amount debit">- ₹1,200.00</span>
                                </div>
                            </div>
                             <a href="ViewStatement.aspx" class="btn btn-outline-primary mt-4">View Full Statement <i class="fas fa-chevron-right ml-2"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>

    <!-- Bootstrap JS, Popper.js, and jQuery (required for Bootstrap 4) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Custom JavaScript for Sidebar Toggle -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const sidebarToggle = document.getElementById('sidebarToggle');
            const sidebar = document.getElementById('sidebar');
            const contentWrapper = document.getElementById('contentWrapper');

            if (sidebarToggle && sidebar && contentWrapper) {
                sidebarToggle.addEventListener('click', function () {
                    sidebar.classList.toggle('show'); // Toggle sidebar visibility
                    contentWrapper.classList.toggle('full-width'); // Adjust content margin
                });

                // Close sidebar when clicking outside on mobile
                contentWrapper.addEventListener('click', function (event) {
                    if (sidebar.classList.contains('show') && window.innerWidth <= 768 && !sidebar.contains(event.target) && !sidebarToggle.contains(event.target)) {
                        sidebar.classList.remove('show');
                        contentWrapper.classList.remove('full-width');
                    }
                });

                // Adjust sidebar state on resize
                window.addEventListener('resize', function () {
                    if (window.innerWidth > 768) {
                        sidebar.classList.remove('show'); // Ensure sidebar is always visible on large screens
                        contentWrapper.classList.remove('full-width'); // Ensure content has margin on large screens
                    } else {
                        // On small screens, hide sidebar by default unless toggled
                        sidebar.classList.remove('show');
                        contentWrapper.classList.remove('full-width');
                    }
                });
            }
        });
    </script>
</body>
</html>
