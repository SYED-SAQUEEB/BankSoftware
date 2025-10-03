using System;
using System.Web.UI;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Optional: You can use this to log visits, track analytics, or handle future logic

        // Example: Clear session on landing page
        Session.Clear();
    }
}
