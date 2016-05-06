using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
   
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
        if (GridView1.Rows.Count == 1)
        {
            GridView1.SelectedIndex = 0;
            string username = GridView1.SelectedRow.Cells[0].Text;
            string isAdmin = GridView1.SelectedRow.Cells[2].Text;
            Session["username"] = username;
            if (isAdmin == "Y")
            {
                Response.Redirect("AdminPage.aspx");
            }
            else
            {
                Response.Redirect("HomePage.aspx");
            }
        }
        else
        {
            LoginError.Visible = true;
            
        }
        
    }
}