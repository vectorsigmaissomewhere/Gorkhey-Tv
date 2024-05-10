<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .header {
        background-color: #333;
        color: #fff;
        padding: 20px;
        text-align: center;
    }

    .header a {
        color: #fff;
        text-decoration: none;
        margin-right: 20px;
    }

    .content {
        padding: 20px;
        text-align: center;
    }

    .footer {
        background-color: #333;
        color: #fff;
        padding: 20px;
        text-align: center;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
</style>
</head>
<body>

<div class="header">
    <a href="addNewProduct.jsp">Add New Product</a>
    <a href="allProductAndEditProduct.jsp">All Products and Edit Products</a>
    <a href="messageReceived.jsp">Message Received</a>
    <a href="OrderedReceived.jsp">Ordered Received</a>
    <a href="deliveredOrder.jsp">Delivered Orders</a>
    <a href="Logout.jsp">Logout</a>
</div>

<div class="content">
    <h1>Welcome Admin</h1>
</div>

<div class="footer">
    <h3>This is our footer section</h3>
</div>

</body>
</html>

