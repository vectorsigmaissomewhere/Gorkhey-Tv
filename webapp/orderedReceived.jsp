<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,java.sql.SQLException" %>
<%@ page import="com.mvc.bean.OrderDetail" %>
<%@ page import="com.mvc.dao.OrderDao"%>


<%
    // Assuming orders are obtained from the database using OrderDao
    List<OrderDetail> orders = null;
    try {
        // Retrieve orders from the database
        OrderDao orderDao = new OrderDao();
        orders = orderDao.getAllOrders();
    } catch (SQLException e) {
        // Handle SQLException
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ordered Received</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .container {
        text-align: center;
    }
    h1 {
        color: #333;
    }
    table {
        margin: 0 auto; /* Center the table */
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #ddd;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 8px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<div class="container">
    <div class="header">
    	<a href="AdminDashboard.jsp">Admin Dashboard</a>
        <a href="addNewProduct.jsp">Add New Product</a>
        <a href="allProductAndEditProduct.jsp">All Products and Edit Products</a>
        <a href="messageReceived.jsp">Message Received</a>
        <a href="OrderedReceived.jsp">Ordered Received</a>
        <a href="deliveredOrder.jsp">Delivered Orders</a>
        <a href="Logout.jsp">Logout</a>
    </div>
    <h1>Ordered Received</h1>
    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Username</th>
            <th>Product Name</th>
            <th>Total</th>
            <th>Payment Method</th>
            <th>Transaction ID</th>
            <th>Status</th>
            <th>Address</th>
            <th>Order Date</th>
            <th>Delivery Date</th>
            <th>Click to deliver order</th>
        </tr>
        <% for (OrderDetail order : orders) { %>
        <tr>
            <td><%= order.getOrderId() %></td>
            <td><%= order.getUsername() %></td>
            <td><%= order.getProductName() %></td>
            <td><%= order.getTotal() %></td>
            <td><%= order.getPaymentMethod() %></td>
            <td><%= order.getTransactionId() %></td>
            <td><%= order.getStatus() %></td>
            <td><%= order.getAddress() %></td>
            <td><%= order.getOrderDate() %></td>
            <td><%= order.getDeliveryDate() %></td>
            <td>
                <form action="MarkOrderDeliveredServlet" method="post">
                    <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                    <input type="submit" value="Order Delivered">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
