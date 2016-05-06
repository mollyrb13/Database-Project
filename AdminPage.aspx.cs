using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Value == "Select A View")
        {
            AllConcertsGrid.Visible = false;
            TicketsGrid.Visible = false;
            UsersGrid.Visible = false;
            UserTicketsGrid.Visible = false;
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Value == "Concerts")
        {
            AllConcertsGrid.Visible = true;
            TicketsGrid.Visible = false;
            UsersGrid.Visible = false;
            UserTicketsGrid.Visible = false;
        }
        else if (DropDownList1.SelectedItem.Value == "Tickets")
        {
            AllConcertsGrid.Visible = false;
            TicketsGrid.Visible = true;
            UsersGrid.Visible = false;
            UserTicketsGrid.Visible = false;
        }
        else if (DropDownList1.SelectedItem.Value == "Users")
        {
            AllConcertsGrid.Visible = false;
            TicketsGrid.Visible = false;
            UsersGrid.Visible = true;
            UserTicketsGrid.Visible = false;
        }
        else if (DropDownList1.SelectedItem.Value == "User Purchases")
        {
            AllConcertsGrid.Visible = false;
            TicketsGrid.Visible = false;
            UsersGrid.Visible = false;
            UserTicketsGrid.Visible = true;
        }
    }

    protected void AllConcerts_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}