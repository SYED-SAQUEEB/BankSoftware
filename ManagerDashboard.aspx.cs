using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class ManagerDashboard : System.Web.UI.Page
{
    string conStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ManagerUsername"] != null)
            {
                lblWelcome.Text = "Welcome, " + Session["ManagerUsername"].ToString();
                LoadDashboardData();
            }
            else
            {
                // Redirect to ManagerLogin if session not found
                Response.Redirect("ManagerLogin.aspx");
            }
        }
    }

    private void LoadDashboardData()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            con.Open();

            // Total Bank Amount (sum of all balances)
            using (SqlCommand cmd = new SqlCommand("SELECT SUM(Balance) FROM Accounts", con))
            {
                object result = cmd.ExecuteScalar();
                lblTotalAmount.Text = result != DBNull.Value ? "₹ " + Convert.ToDecimal(result).ToString("N2") : "₹ 0.00";
            }

            // Total Deposits
            using (SqlCommand cmd = new SqlCommand("SELECT SUM(Amount) FROM Transactions WHERE TransactionType = 'Deposit'", con))
            {
                object result = cmd.ExecuteScalar();
                lblDeposits.Text = result != DBNull.Value ? "₹ " + Convert.ToDecimal(result).ToString("N2") : "₹ 0.00";
            }

            // Total Withdrawals
            using (SqlCommand cmd = new SqlCommand("SELECT SUM(Amount) FROM Transactions WHERE TransactionType = 'Withdraw'", con))
            {
                object result = cmd.ExecuteScalar();
                lblWithdrawals.Text = result != DBNull.Value ? "₹ " + Convert.ToDecimal(result).ToString("N2") : "₹ 0.00";
            }
        }
    }

    protected void btnViewUsers_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewAllUsers.aspx");
    }
}
