<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Nothing.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Voting System</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            overflow-x: hidden;
        }

        /* Header and Navigation Bar */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #0D47A1;
            color: white;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        nav {
            display: flex;
            gap: 15px;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

        .login-icon {
            cursor: pointer;
        }

/* Background Image Slider */
.slider {
    position: relative;
    width: 100%;
    height: 500px;
    overflow: hidden;
}

.slides {
    display: flex;
    width: 300%; /* Since you have 3 images, 100% per image */
    height: 100%;
    animation: slide 12s linear infinite;
}

.slides img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

@keyframes slide {
    0% { transform: translateX(0); }        /* Start with the first image */
    33.33% { transform: translateX(-100%); } /* Move to the second image */
    66.66% { transform: translateX(-200%); } /* Move to the third image */
    100% { transform: translateX(0); }      /* Return to the first image */
}



        /* Slogan */
        .slogan {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 32px;
            font-weight: bold;
            text-shadow: 2px 2px 4px #000000;
            text-align: center;
        }

        /* Main Content */
        .content {
            padding: 20px;
        }

        .content section {
            margin-bottom: 40px;
        }

        .content h2 {
            margin-top: 0;
            color: #0D47A1;
        }

        .content p {
            font-size: 18px;
            line-height: 1.6;
        }

        footer {
            background-color: #0D47A1;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .team-section {
            text-align: center;
            background-color: #0D47A1;
            padding: 50px 20px;
        }

        .team-section h1 {
            color: white;
            font-size: 36px;
        }

        .team-section p {
            color: white;
            margin: 20px auto;
            font-size: 16px;
            max-width: 600px;
        }

        .team-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 30px;
        }

        .team-member {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 300px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .team-member:hover {
            transform: translateY(-10px);
        }

        .team-member img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            object-fit: cover;
        }

        .team-member h3 {
            margin-top: 15px;
            font-size: 22px;
        }

        .team-member p {
            font-size: 14px;
            color: #555;
        }

        .social-icons {
            margin-top: 10px;
        }

        .social-icons a {
            margin: 0 5px;
            color: #0D47A1;
            font-size: 18px;
            text-decoration: none;
        }

        .social-icons a:hover {
            color: #1565C0;
        }
        
        {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .manifesto-section {
            text-align: center;
            padding: 50px 20px;
            background-color: #ffffff;
        }

        .manifesto-section h1 {
            font-size: 36px;
            color: #333;
        }

        .manifesto-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 40px;
        }

        .manifesto-card {
            background-color: #e3e3e3;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 280px;
            padding: 30px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .manifesto-card:hover {
            transform: translateY(-5px);
        }

        .manifesto-card h3 {
            font-size: 22px;
            margin-bottom: 20px;
        }

        .manifesto-card img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .manifesto-card p {
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
        }

        .download-button {
            background-color: #0D47A1;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .download-button:hover {
            background-color: #1565C0;
        }


    </style>
</head>
<body>
    <header>
        <div class="logo">Online Voting System</div>
        <nav>
            <a href="Home.aspx">Home</a>
            <a href="AboutUs.aspx">About Us</a>
            <a href="ContactUs.aspx">Contact Us</a>
            <a href="Default.aspx">Login</a>
            <a href="Registration.aspx">Registration</a>
        </nav>
        <div class="login-icon">🔒</div>
    </header>

    <div class="slider">
        <div class="slides">
            <img src="Images/h4.jpg" alt="Slide 1">
            <img src="Images/h2.jpg" alt="Slide 2">
            <img src="Images/h3.jpg" alt="Slide 3">
        </div>
        <div class="slogan">Your Vote, Your Future</div>
    </div>

    <section class="manifesto-section">
        <h1>Manifesto 2024</h1>
        <p>Explore the 2024 election manifestos of the major political parties. Click below to download the full PDF documents.</p>

        <div class="manifesto-container">

            <!-- BJP Manifesto Card -->
            <div class="manifesto-card">
                <img src="Photo/h4.jpg" alt="BJP Logo">
                <h3>BJP Manifesto 2024</h3>
                <p>The Bharatiya Janata Party's agenda for 2024. Click below to download the full manifesto.</p>
                <a href="./Menifesto/Unit-8 Prolog.pdf" download class="download-button">Download PDF</a>
            </div>

            <!-- Congress Manifesto Card -->
            <div class="manifesto-card">
                <img src="https://via.placeholder.com/60" alt="Congress Logo">
                <h3>Congress Manifesto 2024</h3>
                <p>The Indian National Congress' agenda for 2024. Click below to download the full manifesto.</p>
                <a href="congress_manifesto_2024.pdf" download class="download-button">Download PDF</a>
            </div>

        </div>
    </section>


    <section class="team-section">
        <h1>Our Team</h1>
        <p>Whether you're a programmer, designer, freelancer or need a team, we've got the best talent for your project.</p>

        <div class="team-container">
            <div class="team-member">
                <img src="Images/manish.jpg" alt="Mir Manish">
                <h3>Mir Manish</h3>
                <p>Team Leader</p>
                <p>UI/UX Designer</p>
                <p>Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>

            <div class="team-member">
                <img src="Images/dada.jpg" alt="Vansh Joshi">
                <h3>Vansh Joshi</h3>
                <p>Back-End Developer</p>
                <br />
                <p>Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>

            <div class="team-member">
                <img src="Images/pintu.jpg" alt="Dakshesh Solanki">
                <h3>Dakshesh Solanki</h3>
                <p>Back-End Developer</p>
                <p>Documentation Developer</p>
                <p>Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </section>

    <footer>
        &copy; 2024 Online Voting System. All rights reserved.
    </footer>
</body>
</html>
