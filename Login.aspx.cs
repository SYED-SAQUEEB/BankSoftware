// Login.aspx.cs - Full Code with Admin Redirection
using System;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        // Clear session on load
        Session.Clear();
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();

        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT UserID, FullName, IsManager FROM Users WHERE Username = @username AND PasswordHash = @password", con);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();
                Session["UserID"] = reader["UserID"].ToString();
                Session["FullName"] = reader["FullName"].ToString();
                Session["IsManager"] = reader["IsManager"].ToString();

                if (Session["IsManager"].ToString() == "1")
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    Response.Redirect("UserDashboard.aspx");
                }
            }
            else
            {
                lblMsg.Text = "Invalid username or password!";
                lblMsg.ForeColor = System.Drawing.Color.Red;

            }
        }
    }
}
