<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Nothing.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Online Voting System</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100%;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('h5.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        /* Login Form Styling */
        .login-container {
            background: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
            z-index: 1;
        }

        .login-container h2 {
            margin: 0 0 20px;
            color: #0D47A1;
        }

        .login-container form {
            display: flex;
            flex-direction: column;
        }

        .login-container input {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .login-container button {
            padding: 10px;
            background-color: #0D47A1;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .login-container button:hover {
            background-color: #1565C0;
        }

        .login-container .signup-link {
            margin-top: 10px;
            font-size: 14px;
        }

        .login-container .signup-link a {
            color: #0D47A1;
            text-decoration: none;
        }

        .login-container .signup-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login to Vote</h2>
        <form runat="server" action="#" method="post">
            <asp:TextBox ID="txtvid" runat="server" name="voter_id" placeholder="Voter ID" required></asp:TextBox>
            <%--<input type="text" name="voter_id" placeholder="Voter ID" required--%>
            <asp:TextBox ID="txtpass" runat="server" name="password" placeholder="Password" required TextMode="Password"></asp:TextBox>
            <%--<input type="password" name="password" placeholder="Password" required>--%>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <%--<button type="submit">Login</button>--%>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </form>
        <div class="signup-link">
             <a href="Forgotpass.aspx">Forgot Password</a></br></br>    
             <a href="Home.aspx">Back To Home</a>
        </div>
    </div>
</body>
</html>