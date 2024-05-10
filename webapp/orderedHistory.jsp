<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.mvc.bean.OrderDetail"%>
<%@ page import="com.mvc.dao.OrderDao"%>

<%
    // Get the username from the session
    String username = (String) session.getAttribute("userName");
	if(username.equals("isadmin")){
		response.sendRedirect("AdminDashboard.jsp");
		}
	username = (String) request.getSession().getAttribute("userName");
    if(username != "isadmin"){
	   response.sendRedirect("Home.jsp");
     }
    // Ensure that username is not null
    if (username == null || username.isEmpty()) {
        // Redirect to login page or display an error message
        response.sendRedirect("Login.jsp");
    } else {
        // Assuming orders are obtained from the database using OrderDao
        List<OrderDetail> orders = null;
        try {
            // Retrieve orders for the user from the database
            OrderDao orderDao = new OrderDao();
            orders = orderDao.getOrdersByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException
        } finally {
            
        }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders History</title>
</head>
<body>
<h1>My Orders</h1>
<table border="1">
    <tr>
        <th>Order ID</th>
        <th>Username</th>
        <th>Product Name</th>
        <th>Total</th>
        <th>Payment Method</th>
        <th>Transaction ID</th>
        <th>Address</th>
        <th>Delivery Date</th>
    </tr>
    <% 
        // Iterate over the orders for the user
        for (OrderDetail order : orders) {
    %>
    <tr>
        <td><%= order.getOrderId() %></td>
        <td><%= order.getUsername() %></td>
        <td><%= order.getProductName() %></td>
        <td><%= order.getTotal() %></td>
        <td><%= order.getPaymentMethod() %></td>
        <td><%= order.getTransactionId() %></td>
        <td><%= order.getAddress() %></td>
        <td><%= order.getDeliveryDate() %></td>
    </tr>
    <% } 
  }%>
</table>
</body>
</html>
