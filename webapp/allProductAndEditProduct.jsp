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
</head>
<body>
    <h1>All Products</h1>
    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Active</th>
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
</body>
</html>

