using System;
using System.Data.SqlClient;

public partial class Deposit : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("Login.aspx");
    }

    protected void btnDeposit_Click(object sender, EventArgs e)
    {
        decimal amount;
        if (decimal.TryParse(txtAmount.Text, out amount) && amount > 0)
        {
            int userId = Convert.ToInt32(Session["UserID"]);
            string description = txtDescription.Text;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                SqlCommand getAcc = new SqlCommand("SELECT AccountID, Balance FROM Accounts WHERE UserID = @uid", con);
                getAcc.Parameters.AddWithValue("@uid", userId);

                SqlDataReader dr = getAcc.ExecuteReader();
                if (dr.Read())
                {
                    int accId = Convert.ToInt32(dr["AccountID"]);
                    decimal currentBalance = Convert.ToDecimal(dr["Balance"]);
                    dr.Close();

                    decimal newBalance = currentBalance + amount;

                    SqlCommand update = new SqlCommand("UPDATE Accounts SET Balance = @bal WHERE AccountID = @accid", con);
                    update.Parameters.AddWithValue("@bal", newBalance);
                    update.Parameters.AddWithValue("@accid", accId);
                    update.ExecuteNonQuery();

                    SqlCommand insert = new SqlCommand(@"
                        INSERT INTO Transactions(AccountID, TransactionType, Amount, Description, TargetAccount, RunningBalanceAfterTransaction)
                        VALUES(@acc, 'Deposit', @amt, @desc, NULL, @bal)", con);
                    insert.Parameters.AddWithValue("@acc", accId);
                    insert.Parameters.AddWithValue("@amt", amount);
                    insert.Parameters.AddWithValue("@desc", description);
                    insert.Parameters.AddWithValue("@bal", newBalance);
                    insert.ExecuteNonQuery();

                    lblMsg.Text = "✅ Deposit Successful!";
                }
                else
                {
                    lblMsg.Text = "⚠️ Account not found.";
                }
            }
        }
        else
        {
            lblMsg.Text = "⚠️ Enter a valid amount.";
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserDashboard.aspx");
    }
}
