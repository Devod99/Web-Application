<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Nothing.Registration" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration - Online Voting System</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('h4.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .registration-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        .registration-container h2 {
            margin-bottom: 20px;
            color: #0D47A1;
        }

        .registration-container form {
            display: flex;
            flex-direction: column;
        }

        .registration-container input {
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .registration-container button {
            padding: 12px;
            background-color: #0D47A1;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .registration-container button:hover {
            background-color: #1565C0;
        }

        .registration-container .login-link {
            margin-top: 10px;
            font-size: 14px;
        }

        .registration-container .login-link a {
            color: #0D47A1;
            text-decoration: none;
        }

        .registration-container .login-link a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
            display: none;
        }
    </style>
</head>
<body>
     <div class="registration-container">
     <h2>Register to Vote</h2>
     <form id="registrationForm" runat="server" action="#" method="post" onsubmit="return validateForm()">
         <div class="error-message" id="error-message"></div>
         <asp:TextBox ID="fullname" runat="server" name="fullName" placeholder="Full Name"></asp:TextBox>
         <%--<input type="text" runat="server" id="fullName" name="fullName" placeholder="Full Name" required>--%>
         <asp:TextBox ID="voterid" runat="server" name="voterID" placeholder="Voter ID" pattern="[A-Za-z0-9]{10}"></asp:TextBox>
         <%--<input type="text" id="voterID" name="voterID" placeholder="Voter ID" required pattern="[A-Za-z0-9]{10}">--%>
         <asp:TextBox ID="txtcity" runat="server" name="city" placeholder="City"></asp:TextBox>
         <asp:TextBox ID="email" runat="server" name="email" placeholder="Email"></asp:TextBox>
         <%--<input type="email" id="email" name="email" placeholder="Email" required>--%>
         <asp:TextBox ID="pass" runat="server" name="password" placeholder="Password" minlength="6" TextMode="Password">
</asp:TextBox>
         <%--<input type="password" id="password" name="password" placeholder="Password" required minlength="6">--%>
         <asp:TextBox ID="cpass" runat="server" name="confirmPassword" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
         <%--<input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>--%>
         <%--<button id="register" runat="server" type="submit" OnClick="btnRegister_Click">Register</button>--%>
         <asp:Button ID="register" runat="server" Text="Register" OnClick="register_Click"/>
         <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
     </form>
     <div class="login-link">
         Already have an account? <a href="Login.aspx">Login here</a>
     </div>
 </div>
    <script>
        function validateForm() {
            var fullName = document.getElementById('fullName').value;
            var voterID = document.getElementById('voterID').value;
            var email = document.getElementById('email').value;
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            var errorMessage = document.getElementById('error-message');

            errorMessage.style.display = 'none';

            if (fullName.trim() === '' || voterID.trim() === '' || email.trim() === '' || password.trim() === '' || confirmPassword.trim() === '') {
                errorMessage.textContent = 'All fields are required.';
                errorMessage.style.display = 'block';
                return false;
            }

            if (voterID.length !== 10) {
                errorMessage.textContent = 'Voter ID must be 10 characters long.';
                errorMessage.style.display = 'block';
                return false;
            }

            if (password !== confirmPassword) {
                errorMessage.textContent = 'Passwords do not match.';
                errorMessage.style.display = 'block';
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
