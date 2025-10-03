using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

public partial class AddAdmin : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        // No logic needed on page load
    }

    protected void btnRegisterAdmin_Click(object sender, EventArgs e)
    {
        string fullName = txtFullName.Text.Trim();
        string username = txtUsername.Text.Trim();
        string email = txtEmail.Text.Trim();
        string phone = txtPhone.Text.Trim();
        string password = txtPassword.Text.Trim();

        if (stringIsNullOrWhiteSpace(fullName) || stringIsNullOrWhiteSpace(username) ||
            stringIsNullOrWhiteSpace(email) || stringIsNullOrWhiteSpace(phone) ||
            stringIsNullOrWhiteSpace(password))
        {
            ShowAlert("Please fill all fields!", "warning");
            return;
        }

        string hashedPassword = ComputeSha256Hash(password);

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();

            SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Username = @username", conn);
            checkCmd.Parameters.AddWithValue("@username", username);
            int exists = (int)checkCmd.ExecuteScalar();

            if (exists > 0)
            {
                ShowAlert("Username already exists!", "error");
                return;
            }

            SqlCommand cmd = new SqlCommand(@"INSERT INTO Users 
                (FullName, Username, Email, Phone, PasswordHash, IsManager) 
                VALUES (@FullName, @Username, @Email, @Phone, @PasswordHash, 1)", conn);

            cmd.Parameters.AddWithValue("@FullName", fullName);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Phone", phone);
            cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);

            int rows = cmd.ExecuteNonQuery();

            if (rows > 0)
            {
                ClearForm();
                ShowAlert("Admin registered successfully!", "success");
            }
            else
            {
                ShowAlert("Registration failed!", "error");
            }
        }
    }

    private void ClearForm()
    {
        txtFullName.Text = "";
        txtUsername.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtPassword.Text = "";
    }

    private void ShowAlert(string message, string icon)
    {
        string script = "Swal.fire({" +
            "title: '" + message + "'," +
            "icon: '" + icon + "'," +
            "confirmButtonColor: '#007bff'" +
        "});";

        ClientScript.RegisterStartupScript(this.GetType(), "popup", script, true);
    }

    private string ComputeSha256Hash(string rawData)
    {
        using (SHA256 sha256 = SHA256.Create())
        {
            byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(rawData));
            StringBuilder sb = new StringBuilder();
            foreach (byte b in bytes)
                sb.Append(b.ToString("x2"));
            return sb.ToString();
        }
    }

    private bool stringIsNullOrWhiteSpace(string value)
    {
        return string.IsNullOrEmpty(value) || value.Trim().Length == 0;
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminDashboard.aspx");
    }
}
