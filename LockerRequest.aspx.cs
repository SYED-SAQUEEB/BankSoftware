using System;
using System.Data.SqlClient;

public partial class LockerRequest : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("Login.aspx");
    }

    protected void btnRequest_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand(@"INSERT INTO LockerRequests 
                (UserID, FullName, LockerSize, Reason, Status, RequestDate)
                VALUES (@uid, @fn, @size, @reason, 'Pending', GETDATE())", con);

            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);
            cmd.Parameters.AddWithValue("@fn", txtFullName.Text.Trim());
            cmd.Parameters.AddWithValue("@size", ddlLockerSize.SelectedValue);
            cmd.Parameters.AddWithValue("@reason", txtReason.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
            lblMessage.Text = "✅ Your locker request has been submitted!";
        }

        txtFullName.Text = "";
        ddlLockerSize.SelectedIndex = 0;
        txtReason.Text = "";
    }
}
