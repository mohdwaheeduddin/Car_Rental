<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, models.carmodels" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home - SV Car Rental</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', sans-serif;
            overflow-x: hidden;
            color: white;
        }

        .bg-video {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            object-fit: cover;
            z-index: 0;
        }

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
            z-index: 1000;
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

        .tagline-marquee {
            position: relative;
            top: 120px;
            z-index: 999;
            background-color: rgba(255, 255, 255, 0.2);
            padding: 10px;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            backdrop-filter: blur(6px);
        }

        .carousel-container {
            margin-top: 180px;
            padding: 40px 20px;
            z-index: 1;
            position: relative;
        }

        .carousel-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }

        .car-card {
            background-color: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            color: white;
            border-radius: 15px;
            width: 280px;
            padding: 20px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.2);
            text-align: center;
        }

        .car-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
        }

        .car-card button {
            margin-top: 10px;
        }

        .footer {
            margin-top: 60px;
            padding: 20px;
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(5px);
            text-align: center;
            font-size: 16px;
        }

        .footer a {
            color: #00ffff;
            text-decoration: none;
        }
    </style>
</head>
<body>

<!-- Background video -->
<video autoplay muted loop class="bg-video">
    <source src="car_video.mp4" type="video/mp4">
</video>

<!-- Header -->
<div class="header">
    <div class="logo-glow">
        <img src="car logo.avif" alt="Logo">
    </div>
    <h1 style="font-family: 'Cinzel', serif; color: red; text-shadow: 0 0 10px rgba(255,255,255,0.7); font-size: 48px;">
        SV Car Rental
    </h1>
    <div class="nav-buttons">
        <a href="logout.jsp">Logout</a>
        <a href="contact.jsp">Contact</a>
        <a href="adminlogin.jsp">Admin</a>
    </div>
</div>

<!-- Tagline -->
<div class="tagline-marquee">
    <marquee behavior="scroll" direction="left" scrollamount="8">
        🚗 Book your first ride FREE on SV Car Rental! Limited Offer 🚗
    </marquee>
</div>

<!-- Car Cards -->
<div class="carousel-container">
    <div class="carousel-grid">
        <%
            List<carmodels> carList = (List<carmodels>) request.getAttribute("carList");
            if (carList != null && !carList.isEmpty()) {
                for (carmodels car : carList) {
        %>
            <div class="car-card">
                <img src="Cars/<%= car.getCarimage() %>" alt="Car Image">
                <h3><%= car.getCname() %></h3>
                 <p><strong>Id:</strong> <%= car.getCid() %></p>
                <p><strong>Model:</strong> <%= car.getModel() %></p>
                <p><strong>Variant:</strong> <%= car.getVariant() %></p>
                <p><strong>Specs:</strong> <%= car.getSpecifications() %></p>
                <p><strong>₹<%= car.getCostPerDay() %>/day</strong></p>
                <form action="carcontroller" method="get">
                    
                    <input type="hidden" name="cname" value="<%= car.getCname() %>">
                    <input type="hidden" name="model" value="<%= car.getModel() %>">
                    <input type="hidden" name="cost" value="<%= car.getCostPerDay() %>">

                    <!-- Updated Book Now link -->
               <a href="booking.jsp?carId=<%= car.getCid() %>&name=<%= car.getCname() %>&price=<%= car.getCostPerDay() %>&image=Cars/<%= car.getCarimage() %>">
    <button type="button">Book Now</button>
</a>





                </form>
            </div>
        <%
                }
            } else {
        %>
            <p>No cars available currently.</p>
        <%
            }
        %>
    </div>
</div>

<!-- Footer -->
<div class="footer" id="contact">
    📸 Follow us on Instagram:
    <a href="https://instagram.com/Waheed_0111" target="_blank">@waheed_0111</a> |
    📞 Contact: +91-8801415304
</div>

</body>
</html>
