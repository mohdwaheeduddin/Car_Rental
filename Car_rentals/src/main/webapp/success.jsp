<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.loginmodel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Background video */
        .bg-video {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            object-fit: cover;
            z-index: -1;
        }

        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: white;
        }

        /* Wrapper to center header + card */
        .page-wrapper {
            display: flex;
            flex-direction: column;
            justify-content: center; /* vertical center */
            align-items: center;     /* horizontal center */
            min-height: 100vh;
            text-align: center;
        }

        .header {
            width: 100%;
           
            height: 120px;
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(8px);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 40px;
            border-radius: 15px;
            margin-bottom: 40px;
        }

        .logo-glow {
            display: flex;
            align-items: center;
        }

        .logo-glow img {
            height: 100px;
            filter: drop-shadow(0 0 3px white);
        }

        .card {
            width: 400px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 25px rgba(255, 255, 255, 0.3);
            color: white;
        }

        .card-header {
            background: rgba(40, 167, 69, 0.8);
            color: white;
            font-size: 22px;
            font-weight: bold;
            text-align: center;
            padding: 15px;
            border-radius: 10px;
        }

        .card-body {
            padding: 20px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }

        .detail-label {
            font-weight: bold;
            color: #f8f9fa;
        }

        hr {
            border-top: 2px solid rgba(255, 255, 255, 0.3);
        }

        img {
            max-width: 100%;
            border-radius: 12px;
            margin-top: 10px;
        }

        .btn-logout {
            background: #dc3545;
            color: white;
            font-weight: bold;
            border-radius: 25px;
            padding: 10px 25px;
            transition: all 0.3s ease-in-out;
            text-decoration: none;
        }

        .btn-logout:hover {
            background: #c82333;
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(220,53,69,0.4);
        }
    </style>
</head>
<body>

<!-- Background Video -->
<video autoplay muted loop class="bg-video">
    <source src="car_video.mp4" type="video/mp4">
    Your browser does not support HTML5 video.
</video>

<div class="page-wrapper">
    <!-- Header -->
    <div class="header">
        <div class="logo-glow">
            <img src="car logo.avif" alt="Logo">
        </div>
        <h1 style="font-family: 'Cinzel', serif; color: red; text-shadow: 0 0 10px rgba(255,255,255,0.7); font-size: 36px;">
            SV Car Rental
        </h1>    
        <div class="nav-buttons">
            <a href="contact.jsp" style="color:white; margin:0 10px; text-decoration:none;">Contact</a>
            <a href="registration.jsp" style="color:white; margin:0 10px; text-decoration:none;">Register</a>
            <a href="adminlogin.jsp" style="color:white; margin:0 10px; text-decoration:none;">Admin Login</a>
        </div>
    </div>

    <!-- Card -->
    <div class="card">
        <div class="card-header">✅ Booking Confirmed!</div>
        <div class="card-body">
            <%
                loginmodel user = (loginmodel) session.getAttribute("user");

                String carId = request.getParameter("carId");
                String carName = request.getParameter("name");
                String pricePerDay = request.getParameter("pricePerDay");
                String licenseNo = request.getParameter("license_no");
                String fromDate = request.getParameter("from_date");
                String toDate = request.getParameter("to_date");
                String days = request.getParameter("days");
                String totalPrice = request.getParameter("totalprice");
                String image = request.getParameter("image");
            %>

            <h4 class="mb-3 text-light">👤 User Details</h4>
            <p><span class="detail-label">User ID:</span> <%= user.getUserid() %></p>
            <p><span class="detail-label">Name:</span> <%= user.getFirstname() %> <%= user.getLastname() %></p>

            <hr>

            <h4 class="mb-3 text-light">🚗 Car Details</h4>
            <p><span class="detail-label">Car ID:</span> <%= carId %></p>
            <p><span class="detail-label">Car Name:</span> <%= carName %></p>
            <p><span class="detail-label">Price/Day:</span> ₹<%= pricePerDay %></p>
            <img src="<%= image %>" alt="Car Image">

            <hr>

            <h4 class="mb-3 text-light">📅 Booking Details</h4>
            <p><span class="detail-label">License No:</span> <%= licenseNo %></p>
            <p><span class="detail-label">From:</span> <%= fromDate %></p>
            <p><span class="detail-label">To:</span> <%= toDate %></p>
            <p><span class="detail-label">Days:</span> <%= days %></p>
            <p><span class="detail-label">Total Price:</span> ₹<%= totalPrice %></p>

            <div class="text-center mt-4">
                <a href="login.jsp" class="btn btn-logout">🚪 Logout</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
