<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="COP 4710: Database Design - Project 4">
    <meta name="author" content="Molly Bauer, Kaitlin Kidd, Rebecca Montgomery">
    <title>Login - Tu's Tickets</title>

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
     <form class="form-signin" id="form1" runat="server" style="width: 50%;">
    
       <h1>Welcome back!</h1>

         <fieldset class="form-group">
            <label for="un">Username</label>
            <asp:TextBox ID="tbUserName" class="form-control" runat="server" placeholder="Enter username"></asp:TextBox>
         </fieldset>

          <fieldset class="form-group">
            <label for="ps">Password</label>
            <asp:TextBox ID="tbPassword" class="form-control" runat="server" TextMode="Password" placeholder="Enter password" ></asp:TextBox>
         </fieldset>

       
       
        <asp:Label ID="LoginError" runat="server" ForeColor="Red" Text="Username or password is incorrect." Visible="False"></asp:Label>
        <asp:Button ID="Button1" class="btn btn-primary" runat="server" OnClick="Button1_Click" Text="Login" />
        <br /><br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Register Here!</asp:HyperLink>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="usertest" Visible="False" DataKeyNames="username">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" ReadOnly="True" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                <asp:BoundField DataField="admin" HeaderText="admin" SortExpression="admin" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="usertest" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT l.username, l.password, l.admin FROM Logins l WHERE l.username = @username AND l.password = @password">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbUserName" Name="username" PropertyName="Text" />
                <asp:ControlParameter ControlID="tbPassword" Name="password" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
     </form>
    </div>
   
</body>
</html>
