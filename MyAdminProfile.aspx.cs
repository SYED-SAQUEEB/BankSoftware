using System;
using System.Data.SqlClient;

public partial class MyAdminProfile : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadProfile();
        }
    }

    private void LoadProfile()
    {
        if (Session["AdminUsername"] == null)
        {
            Response.Redirect("AdminLogin.aspx");
            return;
        }

        string username = Session["AdminUsername"].ToString();

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM Admins WHERE Username = @Username";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", username);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                txtAdminName.Text = reader["AdminName"].ToString();
                txtEmail.Text = reader["Email"].ToString();
                txtUsername.Text = reader["Username"].ToString();
            }

            conn.Close();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string name = txtAdminName.Text;
        string email = txtEmail.Text;
        string username = txtUsername.Text;
        string password = txtPassword.Text;

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = string.IsNullOrEmpty(password)
                ? "UPDATE Admins SET AdminName=@Name, Email=@Email WHERE Username=@Username"
                : "UPDATE Admins SET AdminName=@Name, Email=@Email, Password=@Password WHERE Username=@Username";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Username", username);
            if (!string.IsNullOrEmpty(password))
                cmd.Parameters.AddWithValue("@Password", password);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        // SweetAlert success popup
        string script = "Swal.fire({ icon: 'success', title: 'Profile Updated!', text: 'Your admin profile has been updated.' });";
        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
    }
}
