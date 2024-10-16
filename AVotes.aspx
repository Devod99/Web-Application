<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AVotes.aspx.cs" Inherits="Nothing.AVotes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Show Voting Data</title>
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

        .btn-delete {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
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

        .total-container {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
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
            <h1>Voting Data</h1>
        </div>

        <div><asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Placeholder="Filter by Party Name..." OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox></div>

            <!-- GridView to Display Voting Data -->
            <asp:GridView ID="GridViewVotingData" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="vid" HeaderText="vid" SortExpression="vid" />
                    <asp:BoundField DataField="p_name" HeaderText="p_name" SortExpression="p_name" />
                    <asp:BoundField DataField="vote_time" HeaderText="vote_time" SortExpression="vote_time" />
                </Columns>
            </asp:GridView>
        <asp:Label ID="lblTotalVotes" runat="server" CssClass="total-votes-label" />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vote %>" SelectCommand="SELECT * FROM [voting_data]"></asp:SqlDataSource>

        <div class="total-container">
            Total Votes: <span id="totalVotes">0</span>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2024 Online Voting System. All Rights Reserved.</p>
    </div>

    <script>
        // Function to calculate and display total votes
        function calculateTotalVotes() {
            const table = document.getElementById('votingTable');
            const tr = table.getElementsByTagName('tr');
            let totalVotes = 0;

            for (let i = 1; i < tr.length; i++) {
                const td = tr[i].getElementsByTagName('td')[1]; // Get Votes column
                if (td) {
                    totalVotes += parseInt(td.textContent || td.innerText);
                }
            }
            document.getElementById('totalVotes').textContent = totalVotes;
        }

        // Function to filter votes by party name
        function filterVotes() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const table = document.getElementById('votingTable');
            const tr = table.getElementsByTagName('tr');

            for (let i = 1; i < tr.length; i++) {
                const td = tr[i].getElementsByTagName('td')[0]; // Only filter by Party Name
                if (td) {
                    const txtValue = td.textContent || td.innerText;
                    tr[i].style.display = txtValue.toLowerCase().indexOf(filter) > -1 ? '' : 'none';
                }
            }
            calculateTotalVotes(); // Recalculate total votes after filtering
        }

        // Function to delete a vote entry
        function deleteVote(btn) {
            const row = btn.parentNode.parentNode; // Get the row of the button clicked
            row.parentNode.removeChild(row); // Remove the row from the table
            calculateTotalVotes(); // Recalculate total votes after deleting
        }

        // Call this function when the page loads to calculate the initial total votes
        window.onload = calculateTotalVotes;
    </script>
        </div>
    </form>
</body>
</html>
