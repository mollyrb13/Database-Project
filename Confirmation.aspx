<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" %>

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
    <link rel="stylesheet" href="css/creative.css" type="text/css">

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
<body>
    
<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center" style="margin-top:25%;">
            <form id="form1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-xl page-scroll" OnClick="Button1_Click" Text="Back to My HomePage" />
            </form>
            <hr class="primary">
        </div>
    </div>
</div>

    

    
</body>
</html>
