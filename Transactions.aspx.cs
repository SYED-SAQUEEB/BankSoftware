using System;
using System.Data;
using System.Data.SqlClient;

public partial class Transactions : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("Login.aspx");

        if (!IsPostBack)
            LoadTransactionHistory();
    }

    private void LoadTransactionHistory()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();

            // Get AccountID of the user
            SqlCommand cmd = new SqlCommand("SELECT AccountID FROM Accounts WHERE UserID = @uid", con);
            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);

            object result = cmd.ExecuteScalar();
            if (result == null)
                return;

            int accountId = Convert.ToInt32(result);

            // Get transactions
            SqlCommand txnCmd = new SqlCommand(@"
                SELECT TransactionDate, TransactionType, Amount, Description, TargetAccount, RunningBalanceAfterTransaction
                FROM Transactions
                WHERE AccountID = @accId
                ORDER BY TransactionDate DESC", con);

            txnCmd.Parameters.AddWithValue("@accId", accountId);

            SqlDataAdapter da = new SqlDataAdapter(txnCmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvTransactions.DataSource = dt;
            gvTransactions.DataBind();
        }
    }
}
