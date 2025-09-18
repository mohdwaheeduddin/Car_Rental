<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import=" utility.databaseconnection" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h2>Welcome, Admin <%= admin %></h2>
    <a href="logout" class="btn btn-danger">Logout</a>
    <hr>

    <h3>Add New Car</h3>
    <form action="AddCarServlet" method="post">
        <input type="text" name="carName" placeholder="Car Name" required>
        <input type="text" name="pricePerDay" placeholder="Price/Day" required>
        <input type="text" name="image" placeholder="Image URL" required>
        <button type="submit" class="btn btn-success">Add Car</button>
    </form>

    <hr>
    <h3>Car List</h3>
    <table class="table table-dark table-striped">
        <tr>
            <th>ID</th><th>Name</th><th>Price/Day</th><th>Image</th><th>Actions</th>
        </tr>
        <%
            try (Connection con = databaseconnection.getConnection()) {
            	
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM cars");
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("car_id") %></td>
            <td><%= rs.getString("cname") %></td>
            <td>₹<%= rs.getDouble("cost_perday") %></td>
            <td><%=rs.getString("specifications") %></td>
            <td><%=rs.getString("model")%></td>
            <td><img src="<%= rs.getString("carimage") %>" width="100"></td>
            <td>
                <a href="editCar.jsp?id=<%= rs.getInt("car_id") %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="DeleteCarServlet?id=<%= rs.getInt("car_id") %>" class="btn btn-danger btn-sm">Delete</a>
            </td>
        </tr>
        <% } } catch (Exception e) { out.println("DB Error: "+e); } %>
    </table>
</body>
</html>
