<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="home.css">
</head>
<body>
    <% 
    String username = "";
    Object userNameObj = session.getAttribute("userName");
    if(userNameObj != null) {
        username = userNameObj.toString();
    }
%>
    
    <div class="banner">
        <div class="navbar">
            <img src="img/logo.png" class="logo">
            <ul>
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="#">Product</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">About Us</a></li>
                <%if(username.equals("")){%>
                <li>
                <li><a href="Login.jsp">Login</a></li>
                <%} %>
                <%if(username != ""){%>
                <li><a href="Logout.jsp">Logout</a></li>
                <%} %>
                <li><a href="UserProfile.jsp"><%out.println(username); %></a><li>
            </ul>
        </div>
        <div class="content">
            <h1>WELCOME TO GORKHEY TV</h1>
            <p>Follow GORKHEYTV ON FACEBOOK<br> AND GET THE LATEST UPDATES.</p>
            <div>
                <a href="https://www.facebook.com"><button type="button"><span></span>FOLLOW US</button></a>
            </div>
        </div>
    </div>    
    <div class="products">
        <h2>Featured Products</h2>
        <div class="product-images">
            <div class="product-item">
                <img src="img/logo2.jpg" alt="Product 1">
                <p class="product-caption">Description of Product 1</p>
            </div>
            <div class="product-item">
                <img src="img/logo1.png" alt="Product 2">
                <p class="product-caption">Description of Product 2</p>
            </div>
            <div class="product-item">
                <img src="img/logo.png" alt="Product 3">
                <p class="product-caption">Description of Product 3</p>
            </div>
        </div>    
        <div class="product-description">
            <p>Check out our latest collection of products. Explore more options in our store.</p>
        </div>
    </div>
    <footer>
        <p>&copy; 2024 Your Company Name. All rights reserved.</p>
    </footer>
</body>
</html>
