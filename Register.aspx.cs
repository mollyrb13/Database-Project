using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        firstnameError.Text = "";
        lastnameError.Text = "";
        usernameError.Text = "";
        EmailError.Text = "";
        PassCheck.Text = "";
        phoneError.Text = "";
        cityError.Text = "";
        stateError.Text = "";
        passwordError.Text = "";
        AdminPasslbl.Text = "";

        if (firstname.Text == "")
        {
            firstnameError.Text = "Please enter a First Name";
        }
        if (lastname.Text == "")
        {
            lastnameError.Text = "Please enter a last name";
        }
        if (username.Text == "")
        {
            usernameError.Text = "Please enter a username";
        }
        if (email.Text == "")
        {
            EmailError.Text = "Please enter an e-mail";
        }
        if (phone.Text == "")
        {
            phoneError.Text = "Please enter a phone number";
        }
        if (city.Text == "")
        {
            cityError.Text = "Please enter a City";
        }
        if (state.Text == "")
        {
            stateError.Text = "Please enter a State";
        }
        if (password.Text == "")
        {
            passwordError.Text = "Please enter a password";
        }
        if (passwordcheck.Text == "")
        {
            PassCheck.Text = "Please re-enter your password";
        }
        if (phone.Text.Length != 10)
        {
            phoneError.Text = "Please enter a 10 digit phone number";
        }
        if (!(email.Text.Contains("@")) || !(email.Text.Contains(".")))
        {
            EmailError.Text = "Please enter a valid email address";
        }
        if (passwordcheck != password)
        {
            passwordError.Text = "Passwords do not match.";
        }
        if (phone.Text.Length == 10 && email.Text.Contains("@") && email.Text.Contains(".") && password.Text == passwordcheck.Text && firstname.Text != "" && lastname.Text != "" && username.Text != "" && password.Text != "" && passwordcheck.Text != "" && email.Text != "" && phone.Text != "" && city.Text != "" && state.Text != "" && Adminddl.SelectedItem.Value == "N")
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "INSERT INTO Logins (username, password, email, firstname, lastname, phone, city, state, admin) VALUES (@username, @password, @email, @firstname, @lastname, @phone, @city, @state, @admin)";

            cmd.Parameters.Add("@username", SqlDbType.NVarChar).Value = username.Text;
            cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = password.Text;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = email.Text;
            cmd.Parameters.Add("@firstname", SqlDbType.NVarChar).Value = firstname.Text;
            cmd.Parameters.Add("@lastname", SqlDbType.NVarChar).Value = lastname.Text;
            cmd.Parameters.Add("@phone", SqlDbType.NVarChar).Value = phone.Text;
            cmd.Parameters.Add("@city", SqlDbType.NVarChar).Value = city.Text;
            cmd.Parameters.Add("@state", SqlDbType.NVarChar).Value = state.Text;
            cmd.Parameters.Add("@admin", SqlDbType.NVarChar).Value = Adminddl.SelectedItem.Value;

            cmd.Connection = conn;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Session["username"] = username.Text;
            Response.Redirect("HomePage.aspx");
        }
        else if (password.Text == passwordcheck.Text && firstname.Text != "" && lastname.Text != "" && username.Text != "" && password.Text != "" && passwordcheck.Text != "" && email.Text != "" && phone.Text != "" && city.Text != "" && state.Text != "" && Adminddl.SelectedItem.Value == "Y" && adminPasstb.Text == "admin")
            {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "INSERT INTO Logins (username, password, email, firstname, lastname, phone, city, state, admin) VALUES (@username, @password, @email, @firstname, @lastname, @phone, @city, @state, @admin)";

            cmd.Parameters.Add("@username", SqlDbType.NVarChar).Value = username.Text;
            cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = password.Text;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = email.Text;
            cmd.Parameters.Add("@firstname", SqlDbType.NVarChar).Value = firstname.Text;
            cmd.Parameters.Add("@lastname", SqlDbType.NVarChar).Value = lastname.Text;
            cmd.Parameters.Add("@phone", SqlDbType.NVarChar).Value = phone.Text;
            cmd.Parameters.Add("@city", SqlDbType.NVarChar).Value = city.Text;
            cmd.Parameters.Add("@state", SqlDbType.NVarChar).Value = state.Text;
            cmd.Parameters.Add("@admin", SqlDbType.NVarChar).Value = Adminddl.SelectedItem.Value;

            cmd.Connection = conn;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Session["username"] = username.Text;
            Response.Redirect("AdminPage.aspx");
            }
        else
        {
            PassCheck.Text = "Passwords do not match";
        }
    }

}