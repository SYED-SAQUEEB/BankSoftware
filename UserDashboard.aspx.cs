using System;
using System.Data.SqlClient;

public partial class UserDashboard : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("Login.aspx");

        if (!IsPostBack)
        {
            LoadUserData();
        }
    }

    private void LoadUserData()
    {
        int userId = Convert.ToInt32(Session["UserID"]);

        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("SELECT U.FullName, A.AccountNumber, A.Balance FROM Users U JOIN Accounts A ON U.UserID = A.UserID WHERE U.UserID = @id", con);
            cmd.Parameters.AddWithValue("@id", userId);
            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblName.Text = reader["FullName"].ToString();
                lblAccount.Text = reader["AccountNumber"].ToString();
                lblBalance.Text = Convert.ToDecimal(reader["Balance"]).ToString("N2");
            }
        }
    }

    protected void btnDeposit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Deposit.aspx");
    }

    protected void btnWithdraw_Click(object sender, EventArgs e)
    {
        Response.Redirect("Withdraw.aspx");
    }

    protected void btnTransfer_Click(object sender, EventArgs e)
    {
        Response.Redirect("Transfer.aspx");
    }

    protected void btnStatement_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewStatement.aspx");
    }

    protected void btnLocker_Click(object sender, EventArgs e)
    {
        Response.Redirect("LockerRequest.aspx");
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}
