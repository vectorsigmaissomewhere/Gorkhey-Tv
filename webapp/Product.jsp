<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mvc.bean.ProductBean, com.mvc.dao.ProductDao, com.mvc.util.DBConnection, java.util.List" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <link rel="stylesheet" href="product.css">
</head>
<body>
<% 
    String username = "";
    Object userNameObj = session.getAttribute("userName");
    if(userNameObj != null) {
        username = userNameObj.toString();
    }
%>
<%
        ProductDao productDao = new ProductDao(DBConnection.createConnection());
        List<ProductBean> productList = productDao.getAllProducts();
    %>
<section id="header">
    <div class="navbar">
        <img src="img/logo.png" class="logo">
        <ul>
            <li><a href="Home.jsp">Home</a></li>
            <li><a href="Product.jsp">Product</a></li>
            <li><a href="Contact.jsp">Contact</a></li>
            <li><a href="AboutUs.jsp">About Us</a></li>
            <li><a href="Cart.jsp">Cart</a></li>
            <% if(username.equals("")) { %>
                <li><a href="Login.jsp">Login</a></li>
            <% } else { %>
                <li><a href="Logout.jsp">Logout</a></li>
                <li><a href="UserProfile.jsp"><%= username %></a></li>
            <% } %>
        </ul>
    </div>
</section>

<div class="container">
    <h1>Our <span>Products</span></h1>
    <div class="products">
        <!-- Product 1 -->
        <% 
        if(productList != null && !productList.isEmpty()) {
            for(ProductBean product : productList) {
        %>
        <div class="product">
            <img src="img/1.jpg" alt="Product 1">
            <h2><%= product.getProductName() %></h2>
            <h2>Rs. <%= product.getProductPrice() %></h2>
            <p><%= product.getProductDescription() %></p>
            <button>Add to Cart</button> 
        </div>    
        <% 
            }
        } else {
        %> 
    </div> <!-- Closing .products -->
</div> <!-- Closing .container -->
<% } %>

<body>
    <div class="container">
        <div class="products">
        </div>
        <div class="pagination">
            <button onclick="location.href='/product2.html'">Next Page</button>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
