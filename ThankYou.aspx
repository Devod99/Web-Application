<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="Nothing.ThankYou" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Thank You for Voting</title>
    <link href="styles.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            text-align: center;
            margin-top: 50px;
        }
        .thank-you-card {
            background-color: #fff;
            padding: 40px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 50%;
            margin: auto;
            border-radius: 10px;
        }
        h1 {
            color: #3A77FF;
            margin-bottom: 20px;
        }
        .motivational-slogan {
            font-size: 20px;
            color: #555;
            margin-bottom: 20px;
        }
        .voting-awareness {
            font-size: 18px;
            color: #333;
            line-height: 1.6;
        }
        .encouragement {
            font-size: 18px;
            color: #444;
            margin-top: 20px;
            margin-bottom: 30px;
        }
        .footer {
            margin-top: 30px;
            font-size: 14px;
            color: #888;
        }
        .back-home-btn {
            background-color: #3A77FF;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 20px;
        }
        .back-home-btn:hover {
            background-color: #275ABF;
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
    <form id="form2" runat="server">
    <div class="container">
        <div class="thank-you-card">
            <h1>Thank You for Voting!</h1>
            <p class="motivational-slogan">"Every vote counts, and yours just made a difference."</p>
            <p class="voting-awareness">
                Your participation is crucial in shaping the future. Voting is not just a right, it's a responsibility we all share. 
                It ensures that our voices are heard, and it strengthens our democracy. By voting, you are taking a stand for a better future. 
                Thank you for making your voice heard.
            </p>
            <p class="voting-awareness">
                "The future of our democracy depends on the active participation of every citizen."
            </p>
            
            <!-- New section for more text -->
            <p class="encouragement">
                Now that you’ve voted, encourage others to do the same. Every person’s voice matters, and together, we can create a fair and just society. 
                Voting is a way to show that you care about the community, the nation, and the direction we are heading.
            </p>

            <p class="voting-awareness">
                Don’t let your impact end here. Share your voting experience, inspire others to vote, and remind them that 
                every vote is a step toward progress. Thank you once again for being part of this important process.
            </p>

            <!-- Button to return to the homepage -->
            <button class="back-home-btn" type="button" onclick="redirectHome()">Go to Homepage</button>
            
            <div class="footer">
                © 2024 Online Voting System. All Rights Reserved.
            </div>
        </div>
    </div>
</form>
</body>
</html>
