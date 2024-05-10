<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mvc.bean.User" %>
<%@ page import="com.mvc.dao.UserDAO" %>
<%@ page import="com.mvc.bean.PasswordEncryptionWithAes" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User Profile</title>
    <style>
        /* Apply styles to the body */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        /* Style the heading */
        h2 {
            text-align: center;
            color: #333;
        }

        /* Style the form */
        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Style the input fields */
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; /* Ensure that padding and border are included in the width */
        }

        /* Style the button */
        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Style the anchor tags */
        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Edit User Profile</h2>
    <% 
        String username = (String) request.getSession().getAttribute("userName");

        if(username != null) {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserByUsername(username);

            if(user != null) {
    %>
                <form action="UpdateUserProfileServlet" method="post">
                    <input type="hidden" name="username" value="<%= user.getUsername() %>">
                    <p>Full Name: <input type="text" name="fullName" value="<%= user.getFullName() %>"></p>
                    <p>Email: <%= user.getEmail() %></p>
                    <p>New Password: <input type="password" name="newPassword"></p>
                    <p>Mobile Number: <input type="text" name="mobileNumber" value="<%= user.getMobileNumber() %>"></p>
                    <p>City: <input type="text" name="city" value="<%= user.getCity() %>"></p>
                    <p>State: <input type="text" name="state" value="<%= user.getState() %>"></p>
                    <p>Country: <input type="text" name="country" value="<%= user.getCountry() %>"></p>
                    <button type="submit">Save Changes</button>
                </form>
    <% 
            } else {
    %>
                <p>No user data found.</p>
    <% 
            }
        } else {
    %>
            <p>Username not found in session.</p>
    <% 
        }
    %>
    <a href="Cart.jsp">Cart</a>
    <a href="Home.jsp">Home</a>
    <a href="Product.jsp">Product</a>
</body>
</html>
