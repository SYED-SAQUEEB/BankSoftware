using System;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Register : System.Web.UI.Page
{
    string conStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        try
        {
            string accountNumber = "AC" + Guid.NewGuid().ToString().Substring(0, 8).ToUpper();
            string passwordHash = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string insertUser = @"INSERT INTO Users (AccountNumber, FullName, DOB, Address, Phone, Email, Username, PasswordHash)
                                      VALUES (@AccNo, @FullName, @DOB, @Addr, @Phone, @Email, @User, @Pwd);
                                      SELECT SCOPE_IDENTITY();";

                SqlCommand cmd = new SqlCommand(insertUser, con);
                cmd.Parameters.AddWithValue("@AccNo", accountNumber);
                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@Addr", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@User", txtUsername.Text);
                cmd.Parameters.AddWithValue("@Pwd", passwordHash);

                con.Open();
                object newUserId = cmd.ExecuteScalar();

                if (newUserId != null)
                {
                    SqlCommand accCmd = new SqlCommand("INSERT INTO Accounts (UserID, AccountNumber, Balance) VALUES (@UserID, @AccNo, 0)", con);
                    accCmd.Parameters.AddWithValue("@UserID", newUserId);
                    accCmd.Parameters.AddWithValue("@AccNo", accountNumber);
                    accCmd.ExecuteNonQuery();

                    lblMsg.ForeColor = System.Drawing.Color.LimeGreen;
                    lblMsg.Text = "🎉 Account created successfully! Your A/C No: " + accountNumber;
                }
                else
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "❌ Something went wrong. Try again!";
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "❌ Error: " + ex.Message;
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

}
