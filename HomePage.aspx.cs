using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        calendar1.SelectedDates.Clear();
        
      
        Label1.Text = "Welcome to your TuTickets.com Dashboard, " + Session["username"] + "!";
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            GridView1.SelectedIndex = i;
            string date = GridView1.SelectedRow.Cells[2].Text;
            DateTime date1 = Convert.ToDateTime(date);
            calendar1.SelectedDates.Add(date1);
        }
        GridView1.SelectedIndex = -1;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("SearchPage.aspx");
    }

    protected void calendar1_SelectionChanged(object sender, EventArgs e)
    {

    }
}