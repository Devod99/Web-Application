<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgotpass.aspx.cs" Inherits="Nothing.Forgotpass" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Online Voting System</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('/mnt/data/A_dynamic_background_image_representing_Indian_dem.png') no-repeat center center fixed;
            background-size: cover;
        }

        .forgot-password-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        .forgot-password-container h2 {
            margin-bottom: 20px;
            color: #0D47A1;
        }

        .forgot-password-container p {
            margin-bottom: 20px;
            font-size: 14px;
            color: #555;
        }

        .forgot-password-container form {
            display: flex;
            flex-direction: column;
        }

        .forgot-password-container input {
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .forgot-password-container button {
            padding: 12px;
            background-color: #0D47A1;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .forgot-password-container button:hover {
            background-color: #1565C0;
        }

        .forgot-password-container .back-link {
            margin-top: 10px;
            font-size: 14px;
        }

        .forgot-password-container .back-link a {
            color: #0D47A1;
            text-decoration: none;
        }

        .forgot-password-container .back-link a:hover {
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
    <div class="forgot-password-container">
        <h2>Forgot Password</h2>
        <p>Enter your email address and we'll send you instructions to reset your password.</p>
        <form id="forgotPasswordForm" action="#" method="post" onsubmit="return validateForgotPasswordForm()">
            <div class="error-message" id="error-message"></div>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
            <button type="submit">Send Reset Link</button>
        </form>
        <div class="back-link">
            Remember your password? <a href="Login.aspx">Login here</a>
        </div>
    </div>

    <script>
        function validateForgotPasswordForm() {
            var email = document.getElementById('email').value;
            var errorMessage = document.getElementById('error-message');

            errorMessage.style.display = 'none';

            if (email.trim() === '') {
                errorMessage.textContent = 'Email is required.';
                errorMessage.style.display = 'block';
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
