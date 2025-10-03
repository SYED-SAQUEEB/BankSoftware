<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LockerRequest.aspx.cs" Inherits="LockerRequest" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Locker Request - Aurangabad Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            font-family: 'Segoe UI', sans-serif;
            color: white;
        }

        .container {
            max-width: 600px;
            margin-top: 80px;
        }

        .header, .footer {
            background-color: #001f3f;
            padding: 15px;
            text-align: center;
            color: white;
            font-weight: bold;
        }

        .form-box {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 20px #000;
        }

        .form-control {
            border-radius: 10px;
        }

        .btn-style {
            border-radius: 10px;
            width: 100%;
        }

        .back-btn {
            background-color: #ffcc00;
            border: none;
            color: black;
            font-weight: bold;
            border-radius: 25px;
            padding: 8px 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Header -->
        <div class="header">
            <h2>Locker Request</h2>
        </div>

        <!-- Locker Form -->
        <div class="container">
            <div class="form-box">
                <h4 class="text-center text-warning mb-4">🗄️ Apply for a Bank Locker</h4>

                <div class="mb-3">
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:DropDownList ID="ddlLockerSize" runat="server" CssClass="form-control">
                        <asp:ListItem Text="-- Select Locker Size --" Value="" />
                        <asp:ListItem Text="Small" Value="Small" />
                        <asp:ListItem Text="Medium" Value="Medium" />
                        <asp:ListItem Text="Large" Value="Large" />
                    </asp:DropDownList>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Reason for Locker Request"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Button ID="btnRequest" runat="server" Text="Submit Request" CssClass="btn btn-warning btn-style" OnClick="btnRequest_Click" />
                </div>

                <asp:Label ID="lblMessage" runat="server" Font-Bold="true" ForeColor="Lime" />
            </div>

            <div class="mt-3 text-center">
                <a href="UserDashboard.aspx" class="back-btn">⬅ Back to Dashboard</a>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer mt-5">
            &copy; 2025 Aurangabad Bank | Locker Facility
        </div>

    </form>
</body>
</html>
