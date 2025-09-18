<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate, java.time.temporal.ChronoUnit" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Booking</title>
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

        /* Booking Form */
        .form-container {
            margin-top: 150px;
            max-width: 600px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.2);
            z-index: 10;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: white;
        }

        .price-tag {
            font-size: 20px;
            color: #00ff99;
            font-weight: bold;
        }

        label {
            font-weight: 500;
        }

        img {
            border-radius: 10px;
            max-width: 100%;
            height: auto;
        }
    </style>

    <script>
        function calculatePrice() {
            let fromDate = new Date(document.getElementById("from_date").value);
            let toDate = new Date(document.getElementById("to_date").value);
            let pricePerDay = parseFloat(document.getElementById("pricePerDay").value);

            if (!isNaN(fromDate) && !isNaN(toDate) && pricePerDay > 0) {
                let timeDiff = toDate - fromDate;
                let days = timeDiff / (1000 * 60 * 60 * 24) + 1; // inclusive

                if (days > 0) {
                    document.getElementById("days").value = days;
                    let total = (days * pricePerDay).toFixed(2);
                    document.getElementById("totalprice").value = total;
                    document.getElementById("hiddenTotalPrice").value = total;
                } else {
                    document.getElementById("days").value = "";
                    document.getElementById("totalprice").value = "";
                    document.getElementById("hiddenTotalPrice").value = "";
                }
            }
        }

        function validateForm() {
            calculatePrice();
            return true;
        }
    </script>
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

<%
    String carId = request.getParameter("carId");
    String name = request.getParameter("name");
    String priceStr = request.getParameter("price");
    String image = request.getParameter("image");

    double pricePerDay = 0.0;
    if (priceStr != null) {
        try {
            pricePerDay = Double.parseDouble(priceStr);
        } catch (Exception e) {
            pricePerDay = 0.0;
        }
    }
%>

<!-- Booking Form -->
<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="form-container">
        <h2>Book Your Car</h2>
        <div class="row mb-3">
            <div class="col-md-6 text-center">
                <img src="<%= image %>" alt="<%= name %>">
            </div>
            <div class="col-md-6 d-flex flex-column justify-content-center">
                <h4><%= name %></h4>
                <p class="price-tag">₹<%= pricePerDay %> / day</p>
            </div>
        </div>

        <form action="bookingcontroller" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="user_id" value="<%= session.getAttribute("userId") %>">
            <input type="hidden" name="carId" value="<%=carId %>">
            <input type="hidden" id="pricePerDay" name="pricePerDay" value="<%= pricePerDay %>">
            <input type="hidden" name="totalprice" id="hiddenTotalPrice">
            <input type="hidden" name="image" value="<%= image %>">
            <input type="hidden" name="name" value="<%= name %>">

            <div class="mb-3">
                <label for="license_no" class="form-label">License Number</label>
                <input type="text" class="form-control" name="license_no" id="license_no" required>
            </div>

            <div class="mb-3">
                <label for="from_date" class="form-label">From Date</label>
                <input type="date" class="form-control" name="from_date" id="from_date" onchange="calculatePrice()" required>
            </div>

            <div class="mb-3">
                <label for="to_date" class="form-label">To Date</label>
                <input type="date" class="form-control" name="to_date" id="to_date" onchange="calculatePrice()" required>
            </div>

            <div class="mb-3">
                <label for="days" class="form-label">Number of Days</label>
                <input type="text" class="form-control" name="days" id="days" readonly>
            </div>

            <div class="mb-3">
                <label for="totalprice" class="form-label">Total Price (₹)</label>
                <input type="text" class="form-control" id="totalprice" readonly>
            </div>

            <button type="submit" class="btn btn-success w-100">Confirm Booking</button>
        </form>
    </div>
</div>

</body>
</html>
