<%@ page import="com.mvc.dao.ProductDaoData" %>
<%@ page import="com.mvc.bean.ProductDataBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Retrieve the product ID parameter from the request
    int productId = Integer.parseInt(request.getParameter("productId"));

    // Create ProductDataDao instance
    ProductDaoData productDataDao = new ProductDaoData();

    // Retrieve the product details by ID
    ProductDataBean product = productDataDao.getProductById(productId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
</head>
<body>
    <h1>Edit Product</h1>
    <form action="updateProduct.jsp" method="post">
        <input type="hidden" name="productId" value="<%= product.getProductId() %>">
        Name: <input type="text" name="name" value="<%= product.getProductName() %>"><br>
        Description: <input type="text" name="description" value="<%= product.getProductDescription() %>"><br>
        Price: <input type="text" name="price" value="<%= product.getProductPrice() %>"><br>
        Stock: <input type="text" name="stock" value="<%= product.getProductStock() %>"><br>
        Active: <input type="text" name="active" value="<%= product.getProductActive() %>"><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>
