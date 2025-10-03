using System;
using System.Data;
using System.Data.SqlClient;

public partial class AdminProfile : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AdminUsername"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            BindAdminGrid();
        }
    }

    private void BindAdminGrid()
    {
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM Admins";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvAdmins.DataSource = dt;
            gvAdmins.DataBind();
        }
    }

    protected void gvAdmins_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        gvAdmins.EditIndex = e.NewEditIndex;
        BindAdminGrid();
    }

    protected void gvAdmins_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        gvAdmins.EditIndex = -1;
        BindAdminGrid();
    }

    protected void gvAdmins_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        int adminId = Convert.ToInt32(gvAdmins.DataKeys[e.RowIndex].Value);
        string name = ((System.Web.UI.WebControls.TextBox)gvAdmins.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
        string email = ((System.Web.UI.WebControls.TextBox)gvAdmins.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        string username = ((System.Web.UI.WebControls.TextBox)gvAdmins.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
        string password = ((System.Web.UI.WebControls.TextBox)gvAdmins.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "UPDATE Admins SET AdminName=@Name, Email=@Email, Username=@Username, Password=@Password WHERE AdminID=@AdminID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.Parameters.AddWithValue("@AdminID", adminId);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        gvAdmins.EditIndex = -1;
        BindAdminGrid();
    }

    protected void gvAdmins_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        int adminId = Convert.ToInt32(gvAdmins.DataKeys[e.RowIndex].Value);

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "DELETE FROM Admins WHERE AdminID=@AdminID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@AdminID", adminId);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        BindAdminGrid();
    }
}
