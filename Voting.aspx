<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Voting.aspx.cs" Inherits="Nothing.Voting" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Voting System</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .header {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        .user-icon {
            display: flex;
            align-items: center;
        }
        .user-icon img {
            border-radius: 50%;
            width: 30px;
            height: 30px;
            margin-left: 10px;
        }
        .container {
            display: flex;
            justify-content: center;
            padding: 20px;
        }
        .voter-info {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-right: 20px;
            width: 250px;
            text-align: center;
        }
        .voter-info img {
            border-radius: 50%;
            width: 80px;
            height: 80px;
            margin-bottom: 10px;
        }
        .voter-info h2 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .voter-info p {
            margin: 5px 0;
            font-size: 14px;
            color: #666;
        }
        .voting-options {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 350px;
        }
        .voting-options .option {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
            transition: background-color 0.3s;
        }
        .voting-options .option:hover {
            background-color: #f0f0f0;
        }
        .voting-options .option img {
            width: 150px;
            height: 100px;
        }
        .voting-options .vote-button {
            padding: 10px 15px;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .voting-options .vote-button:hover {
            background-color: #218838;
        }
    </style>
    <script type="text/javascript">
    // Prevent back button navigation and disable backtracking to voting page
    function preventBack() {
        window.history.forward();
    }

    setTimeout("preventBack()", 0);
    window.onunload = function () { null };

    // Redirect to the home page without allowing users to go back to the previous voting page
    function redirectHome() {
        window.location.href = 'Home.aspx'; // Change to the homepage URL
    }
</script>
</head>
<body>
    <form runat="server" method="post">
    <header class="header">
        <h1>Online Voting System</h1>
        <div class="user-icon">
            <span>Logout</span>
            <img src="https://via.placeholder.com/30" alt="User Icon">
        </div>
    </header>
    <div class="container">
        <div class="voter-info">
            <img src="https://via.placeholder.com/80" alt="Voter Image">
            <h2>User Details</h2>
            <p><strong>Name:</strong><asp:Label ID="lblvname" runat="server" Text=""></asp:Label></p>
            <p><strong>Email:</strong><asp:Label ID="lblvemail" runat="server" Text=""></asp:Label></p>
            <p><strong>City:</strong><asp:Label ID="lblvcity" runat="server" Text=""></asp:Label></p>
        </div>
        <div class="voting-options">
            <asp:Panel ID="VotingPanel" runat="server">
            <div class="option">
                <span>1. MCU</span>
                <img src="Images\marvel.jpeg" alt="Option Image">
                <%--<button class="vote-button">Vote</button>--%>
                <asp:Button ID="btnp1" runat="server" OnClick="btnVote_click" CommandArgument="MCU" CssClass="vote-button" Text="Vote"/>
            </div>
            <div class="option">
                <span>2. DCU</span>
                <img src="Images/dcu.jpeg" alt="Option Image">
                <%--<button class="vote-button">Vote</button>--%>
                <asp:Button ID="btnp2" runat="server" OnClick="btnVote_click" CommandArgument="DCU" CssClass="vote-button" Text="Vote"/>
            </div>
            <div class="option">
                <span>3. LCU</span>
                <img src="Images\LCU.jpeg" alt="Option Image">
                <%--<button class="vote-button">Vote</button>--%>
                <asp:Button ID="btnp3" runat="server" OnClick="btnVote_click" CommandArgument="LCU" CssClass="vote-button" Text="Vote" />
            </div>
            <div class="option">
                <span>4. GOT</span>
                <img src="Images\GOT.jpeg" alt="Option Image">
                <%--<button class="vote-button">Vote</button>--%>
                <asp:Button ID="btnp4" runat="server" OnClick="btnVote_click" CommandArgument="GOT" CssClass="vote-button" Text="Vote" />
            </div>
            </asp:Panel>
        </div>
    </div>
        </form>
</body>
</html>
