<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="COP 4710: Database Design - Project 4">
    <meta name="author" content="Molly Bauer, Kaitlin Kidd, Rebecca Montgomery">
    <title>Register - Tu's Tickets</title>

    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/favicon.ico" type="image/x-icon">

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
   <link rel="stylesheet" href="css/signin.css" type="text/css">

    <style type="text/css">
        #mainNav {
             background-color:#4184b4;
        }

        .navbar-default .navbar-nav>li>a {
            color: #fff;
        }

        .nav>li>a:focus, .nav>li>a:hover {
            text-decoration: none;
            color:lightgray !important;
        }
    </style>
    
</head>
<body id="page-top">
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
           
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="Landing.aspx">Home</a>
                    </li>
                    <li>
                        <a href="Register.aspx">Register</a>
                    </li>
                    <li>
                        <a href="Login.aspx">Log In</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
   
    <div class="container">
     <form class="form-signin" id="form1" runat="server">
       <div class="row">
          <div class="col-xs-3 col-md-1"><img src="img/ticket.png" style="padding-top: 5px;" /></div>
          <div class="col-xs-15 col-md-11" style="text-align:left;"><h1>Register for <strong>Tu's Tickets</strong></h1></div>
          
        </div>
         
         
         
         
         
         <hr />
        <div class="row">
            <div class="col-md-6">
                <fieldset class="form-group">
                    <label for="ln">Username</label>
                    <asp:TextBox ID="username" runat="server"  class="form-control" placeholder="Enter username"></asp:TextBox>
                    <asp:Label ID="usernameError" runat="server" ForeColor="Red"></asp:Label>
                </fieldset>
            </div>
            <div class="col-md-6">
                <fieldset class="form-group">
                    <label for="ln">Email</label>
                    <asp:TextBox ID="email" runat="server"  class="form-control" placeholder="Enter email address"></asp:TextBox>
                    <asp:Label ID="EmailError" runat="server" ForeColor="Red"></asp:Label>
                </fieldset>
            </div>
        </div>


        <div class="row">
            <div class="col-md-6">
                <fieldset class="form-group">
                    <label for="ln">Password</label>
                    <asp:TextBox ID="password" runat="server" class="form-control" TextMode="Password" placeholder="*******"></asp:TextBox>
                    <asp:Label ID="passwordError" runat="server" ForeColor="Red"></asp:Label>
                </fieldset>
            </div>
            <div class="col-md-6">
                <fieldset class="form-group">
                    <label for="ln">Confirm Password</label>
                    <asp:TextBox ID="passwordcheck" runat="server" class="form-control" TextMode="Password" placeholder="*******"></asp:TextBox>
                    <asp:Label ID="PassCheck" runat="server" ForeColor="Red" Visible="False">Passwords do not match.</asp:Label>
                </fieldset>
            </div>
        </div>

        <div class="row">
          <div class="col-md-6">
              <fieldset class="form-group">
                <label for="fn">First name</label>
                <asp:TextBox ID="firstname" runat="server"  class="form-control" placeholder="Enter first name"></asp:TextBox>
                <asp:Label ID="firstnameError" runat="server" ForeColor="Red"></asp:Label>
              </fieldset>
          </div>
          <div class="col-md-6">
            <fieldset class="form-group">
                <label for="ln">Last name</label>
                <asp:TextBox ID="lastname" runat="server"  class="form-control" placeholder="Enter last name"></asp:TextBox>
                <asp:Label ID="lastnameError" runat="server" ForeColor="Red"></asp:Label>
            </fieldset>
          </div>
        </div>

         <hr />

        <div class="row">
            <div class="col-md-4">
                 <fieldset class="form-group">
                    <label for="ln">Phone</label>
                    <asp:TextBox ID="phone" runat="server"  class="form-control" placeholder="Enter phone number"></asp:TextBox>
                    <asp:Label ID="phoneError" runat="server" ForeColor="Red"></asp:Label>
                </fieldset>
            </div>
            <div class="col-md-4">
                  <fieldset class="form-group">
                    <label for="ln">City</label>
                    <asp:TextBox ID="city" runat="server"  class="form-control" placeholder="Enter current city"></asp:TextBox>
                    <asp:Label ID="cityError" runat="server" ForeColor="Red"></asp:Label>
                </fieldset>
            </div>
            <div class="col-md-4">
                <fieldset class="form-group">
                    <label for="ln">State</label>
                    <asp:DropDownList ID="state" runat="server"  class="form-control">
                <asp:ListItem>Select Current State...</asp:ListItem>
                <asp:ListItem>Alabama</asp:ListItem>
                <asp:ListItem>Alaska</asp:ListItem>
                <asp:ListItem>Arizona</asp:ListItem>
                <asp:ListItem>Arkansas</asp:ListItem>
                <asp:ListItem>California</asp:ListItem>
                <asp:ListItem>Colorado</asp:ListItem>
                <asp:ListItem>Connecticut</asp:ListItem>
                <asp:ListItem>Delaware</asp:ListItem>
                <asp:ListItem>Florida</asp:ListItem>
                <asp:ListItem>Georgia</asp:ListItem>
                <asp:ListItem>Hawaii</asp:ListItem>
                <asp:ListItem>Idaho</asp:ListItem>
                <asp:ListItem>Illinois</asp:ListItem>
                <asp:ListItem>Indiana</asp:ListItem>
                <asp:ListItem>Iowa</asp:ListItem>
                <asp:ListItem>Kansas</asp:ListItem>
                <asp:ListItem>Kentucky</asp:ListItem>
                <asp:ListItem>Louisiana</asp:ListItem>
                <asp:ListItem>Maine</asp:ListItem>
                <asp:ListItem>Maryland</asp:ListItem>
                <asp:ListItem>Massachusetts</asp:ListItem>
                <asp:ListItem>Michigan</asp:ListItem>
                <asp:ListItem>Minnesota</asp:ListItem>
                <asp:ListItem>Mississippi</asp:ListItem>
                <asp:ListItem>Missouri</asp:ListItem>
                <asp:ListItem>Montana</asp:ListItem>
                <asp:ListItem>Nebraska</asp:ListItem>
                <asp:ListItem>Nevada</asp:ListItem>
                <asp:ListItem>New Hampshire</asp:ListItem>
                <asp:ListItem>New Jersey</asp:ListItem>
                <asp:ListItem>New Mexico</asp:ListItem>
                <asp:ListItem>New York</asp:ListItem>
                <asp:ListItem>North Carolina</asp:ListItem>
                <asp:ListItem>North Dakota</asp:ListItem>
                <asp:ListItem>Ohio</asp:ListItem>
                <asp:ListItem>Oklahoma</asp:ListItem>
                <asp:ListItem>Oregon</asp:ListItem>
                <asp:ListItem>Pennsylvania</asp:ListItem>
                <asp:ListItem>Rhode Island</asp:ListItem>
                <asp:ListItem>South Carolina</asp:ListItem>
                <asp:ListItem>South Dakota</asp:ListItem>
                <asp:ListItem>Tennessee</asp:ListItem>
                <asp:ListItem>Texas</asp:ListItem>
                <asp:ListItem>Utah</asp:ListItem>
                <asp:ListItem>Vermont</asp:ListItem>
                <asp:ListItem>Virginia</asp:ListItem>
                <asp:ListItem>Washington</asp:ListItem>
                <asp:ListItem>Washington D.C.</asp:ListItem>
                <asp:ListItem>West Virginia</asp:ListItem>
                <asp:ListItem>Wisconsin</asp:ListItem>
                <asp:ListItem>Wyoming</asp:ListItem>
               </asp:DropDownList>
                    <asp:Label ID="stateError" runat="server" ForeColor="Red"></asp:Label>
                </fieldset>
            </div>
        </div>

         <div class="row">
          <div class="col-md-6">
              <fieldset class="form-group">
            <label for="admin">Admin access</label>
            <asp:DropDownList ID="Adminddl" runat="server" class="form-control">
                <asp:ListItem>Select...</asp:ListItem>
                <asp:ListItem>Y</asp:ListItem>
                <asp:ListItem>N</asp:ListItem>
        </asp:DropDownList>
          </fieldset>
          </div>
          <div class="col-md-6">
            
         <fieldset class="form-group">
            <label for="ln">Admin Password</label>
            <asp:TextBox ID="adminPasstb" runat="server"  class="form-control" TextMode="Password" placeholder="Enter admin password"></asp:TextBox>
            <asp:Label ID="AdminPasslbl" runat="server" ForeColor="Red"></asp:Label>
        </fieldset>
          </div>
        </div>


          


         <hr />
    <div class="text-right">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" class="btn btn-primary" /> 
    </div>
    </form>
    </div>
    
</body>
</html>
