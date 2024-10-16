<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AHome.aspx.cs" Inherits="Nothing.AHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Online Voting System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
        * {
            box-sizing: border-box;
        }

            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .sidebar {
            height: 100vh;
            width: 250px;
            background-color: #0D47A1;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
            color: white;
        }

        .sidebar a {
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
            transition: background 0.3s;
        }

        .sidebar a:hover {
            background-color: #1565C0;
        }

        .main-content {
            margin-left: 260px;
            padding: 20px;
        }

        .header {
            background-color: #0D47A1;
            color: white;
            padding: 10px;
            text-align: center;
        }

        .card {
            background: white;
            border-radius: 5px;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            margin: 0 0 10px;
        }

        .card p {
            margin: 0;
        }

        .footer {
            background-color: #0D47A1;
            color: white;
            text-align: center;
            padding: 10px;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <a href="AHome.aspx">Home</a>
        <a href="AUser.aspx">Show All Users</a>
        <a href="AVotes.aspx">Show Voting Data</a>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Welcome to the Admin Dashboard</h1>
        </div>

        <div class="card">
            <h3>Statistics</h3>
            <p>Total Users: <asp:Label ID="lblTotalUsers" runat="server" Text=""></asp:Label></p>
            <p>Total Votes Cast: <asp:Label ID="lblTotalVotes" runat="server" Text=""></asp:Label></p>
        </div>

        <%--<div class="card">
            <h3>Recent Activities</h3>
            <p>User John Doe registered on 2024-09-27</p>
            <p>User Jane Smith voted on 2024-09-26</p>
            <p>User Mark Johnson registered on 2024-09-25</p>
        </div>--%>
    </div>

    <div class="footer">
        <p>&copy; 2024 Online Voting System. All Rights Reserved.</p>
    </div>

        </div>
    </form>
</body>
</html>
