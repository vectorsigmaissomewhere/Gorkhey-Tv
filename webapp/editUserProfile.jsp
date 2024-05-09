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
</body>
</html>
