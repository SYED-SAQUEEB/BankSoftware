using System;
using System.Web.UI;

public partial class Home : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Optional: Add logic to personalize the homepage based on user session
        // Example:
        // if (Session["UserName"] != null)
        // {
        //     lblWelcome.Text = "Welcome, " + Session["UserName"].ToString();
        // }
    }
}
