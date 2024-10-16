<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contactus.aspx.cs" Inherits="Nothing.Contactus" %>

!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Online Voting System</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background: #f4f4f9;
        }

        .header {
            background: #0D47A1;
            color: white;
            padding: 10px 0; /* Smaller header */
            text-align: center;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin-bottom: 20px;
            font-size: 28px;
        }

        p {
            margin-bottom: 20px;
            text-align: justify;
            color: #555;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
        }

        .contact-form input, 
        .contact-form textarea {
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .contact-form button {
            padding: 12px;
            background-color: #0D47A1;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .contact-form button:hover {
            background-color: #1565C0;
        }

        .contact-details {
            margin-top: 20px;
            font-size: 14px;
        }

        .contact-details h2 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #0D47A1;
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>Contact Us</h1>
    </header>
    <div class="container">
        <h1>Get in Touch with Us</h1>
        <p>We are here to help you with any questions or feedback you may have about the Online Voting System. Whether you need assistance with registration, have technical queries, or simply want to share your thoughts, please feel free to reach out to us using the form below or through our contact details provided. Your input is invaluable in helping us improve and deliver a better experience for all users.</p>

        <div class="contact-form">
            <form id="contactForm" action="#" method="post" onsubmit="return validateContactForm()">
                <input type="text" id="name" name="name" placeholder="Your Name" required>
                <input type="email" id="email" name="email" placeholder="Your Email" required>
                <input type="text" id="subject" name="subject" placeholder="Subject" required>
                <textarea id="message" name="message" rows="5" placeholder="Your Message" required></textarea>
                <button type="submit">Send Message</button>
            </form>
        </div>

        <div class="contact-details">
            <h2>Contact Information</h2>
            <p><strong>Email:</strong> support@onlinevotingsystem.in</p>
            <p><strong>Phone:</strong> +91 1234 567 890</p>
            <p><strong>Address:</strong> 123, Election Street, New Delhi, India</p>
            <p>We are available from Monday to Friday, 9:00 AM to 6:00 PM IST. Feel free to reach out to us during these hours, and we will be happy to assist you.</p>
        </div>
    </div>

    <script>
        function validateContactForm() {
            var name = document.getElementById('name').value;
            var email = document.getElementById('email').value;
            var subject = document.getElementById('subject').value;
            var message = document.getElementById('message').value;

            if (name.trim() === '' || email.trim() === '' || subject.trim() === '' || message.trim() === '') {
                alert('Please fill in all fields.');
                return false;
            }

            return true;
        }
    </script>
</body>
</html>