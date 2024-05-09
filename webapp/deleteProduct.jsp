<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.mvc.dao.ProductDaoData,com.mvc.bean.ProductDataBean" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Product</title>
</head>
<body>
    <h1>Delete Product</h1>
    <%
        // Retrieve the product ID from the request parameter
        int productId = Integer.parseInt(request.getParameter("productId"));

        // Create ProductDataDao instance
        ProductDaoData productDataDao = new ProductDaoData();

        // Retrieve the product details by ID
        ProductDataBean product = productDataDao.getProductById(productId);
    %>
    <%-- Check if the product exists --%>
    <% if (product != null) { %>
        <p>You are about to delete the following product:</p>
        <p><strong>Product ID:</strong> <%= product.getProductId() %></p>
        <p><strong>Name:</strong> <%= product.getProductName() %></p>
        <p><strong>Description:</strong> <%= product.getProductDescription() %></p>
        <p><strong>Price:</strong> <%= product.getProductPrice() %></p>
        <p><strong>Stock:</strong> <%= product.getProductStock() %></p>
        <p><strong>Active:</strong> <%= product.getProductActive() %></p>
        <form action="DeleteProductServlet" method="post">
            <input type="hidden" name="productId" value="<%= product.getProductId() %>">
            <input type="submit" value="Confirm Delete">
        </form>
        <a href="allProductAndEditProduct.jsp">Cancel</a>
    <% } else { %>
        <p>Product not found.</p>
    <% } %>
</body>
</html>
