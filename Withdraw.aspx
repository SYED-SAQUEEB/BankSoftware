<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Withdraw.aspx.cs" Inherits="Withdraw" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Aurangabad Bank - Withdraw</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color: white;
            margin: 0;
        }
        .header, .footer {
            background-color: #001f3f;
            padding: 15px;
            text-align: center;
            color: white;
            font-weight: bold;
        }
        .withdraw-box {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 30px;
            max-width: 500px;
            margin: 40px auto;
            box-shadow: 0 0 20px #000;
        }
        .form-control {
            border-radius: 10px;
        }
        .btn-primary, .btn-secondary {
            border-radius: 10px;
            width: 100%;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #00e6e6;
            text-shadow: 1px 1px 2px black;
        }
        .back-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #004a99;
            padding: 8px 18px;
            border-radius: 20px;
            color: white;
            font-weight: bold;
            border: none;
            text-decoration: none;
            box-shadow: 0 2px 6px rgba(0,0,0,0.3);
        }
        .back-btn:hover {
            background-color: #0066cc;
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Header -->
        <div class="header">
            <h1>Aurangabad Bank</h1>
            <small>Secure Withdraw Portal</small>
        </div>

        <!-- Back to Dashboard -->
        <a href="UserDashboard.aspx" class="back-btn">← Back</a>

        <!-- Withdraw Form -->
        <div class="withdraw-box">
            <h2>💸 Withdraw Funds</h2>

            <div class="mb-3">
                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="Enter amount to withdraw" TextMode="SingleLine" />
            </div>

            <div class="mb-3">
                <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" placeholder="Remarks (optional)" />
            </div>

            <div class="mb-3">
                <asp:Button ID="btnWithdraw" runat="server" CssClass="btn btn-primary" Text="Withdraw Now" OnClick="btnWithdraw_Click" />
            </div>

            <div class="text-center mt-3">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="true" ForeColor="Lime" />
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            &copy; 2025 Aurangabad Bank. All Rights Reserved.
        </div>

    </form>
</body>
</html>
