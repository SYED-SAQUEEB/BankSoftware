using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class ChangePassword : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        // No code here unless needed
    }

    protected void btnGenerateOTP_Click(object sender, EventArgs e)
    {
        Random rnd = new Random();
        int otp = rnd.Next(100000, 999999);
        Session["OTP"] = otp;
        lblOTPInfo.Text = "Your OTP is: <b>" + otp + "</b>";
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();
        string enteredOTP = txtOTP.Text.Trim();
        string newPassword = txtNewPassword.Text.Trim();
        string confirmPassword = txtConfirmPassword.Text.Trim();

        if (Session["OTP"] == null)
        {
            lblMessage.Text = "❌ Please generate an OTP first.";
            return;
        }

        if (enteredOTP != Session["OTP"].ToString())
        {
            lblMessage.Text = "❌ Invalid OTP.";
            return;
        }

        if (newPassword != confirmPassword)
        {
            lblMessage.Text = "❌ Passwords do not match.";
            return;
        }

        // Store as plain-text just for demo (NOT recommended for production)
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string query = "UPDATE Users SET PasswordHash = @Password WHERE Username = @Username";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Password", newPassword);
            cmd.Parameters.AddWithValue("@Username", username);

            int rows = cmd.ExecuteNonQuery();

            if (rows > 0)
            {
                lblMessage.Text = "✅ Password updated successfully!";
                Session["OTP"] = null;
            }
            else
            {
                lblMessage.Text = "❌ Username not found.";
            }
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        // Redirect back to the dashboard or login page (change URL as needed)
        Response.Redirect("UserDashboard.aspx");
    }

}
