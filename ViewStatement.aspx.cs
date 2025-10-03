using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

public partial class ViewStatement : System.Web.UI.Page
{
    string connStr = "Data Source=SYEDSAQUEEB\\SQLEXPRESS;Initial Catalog=AurangabadBankDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("Login.aspx");

        if (!IsPostBack)
        {
            LoadTransactions("All", "", ""); // ✅ Pass all values explicitly

        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserDashboard.aspx");
    }

    // ✅ Fixed for Visual Studio 2013
    private void LoadTransactions(string type, string fromDate, string toDate)

    {
        int userId = Convert.ToInt32(Session["UserID"]);

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = @"
                SELECT T.TransactionDate, T.TransactionType, T.Amount, T.Description, T.TargetAccount, T.RunningBalanceAfterTransaction
                FROM Transactions T
                JOIN Accounts A ON T.AccountID = A.AccountID
                WHERE A.UserID = @uid";

            if (type != "All")
                query += " AND T.TransactionType = @type";

            if (!string.IsNullOrEmpty(fromDate) && !string.IsNullOrEmpty(toDate))
                query += " AND T.TransactionDate BETWEEN @from AND @to";

            query += " ORDER BY T.TransactionDate DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@uid", userId);

            if (type != "All")
                cmd.Parameters.AddWithValue("@type", type);

            if (!string.IsNullOrEmpty(fromDate) && !string.IsNullOrEmpty(toDate))
            {
                cmd.Parameters.AddWithValue("@from", fromDate);
                cmd.Parameters.AddWithValue("@to", toDate);
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvTransactions.DataSource = dt;
            gvTransactions.DataBind();

            ViewState["TransactionData"] = dt; // for export
        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        string type = ddlType.SelectedValue;
        string from = txtFromDate.Text.Trim();
        string to = txtToDate.Text.Trim();
        LoadTransactions(type, from, to);
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        DataTable dt = ViewState["TransactionData"] as DataTable;
        if (dt == null || dt.Rows.Count == 0) return;

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Statement.csv");
        Response.Charset = "";
        Response.ContentType = "application/text";

        using (StringWriter sw = new StringWriter())
        {
            // Column headers
            for (int i = 0; i < dt.Columns.Count; i++)
            {
                sw.Write("\"" + dt.Columns[i] + "\",");
            }
            sw.Write(sw.NewLine);

            // Rows
            foreach (DataRow row in dt.Rows)
            {
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    sw.Write("\"" + row[i].ToString().Replace(",", "") + "\",");
                }
                sw.Write(sw.NewLine);
            }

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }
}
