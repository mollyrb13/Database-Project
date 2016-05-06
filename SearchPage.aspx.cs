using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        CreditCard.Visible = false;
        creditcardlabel.Visible = false;
        securitycode.Visible = false;
        securitycodelbl.Visible = false;
        expirationlbl.Visible = false;
        ExpirationDate.Visible = false;
        Purchasebtn.Visible = false;
        CreditError.Visible = false;
        SecurityError.Visible = false;
        ExpError.Visible = false;
        
        if(GridView1.SelectedValue != null)
        {
            GridView1.Visible = true;
            CreditCard.Visible = true;
            creditcardlabel.Visible = true;
            securitycode.Visible = true;
            securitycodelbl.Visible = true;
            expirationlbl.Visible = true;
            ExpirationDate.Visible = true;
            Purchasebtn.Visible = true;
            CreditError.Visible = false;
            SecurityError.Visible = false;
            ExpError.Visible = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        numtixlbl.Visible = true;
        DropDownList2.Visible = true;

        GridView1.Columns[1].Visible = false;

        
        if (DropDownList1.SelectedValue == "Venue")
        {
            GridView1.DataSourceID = "VenueSearch";
            
        }
        if (DropDownList1.SelectedValue == "Artist")
        {
            GridView1.DataSourceID = "ArtistSearch";
            
        }
        else
        {
            GridView1.DataSourceID = "CitySearch";
            
        }
        GridView1.DataBind();
        GridView1.Visible = true;

        int number = GridView1.Rows.Count;

        if (number == 0)
        {
            NoResults.Visible = true;
            ConcertBought.Text = "";
            CreditError.Visible = false;
            SecurityError.Visible = false;
            ExpError.Visible = false;
        }
        else
        {
            NoResults.Visible = false;
            ConcertBought.Text = "";
            CreditError.Visible = false;
            SecurityError.Visible = false;
            ExpError.Visible = false;
        }


        GridView1.SelectedIndex = -1;
        Price.Text = "";
        CreditCard.Visible = false;
        creditcardlabel.Visible = false;
        securitycode.Visible = false;
        securitycodelbl.Visible = false;
        expirationlbl.Visible = false;
        ExpirationDate.Visible = false;
        Purchasebtn.Visible = false;

    }


    protected void GridView1_SelectedIndexChanged1(Object sender, EventArgs e)
    {
        DropDownList2.Visible = false;
        numtixlbl.Visible = false;
        CreditCard.Text = "";
        securitycode.Text = "";
        ExpirationDate.Text = "";
        GridViewRow key = GridView1.SelectedRow;
        GridView1.Visible = true;
        ConcertBought.Text = "You are going to see " + key.Cells[2].Text + "!";
        decimal amount = decimal.Parse(key.Cells[10].Text, NumberStyles.AllowCurrencySymbol | NumberStyles.AllowDecimalPoint);
        Price.Text = "Total: " + DropDownList2.SelectedValue + " ticket(s) priced at " + key.Cells[10].Text + " = $" + amount * (DropDownList2.SelectedIndex + 1);
        // decimal amount = decimal.Parse(key.Cells[9].Text, NumberStyles.AllowCurrencySymbol | NumberStyles.AllowDecimalPoint);
        CreditCard.Visible = true;
        creditcardlabel.Visible = true;
        securitycode.Visible = true;
        securitycodelbl.Visible = true;
        expirationlbl.Visible = true;
        ExpirationDate.Visible = true;
        Purchasebtn.Visible = true;

        string conID = GridView1.DataKeys[GridView1.SelectedRow.RowIndex].Value.ToString();

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "SELECT t.Tid FROM Tickets t WHERE t.Cid = @Concert AND t.Sold = 'FALSE'";
        cmd.Parameters.Add("@Concert", SqlDbType.NVarChar).Value = conID;

        cmd.Connection = conn;
        conn.Open();
        int ticketID = (int)cmd.ExecuteScalar();
        conn.Close();

        ViewState["ticketID"] = ticketID;
            
            
       
        
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }



    protected void Purchasebtn_Click(object sender, EventArgs e)
    {
        int myIntCredit;
        int myIntSecurity;
        bool isNumericalCredit = int.TryParse(CreditCard.Text, out myIntCredit);
        bool isNumericalSecurity = int.TryParse(securitycode.Text, out myIntSecurity);
        bool GoAhead = true;

        if ((CreditCard.Text.Length != 16) || (isNumericalCredit = false))
        {
            CreditError.Visible = true;
            GoAhead = false;
        }
        if ((securitycode.Text.Length != 3) || (isNumericalSecurity = false))
        {
            SecurityError.Visible = true;
            GoAhead = false;
        }
        if ((ExpirationDate.Text.Length != 5))
        {
            ExpError.Visible = true;
            GoAhead = false;
        }
        if (GoAhead == true)
        {
            string tix = ViewState["ticketID"].ToString();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd2 = new SqlCommand();

            cmd.CommandText = "INSERT INTO UserTix (Tid, Cid, Date, username) VALUES (@ticketID, @Artist, @Date, @username)";

            cmd.Parameters.Add("@ticketID", SqlDbType.NVarChar).Value = tix;
            cmd.Parameters.Add("@Artist", SqlDbType.NVarChar).Value = GridView1.SelectedRow.Cells[2].Text;
            cmd.Parameters.Add("@Date", SqlDbType.NVarChar).Value = GridView1.SelectedRow.Cells[8].Text;
            cmd.Parameters.Add("@username", SqlDbType.NVarChar).Value = Session["username"];

            cmd.Connection = conn;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            cmd2.CommandText = "Update Tickets set Sold = 'TRUE' where tid = @tixID";
            cmd2.Parameters.Add("@tixID", SqlDbType.NVarChar).Value = tix;

            cmd2.Connection = conn;
            conn.Open();
            cmd2.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Confirmation.aspx");
        }

  


    }
}

