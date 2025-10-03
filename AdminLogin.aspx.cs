using System;
using System.Data.SqlClient;

public partial class AdminLogin : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        // Nothing needed for now
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT COUNT(*) FROM Admins WHERE Username=@Username AND Password=@Password";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", password);

            conn.Open();
            int count = (int)cmd.ExecuteScalar();
            conn.Close();

            if (count == 1)
            {
                // ✅ Login Success
                Session["AdminUsername"] = username;
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                // ❌ Login Failed
                string script = "Swal.fire('Login Failed','Invalid username or password!','error');";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
            }
        }
    }
}
