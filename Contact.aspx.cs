using System;
using System.Data.SqlClient;

public partial class Contact : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        string fullName = txtFullName.Text.Trim();
        string email = txtEmail.Text.Trim();
        string subject = txtSubject.Text.Trim();
        string message = txtMessage.Text.Trim();

        SqlConnection con = new SqlConnection(connStr);
        string query = "INSERT INTO ContactMessages (FullName, Email, Subject, Message, SubmittedOn) VALUES (@FullName, @Email, @Subject, @Message, GETDATE())";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@FullName", fullName);
        cmd.Parameters.AddWithValue("@Email", email);
        cmd.Parameters.AddWithValue("@Subject", subject);
        cmd.Parameters.AddWithValue("@Message", message);

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            // Optional: Display a simple message (you can use Label or Response.Write)
            Response.Write("<script>alert('Message sent successfully!');</script>");

            // Clear input fields
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
        }
    }
}
