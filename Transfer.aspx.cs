using System;
using System.Data.SqlClient;

public partial class Transfer : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("Login.aspx");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserDashboard.aspx");
    }

    protected void btnTransfer_Click(object sender, EventArgs e)
    {
        string targetAccount = txtTargetAccount.Text.Trim();
        decimal amount;
        if (!decimal.TryParse(txtAmount.Text, out amount) || amount <= 0)
        {
            lblMsg.Text = "❌ Invalid amount.";
            lblMsg.ForeColor = System.Drawing.Color.Red;
            return;
        }

        string description = txtDescription.Text.Trim();
        int userId = Convert.ToInt32(Session["UserID"]);

        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();

            // Get sender account
            SqlCommand getSenderCmd = new SqlCommand("SELECT AccountID, Balance FROM Accounts WHERE UserID = @uid", con);
            getSenderCmd.Parameters.AddWithValue("@uid", userId);
            SqlDataReader reader = getSenderCmd.ExecuteReader();

            if (!reader.Read())
            {
                lblMsg.Text = "❌ Sender account not found.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            int senderAccountId = Convert.ToInt32(reader["AccountID"]);
            decimal senderBalance = Convert.ToDecimal(reader["Balance"]);
            reader.Close();

            if (senderBalance < amount)
            {
                lblMsg.Text = "❌ Insufficient funds.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Get target account
            SqlCommand getTargetCmd = new SqlCommand("SELECT AccountID, Balance FROM Accounts WHERE AccountNumber = @acc", con);
            getTargetCmd.Parameters.AddWithValue("@acc", targetAccount);
            reader = getTargetCmd.ExecuteReader();

            if (!reader.Read())
            {
                lblMsg.Text = "❌ Target account not found.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            int targetAccountId = Convert.ToInt32(reader["AccountID"]);
            decimal targetBalance = Convert.ToDecimal(reader["Balance"]);
            reader.Close();

            // Begin Transaction
            SqlTransaction transaction = con.BeginTransaction();

            try
            {
                // Deduct from sender
                SqlCommand deductCmd = new SqlCommand("UPDATE Accounts SET Balance = Balance - @amt WHERE AccountID = @id", con, transaction);
                deductCmd.Parameters.AddWithValue("@amt", amount);
                deductCmd.Parameters.AddWithValue("@id", senderAccountId);
                deductCmd.ExecuteNonQuery();

                // Add to receiver
                SqlCommand addCmd = new SqlCommand("UPDATE Accounts SET Balance = Balance + @amt WHERE AccountID = @id", con, transaction);
                addCmd.Parameters.AddWithValue("@amt", amount);
                addCmd.Parameters.AddWithValue("@id", targetAccountId);
                addCmd.ExecuteNonQuery();

                // Log sender transaction
                SqlCommand logSender = new SqlCommand(@"
                    INSERT INTO Transactions (AccountID, TransactionType, Amount, Description, TargetAccount, RunningBalanceAfterTransaction)
                    VALUES (@aid, 'Transfer', @amt, @desc, @target, 
                        (SELECT Balance FROM Accounts WHERE AccountID = @aid))", con, transaction);
                logSender.Parameters.AddWithValue("@aid", senderAccountId);
                logSender.Parameters.AddWithValue("@amt", amount);
                logSender.Parameters.AddWithValue("@desc", description);
                logSender.Parameters.AddWithValue("@target", targetAccount);
                logSender.ExecuteNonQuery();

                // Log receiver transaction
                SqlCommand logReceiver = new SqlCommand(@"
                    INSERT INTO Transactions (AccountID, TransactionType, Amount, Description, TargetAccount, RunningBalanceAfterTransaction)
                    VALUES (@aid, 'Received', @amt, @desc, @target, 
                        (SELECT Balance FROM Accounts WHERE AccountID = @aid))", con, transaction);
                logReceiver.Parameters.AddWithValue("@aid", targetAccountId);
                logReceiver.Parameters.AddWithValue("@amt", amount);
                logReceiver.Parameters.AddWithValue("@desc", "Received from: " + userId);
                logReceiver.Parameters.AddWithValue("@target", targetAccount);
                logReceiver.ExecuteNonQuery();

                transaction.Commit();

                lblMsg.Text = "✅ Transfer successful.";
                lblMsg.ForeColor = System.Drawing.Color.LightGreen;
                txtTargetAccount.Text = "";
                txtAmount.Text = "";
                txtDescription.Text = "";
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                lblMsg.Text = "❌ Error: " + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
