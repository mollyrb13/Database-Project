<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="COP 4710: Database Design - Project 4">
    <meta name="author" content="Molly Bauer, Kaitlin Kidd, Rebecca Montgomery">
    <title>Tu's Tickets</title>

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
                       <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/HomePage.aspx">My Dashboard</asp:HyperLink>
                    </li>
                    <li>
                       <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/SearchPage.aspx">Search Tickets</asp:HyperLink>
                    </li>
                    <li>
                       <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Login.aspx">Logout</asp:HyperLink>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    <form id="form1" runat="server">
    <div class="container">
       
        <br />
        <div class="row">
         <div class="col-md-12 text-center">
              <div style="margin: 10% 0 0 0;">
            <asp:Label ID="Label1" runat="server" Font-Names="Britannic Bold" Font-Size="XX-Large" Text="Welcome to your TuTickets.com Dashboard!"></asp:Label>
        </div> <br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SearchBtn" class="btn btn-primary" runat="server" Text="Find Tickets" OnClick="Button2_Click" />

         </div>
            </div>
        
        <br /><br />
         <asp:Calendar class="table table-hover" id="calendar1"  runat="server" OnSelectionChanged="calendar1_SelectionChanged" SelectedDate="2016-04-20">

             <NextPrevStyle HorizontalAlign="Center" CssClass="text-center" />

           <OtherMonthDayStyle ForeColor="LightGray" HorizontalAlign="Center">
           </OtherMonthDayStyle>

           <TitleStyle BackColor="#4184B4"
                       ForeColor="White" Font-Bold="True" HorizontalAlign="Center">
           </TitleStyle>

             <DayHeaderStyle HorizontalAlign="Center" CssClass="text-center" />

           <DayStyle HorizontalAlign="Center">
           </DayStyle>

           <SelectedDayStyle BackColor="LightGray"
                             Font-Bold="True" HorizontalAlign="Center">
           </SelectedDayStyle>

             <TodayDayStyle HorizontalAlign="Center" />
             <WeekendDayStyle HorizontalAlign="Center" />

      </asp:Calendar>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT c.Artist, c.Venue, u.Date, c.Time FROM Concerts c, UserTix u WHERE u.Cid = c.Artist AND u.username = @username AND c.Date = u.Date">
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="username" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1140px" ForeColor="#333333" GridLines="None" CellPadding="4" Height="200px">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
                <asp:BoundField DataField="Venue" HeaderText="Venue" SortExpression="Venue" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
        <br />
        <br />
        <!-- <asp:HyperLink class="btn btn-info" ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Logout</asp:HyperLink>
        <br /> --> 
    
    </div>
    </form>
</body>
</html>
