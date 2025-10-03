<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Transfer.aspx.cs" Inherits="Transfer" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Transfer Funds - Aurangabad Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4CAF50; /* Green */
            --secondary-color: #6c757d; /* Grey */
            --accent-color: #FFC107; /* Amber */
            --background-dark: #1A293F;
            --background-light: #2A3B52;
            --text-color-light: #E0E0E0;
            --card-background: rgba(255, 255, 255, 0.08);
            --border-radius: 12px;
            --box-shadow: 0 8px 30px rgba(0, 0, 0, 0.4);
        }

        body {
            background: linear-gradient(to right, var(--background-dark), var(--background-light));
            font-family: 'Poppins', sans-serif;
            color: var(--text-color-light);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 20px;
        }

        .transfer-container {
            background-color: var(--card-background);
            border-radius: var(--border-radius);
            padding: 40px;
            width: 100%;
            max-width: 550px;
            box-shadow: var(--box-shadow);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        h2 {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 35px;
            font-weight: 600;
            font-size: 2.2rem;
            letter-spacing: 1px;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: var(--border-radius);
            color: var(--text-color-light);
            padding: 12px 18px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.25);
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(76, 175, 80, 0.25); /* Primary color with transparency */
            color: var(--text-color-light);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            border-radius: var(--border-radius);
            padding: 12px 0;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 15px rgba(76, 175, 80, 0.4);
        }

        .btn-primary:hover {
            background-color: #43A047; /* Slightly darker green */
            border-color: #43A047;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(76, 175, 80, 0.5);
        }

        .btn-secondary {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            border-radius: var(--border-radius);
            padding: 10px 20px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
            transform: translateY(-1px);
        }

        .btn-back-container {
            text-align: left;
            margin-bottom: 25px;
        }

        .alert-message {
            margin-top: 25px;
            font-size: 1.05rem;
            text-align: center;
            padding: 15px;
            border-radius: var(--border-radius);
            font-weight: 500;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .alert-success {
            background-color: rgba(76, 175, 80, 0.2); /* Primary color with transparency */
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
        }

        .alert-danger {
            background-color: rgba(220, 53, 69, 0.2); /* Red with transparency */
            color: #dc3545;
            border: 1px solid #dc3545;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="transfer-container">
            <div class="btn-back-container">
                <asp:Button ID="btnBack" runat="server" Text="← Back to Dashboard" CssClass="btn btn-secondary" OnClick="btnBack_Click" />
            </div>

            <h2>💸 Secure Fund Transfer</h2>

            <div class="mb-3">
                <asp:TextBox ID="txtTargetAccount" runat="server" CssClass="form-control" placeholder="Recipient Account Number"></asp:TextBox>
            </div>

            <div class="mb-3">
<asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="Amount to Transfer (e.g., 500.00)" TextMode="SingleLine"></asp:TextBox>
>
            </div>

            <div class="mb-4">
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Description (Optional)"></asp:TextBox>
            </div>

            <div class="mb-3">
                <asp:Button ID="btnTransfer" runat="server" CssClass="btn btn-primary" Text="Complete Transfer" OnClick="btnTransfer_Click" />
            </div>

            <div class="text-center">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="true" CssClass="alert-message" />
            </div>
        </div>
    </form>
</body>
</html>