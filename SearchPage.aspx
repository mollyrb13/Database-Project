<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchPage.aspx.cs" Inherits="_Default" %>

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
            <div class="row">
                <div class="col-md-12 text-center" style="margin:23% 0 0 0;">
                    <asp:Label ID="Label1" runat="server" Font-Names="Britannic Bold" Font-Size="X-Large" Text="Find Your Tickets Today!"></asp:Label>

                    <div class="text-center">
                        <table class="text-center" style="margin: 0 auto;">
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="SearchBar" CssClass="form-control" runat="server" Height="35px" Width="267px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" Height="35px" Width="135px" style="margin-left: 0px">
                                            <asp:ListItem Selected="True">Search By...</asp:ListItem>
                                            <asp:ListItem>Artist</asp:ListItem>
                                            <asp:ListItem>Venue</asp:ListItem>
                                            <asp:ListItem>City</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="padding: 25px;"><asp:Button ID="Button1" class="btn btn-primary" runat="server" OnClick="Button1_Click" Text="Search" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <br />
                    <br />
                    <asp:Label ID="NoResults" runat="server" Text="No search results." Visible="False"></asp:Label>
                    <br />
                    <br />
                    <asp:SqlDataSource ID="ArtistSearch" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select c.Cid, c.Artist, c.Venue, c.Address, c.City, c.State, c.Zip, c.Date, c.Time, t.Price, COUNT(t.Cid) as Available from Concerts c, Tickets t where c.Artist = @Artist AND c.Cid = t.Cid AND t.Sold = 'FALSE' GROUP BY c.Cid, c.Artist, c.Venue, c.Address, c.City, c.State, c.Zip, c.Date, c.Time, t.Price">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="SearchBar" Name="Artist" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="VenueSearch" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select c.Cid, c.Artist, c.Venue, c.Address, c.City, c.State, c.Zip, c.Date, c.Time, t.Price, COUNT(t.Cid) as Available From Concerts c, Tickets t where c.Venue = @Venue AND t.Cid = c.Cid AND t.Sold = 'FALSE' Group By c.Artist, c.Venue, c.Address, c.City, c.State, c.Zip, c.Date, c.Time, t.Price">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="SearchBar" Name="Venue" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="CitySearch" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select c.Cid, c.Artist, c.Venue, c.Address, c.City, c.State, c.Zip, c.Date, c.Time, t.Price, COUNT(t.Cid) as Available from Concerts c, Tickets t where c.City = @City AND t.Cid = c.Cid AND t.Sold = 'FALSE' Group By c.Cid, c.Artist, c.Venue, c.Address, c.City, c.State, c.Zip, c.Date, c.Time, t.Price">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="SearchBar" Name="City" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
               
                    <br />
                    <div class="form-group text-center">
                        <asp:Label ID="numtixlbl" runat="server" Text="How Many?"></asp:Label>
                        <asp:DropDownList ID="DropDownList2" CssClass="form-control" Width="60px" style="margin: 0 auto;" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                            <asp:ListItem Value="1"></asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ArtistSearch" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" DataKeyNames="Cid" Height="200px" Width="1140px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Cid" HeaderText="Cid" SortExpression="Cid" ReadOnly="True" />
                            <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
                            <asp:BoundField DataField="Venue" HeaderText="Venue" SortExpression="Venue" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                            <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="Available" HeaderText="Available" ReadOnly="True" SortExpression="Available" />
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
                    <asp:Label ID="ConcertBought" runat="server"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Price" runat="server"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="creditcardlabel" runat="server" Text="Credit Card Number"></asp:Label>
                    <br />
                    <asp:TextBox ID="CreditCard" runat="server" Height="22px" Width="128px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="CreditError" runat="server" ForeColor="Red" Text="Not a valid credit card number." Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="securitycodelbl" runat="server" Text="Security Code"></asp:Label>
                    <br />
                    <asp:TextBox ID="securitycode" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="SecurityError" runat="server" ForeColor="Red" Text="Not a valid security code." Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="expirationlbl" runat="server" Text="Expiration Date (mm/yy)"></asp:Label>
                    <br />
                    <asp:TextBox ID="ExpirationDate" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="ExpError" runat="server" ForeColor="Red" Text="Not a valid expiration date." Visible="False"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="Purchasebtn" runat="server" OnClick="Purchasebtn_Click" Text="Buy My Ticket!" />
                </div>
            </div> 
        </div>
    </form>
</body>
</html>
