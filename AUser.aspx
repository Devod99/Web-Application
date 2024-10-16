<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AUser.aspx.cs" Inherits="Nothing.AUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Show All Users</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
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

        .search-container {
            margin-bottom: 20px;
        }

        .search-container input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 300px;
            font-size: 16px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .table th {
            background-color: #0D47A1;
            color: white;
        }

        .btn-edit, .btn-delete {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
        }

        .btn-edit {
            background-color: #4CAF50; /* Green */
        }

        .btn-edit:hover {
            background-color: #45a049;
        }

        .btn-delete {
            background-color: #f44336; /* Red */
        }

        .btn-delete:hover {
            background-color: #e53935;
        }

        .footer {
            background-color: #0D47A1;
            color: white;
            text-align: center;
            padding: 10px;
            position: relative;
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
            <h1>All Users</h1>
        </div>

        <div class="search-container">
            <%--<input type="text" id="txtSearch" placeholder="Search Users..." onkeyup="filterUsers()">--%>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Placeholder="Search Users..." OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
        </div>

        <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataKeyNames="v_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="v_name" HeaderText="v_name" SortExpression="v_name" />
                    <asp:BoundField DataField="v_id" HeaderText="v_id" ReadOnly="True" SortExpression="v_id" />
                    <asp:BoundField DataField="v_city" HeaderText="v_city" SortExpression="v_city" />
                    <asp:BoundField DataField="v_email" HeaderText="v_email" SortExpression="v_email" />
                    <asp:BoundField DataField="v_pass" HeaderText="v_pass" SortExpression="v_pass" />
                    <asp:BoundField DataField="v_cpass" HeaderText="v_cpass" SortExpression="v_cpass" />
                </Columns>
            </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vote %>" SelectCommand="SELECT * FROM [voting]"></asp:SqlDataSource>
    </div>

    <div class="footer">
        <p>&copy; 2024 Online Voting System. All Rights Reserved.</p>
    </div>

    <script>
        function filterUsers() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const table = document.getElementById('userTable');
            const tr = table.getElementsByTagName('tr');

            for (let i = 1; i < tr.length; i++) {
                const td = tr[i].getElementsByTagName('td');
                let found = false;

                for (let j = 1; j < td.length - 1; j++) { // Exclude the ID and Actions columns
                    if (td[j].textContent.toLowerCase().indexOf(filter) > -1) {
                        found = true;
                        break;
                    }
                }

                tr[i].style.display = found ? '' : 'none';
            }
        }

        function deleteUser(btn) {
            const row = btn.parentNode.parentNode; // Get the row of the button clicked
            row.parentNode.removeChild(row); // Remove the row from the table
        }
    </script>

        </div>
    </form>
</body>
</html>
