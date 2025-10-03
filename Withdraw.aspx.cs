using System;
using System.Data.SqlClient;

public partial class Withdraw : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("Login.aspx");
    }

    protected void btnWithdraw_Click(object sender, EventArgs e)
    {
        decimal withdrawAmount;
        if (!decimal.TryParse(txtAmount.Text, out withdrawAmount) || withdrawAmount <= 0)
        {
            lblMsg.Text = "❌ Please enter a valid positive amount.";
            lblMsg.ForeColor = System.Drawing.Color.Red;
            return;
        }

        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();

            // Get user's AccountID and current balance
            SqlCommand getAcc = new SqlCommand("SELECT AccountID, Balance FROM Accounts WHERE UserID = @uid", con);
            getAcc.Parameters.AddWithValue("@uid", Session["UserID"]);

            SqlDataReader dr = getAcc.ExecuteReader();
            if (!dr.Read())
            {
                lblMsg.Text = "❌ Account not found!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            int accountId = Convert.ToInt32(dr["AccountID"]);
            decimal currentBalance = Convert.ToDecimal(dr["Balance"]);
            dr.Close();

            if (withdrawAmount > currentBalance)
            {
                lblMsg.Text = "❌ Insufficient balance!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            decimal newBalance = currentBalance - withdrawAmount;

            // Update balance
            SqlCommand updateBal = new SqlCommand("UPDATE Accounts SET Balance = @bal WHERE AccountID = @accId", con);
            updateBal.Parameters.AddWithValue("@bal", newBalance);
            updateBal.Parameters.AddWithValue("@accId", accountId);
            updateBal.ExecuteNonQuery();

            // Insert into Transactions table
            SqlCommand insertTxn = new SqlCommand(@"
                INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate, Description, RunningBalanceAfterTransaction)
                VALUES (@accId, 'Withdraw', @amt, GETDATE(), @desc, @bal)", con);

            insertTxn.Parameters.AddWithValue("@accId", accountId);
            insertTxn.Parameters.AddWithValue("@amt", withdrawAmount);
            insertTxn.Parameters.AddWithValue("@desc", "Cash withdrawal");
            insertTxn.Parameters.AddWithValue("@bal", newBalance);
            insertTxn.ExecuteNonQuery();

            lblMsg.Text = string.Format("✅ ₹{0:N2} withdrawn successfully! New Balance: ₹{1:N2}", withdrawAmount, newBalance);
            lblMsg.ForeColor = System.Drawing.Color.LimeGreen;
            txtAmount.Text = "";
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserDashboard.aspx");
    }
}
