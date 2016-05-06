<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

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
                       <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/HomePage.aspx">View As User</asp:HyperLink>
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
            <asp:Label ID="Label2" runat="server" Font-Names="Britannic Bold" Font-Size="XX-Large" Text="Welcome, Administrator!"></asp:Label>
        </div> 
        <br />
        <br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>Select A View</asp:ListItem>
            <asp:ListItem>Concerts</asp:ListItem>
            <asp:ListItem>Tickets</asp:ListItem>
            <asp:ListItem>Users</asp:ListItem>
            <asp:ListItem>User Purchases</asp:ListItem>
        </asp:DropDownList>
        <br />
             <br />
        <asp:GridView ID="AllConcertsGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Cid" DataSourceID="AllConcerts" Width="1140px" ForeColor="#333333" GridLines="None" CellPadding="4" Height="200px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Cid" HeaderText="Cid" ReadOnly="True" SortExpression="Cid" />
                <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
                <asp:BoundField DataField="Venue" HeaderText="Venue" SortExpression="Venue" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
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
        <asp:SqlDataSource ID="AllConcerts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="AllConcerts_Selecting" SelectCommand="SELECT * FROM [Concerts]"
            UpdateCommand="UPDATE [Concerts] SET [Venue] = @Venue, [Address] = @Address, [City] = @City, [State] = @State, [Zip] = @Zip, [Date] = @Date, [Time] = @Time WHERE [Cid] = @Cid"
            ><UpdateParameters>
                <asp:Parameter Type="String" Name="Venue"></asp:Parameter>
                <asp:Parameter Type="String" Name="Address"></asp:Parameter>
                <asp:Parameter Type="String" Name="City"></asp:Parameter>
                <asp:Parameter Type="String" Name="State"></asp:Parameter>
                <asp:Parameter Type="String" Name="Zip"></asp:Parameter>
                <asp:Parameter Type="String" Name="Date"></asp:Parameter>
                <asp:Parameter Type="String" Name="Time"></asp:Parameter>
                <asp:Parameter Type="String" Name="Cid"></asp:Parameter>
            </UpdateParameters></asp:SqlDataSource>
        <asp:GridView ID="TicketsGrid" Width="1140px" ForeColor="#333333" GridLines="None" CellPadding="4" Height="200px" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Tid" DataSourceID="Tickets">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Tid" HeaderText="Tid" ReadOnly="True" SortExpression="Tid" />
                <asp:BoundField DataField="Cid" HeaderText="Cid" SortExpression="Cid" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Sold" HeaderText="Sold" SortExpression="Sold" />
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
        <asp:GridView ID="UsersGrid" Width="1140px" ForeColor="#333333" GridLines="None" CellPadding="4" Height="200px" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="username" DataSourceID="Users">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" SortExpression="username" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                <asp:BoundField DataField="tid" HeaderText="tid" SortExpression="tid" />
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                <asp:BoundField DataField="admin" HeaderText="admin" SortExpression="admin" />
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
        <asp:SqlDataSource ID="Tickets" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Tickets]" UpdateCommand="UPDATE [Tickets] SET [Tid] = @Tid, [Price] = @Price, [Sold] = @Sold WHERE [Cid] = @Cid AND [Tid] = @Tid">
            <UpdateParameters>
                <asp:Parameter Type="String" Name="Tid"></asp:Parameter>
                <asp:Parameter Type="String" Name="Price"></asp:Parameter>
                <asp:Parameter Type="String" Name="Sold"></asp:Parameter>
                <asp:Parameter Type="String" Name="Cid"></asp:Parameter>
            </UpdateParameters></asp:SqlDataSource>
        <asp:SqlDataSource ID="Users" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Logins]" UpdateCommand="UPDATE [Logins] SET [password] = @password, [email] = @email, [phone] = @phone, [city] = @city, [state] = @state, [admin] = @admin WHERE [username] = @username">
            <UpdateParameters>
                <asp:Parameter Type="String" Name="username"></asp:Parameter>
                <asp:Parameter Type="String" Name="password"></asp:Parameter>
                <asp:Parameter Type="String" Name="email"></asp:Parameter>
                <asp:Parameter Type="String" Name="phone"></asp:Parameter>
                <asp:Parameter Type="String" Name="city"></asp:Parameter>
                <asp:Parameter Type="String" Name="state"></asp:Parameter>
                <asp:Parameter Type="String" Name="admin"></asp:Parameter>
            </UpdateParameters></asp:SqlDataSource>
        <asp:GridView ID="UserTicketsGrid" Width="1140px" ForeColor="#333333" GridLines="None" CellPadding="4" Height="200px" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="UserTickets" DataKeyNames="Tid">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Tid" HeaderText="Tid" SortExpression="Tid" />
                <asp:BoundField DataField="Cid" HeaderText="Cid" SortExpression="Cid" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
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
        <asp:SqlDataSource ID="UserTickets" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UserTix]" DeleteCommand="DELETE FROM [UserTix] WHERE [Tid] = @Tid">
            <DeleteParameters>
                <asp:Parameter Name="Tid"></asp:Parameter>
            </DeleteParameters></asp:SqlDataSource>
    </div>
            </div>

    </div>
    </form>
</body>
</html>
