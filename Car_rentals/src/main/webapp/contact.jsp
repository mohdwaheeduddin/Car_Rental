<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', sans-serif;
            overflow-x: hidden;
        }

        /* Background video */
        .bg-video {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            object-fit: cover;
            z-index: 0;
        }

        /* Sticky Header */
        .header {
            position: fixed;
            top: 0;
            width: 100%;
            height: 120px;
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(8px);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 40px;
            z-index: 999;
        }

        .logo-glow {
            display: flex;
            align-items: center;
        }

        .logo-glow img {
            height: 100px;
            filter: drop-shadow(0 0 3px white);
        }

        .nav-buttons {
            display: flex;
            gap: 15px;
        }

        .nav-buttons a {
            color: white;
            background: rgba(255, 255, 255, 0.2);
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            transition: background 0.3s;
        }

        .nav-buttons a:hover {
            background: rgba(255, 255, 255, 0.5);
        }

        /* Contact card styling */
        .contact-container {
            margin-top: 180px;
            width: 450px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.2);
            color: white;
            text-align: left;
        }

        .contact-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .contact-info {
            font-size: 16px;
            line-height: 1.8;
        }

        .contact-info strong {
            color: #ffcc00;
        }
    </style>
</head>
<body>

<!-- Background video -->
<video autoplay muted loop class="bg-video">
    <source src="car_video.mp4" type="video/mp4">
    Your browser does not support HTML5 video.
</video>

<!-- Sticky Header -->
<div class="header">
    <div class="logo-glow">
        <img src="car logo.avif" alt="Logo">
    </div>
    <h1 style="font-family: 'Cinzel', serif; color: red; text-shadow: 0 0 10px rgba(255,255,255,0.7); font-size: 48px; text-align: center; padding-left:160px">
        SV Car Rental
    </h1>    
    <div class="nav-buttons">
        <a href="contact.jsp">Contact</a>
        <a href="registration.jsp">Register</a>
        <a href="adminlogin.jsp">Admin Login</a>
    </div>
</div>

<!-- Contact Info Card -->
<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="contact-container">
        <h2>Contact Us</h2>
        <div class="contact-info">
            <p><strong>Phone:</strong> +91 8801415305</p>
            <p><strong>Email:</strong> support@SVcarbooking.com</p>
            <p><strong>Office Location:</strong><br>
                SV Car Rental KPHB,<br>
                3nd Floor,above Airtel showroom,<br>
                Hyderabad, Telangana, India
            </p>
        </div>
    </div>
</div>

</body>
</html>
