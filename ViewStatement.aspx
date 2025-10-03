<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewStatement.aspx.cs" Inherits="ViewStatement" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>View Statement - Aurangabad Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            color: white;
            font-family: 'Segoe UI', sans-serif;
        }
        .statement-box {
            max-width: 1000px;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.07);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px black;
        }
        .btn, .form-control {
            border-radius: 10px;
        }
        h2 {
            color: #00ffff;
            text-align: center;
            margin-bottom: 25px;
            text-shadow: 1px 1px 2px black;
        }
        .table {
            color: white;
        }
        .back-btn {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="statement-box">
            <asp:Button ID="btnBack" runat="server" Text="← Back to Dashboard" CssClass="btn btn-secondary back-btn" OnClick="btnBack_Click" />

            <h2>📄 Transaction Statement</h2>

            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                        <asp:ListItem Text="All" Value="All" />
                        <asp:ListItem Text="Deposit" Value="Deposit" />
                        <asp:ListItem Text="Withdraw" Value="Withdraw" />
                        <asp:ListItem Text="Transfer" Value="Transfer" />
                        <asp:ListItem Text="Received" Value="Received" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="From Date (yyyy-mm-dd)"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="To Date (yyyy-mm-dd)"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnFilter" runat="server" CssClass="btn btn-info w-100" Text="Filter" OnClick="btnFilter_Click" />
                </div>
            </div>

            <asp:GridView ID="gvTransactions" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="TransactionDate" HeaderText="Date" />
                    <asp:BoundField DataField="TransactionType" HeaderText="Type" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="TargetAccount" HeaderText="Target Account" />
                    <asp:BoundField DataField="RunningBalanceAfterTransaction" HeaderText="Balance After" />
                </Columns>
            </asp:GridView>

            <div class="text-center mt-4">
                <asp:Button ID="btnExport" runat="server" CssClass="btn btn-success" Text="⬇ Export to CSV" OnClick="btnExport_Click" />
            </div>
        </div>
    </form>
</body>
</html>
