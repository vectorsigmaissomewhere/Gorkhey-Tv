<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mvc.bean.Message" %>
<%@ page import="com.mvc.dao.MessageDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Message Received</title>
    <style>
        .container {
            text-align: center;
        }
        .header {
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
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
    </div>
    <h1>Messages Received</h1>
    <%
        // Retrieve the list of latest messages from the database
        MessageDao messageDao = new MessageDao();
        List<Message> messages = messageDao.getLatestMessages();

        // Check if there are any messages
        if (messages != null && !messages.isEmpty()) {
    %>
            <table>
                <tr>
                    <th>Username</th>
                    <th>Title</th>
                    <th>Description</th>
                </tr>
                <% for (Message message : messages) { %>
                    <tr>
                        <td><%= message.getUsername() %></td>
                        <td><%= message.getMessageTitle() %></td>
                        <td><%= message.getMessageDescription() %></td>
                    </tr>
                <% } %>
            </table>
    <%
        } else {
    %>
            <p>No messages received.</p>
    <%
        }
    %>
</body>
</html>



