<%@ page import="java.util.List" %>
<%@ page import="com.mvc.dao.ProductDaoData" %>
<%@ page import="com.mvc.bean.ProductDataBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Create ProductDataDao instance
    ProductDaoData productDataDao = new ProductDaoData();
    
    // Retrieve all products
    List<ProductDataBean> products = productDataDao.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Products</title>
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
            margin: 0 auto;
            width: 80%;
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
        a {
            text-decoration: none;
            color: blue;
        }
        a:hover {
            color: darkblue;
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
    <h1>All Products</h1>
    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Active</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <% for (ProductDataBean product : products) { %>
            <tr>
                <td><%= product.getProductId() %></td>
                <td><%= product.getProductName() %></td>
                <td><%= product.getProductDescription() %></td>
                <td><%= product.getProductPrice() %></td>
                <td><%= product.getProductStock() %></td>
                <td><%= product.getProductActive() %></td>
                <td><a href="editProduct.jsp?productId=<%= product.getProductId() %>">Edit</a></td>
                <td><a href="deleteProduct.jsp?productId=<%= product.getProductId() %>">Delete</a></td>
            </tr>
        <% } %>
    </table>
</div>
</body>
</html>



