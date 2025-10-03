using System;
using System.Data;
using System.Data.SqlClient;

public partial class AdminDashboard : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadBankBalance();
            LoadTotalTransactions();
            LoadUsers();
        }
    }

    // ✅ Load total bank balance from Accounts table
    private void LoadBankBalance()
    {
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT SUM(Balance) FROM Accounts"; // Ensure 'Balance' column exists in 'Accounts' table
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            object result = cmd.ExecuteScalar();
            conn.Close();

            decimal total = (result != DBNull.Value) ? Convert.ToDecimal(result) : 0;
            lblTotalBankAmount.Text = "$" + total.ToString("N2");
        }
    }

    // ✅ Load total transaction count from Transactions table
    private void LoadTotalTransactions()
    {
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT COUNT(*) FROM Transactions"; // Ensure 'Transactions' table exists
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            int totalTransactions = (int)cmd.ExecuteScalar();
            conn.Close();

            lblTotalTransactions.Text = totalTransactions.ToString("N0");
        }
    }

    // ✅ Load all users into GridView (without AccountNo column)
    private void LoadUsers()
    {
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT UserID, FullName, Email FROM Users"; // 'AccountNo' removed from query
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvUsers.DataSource = dt;
            gvUsers.DataBind();
        }
    }

    // ✅ Logout
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("AdminLogin.aspx");
    }
}
