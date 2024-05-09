<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mvc.bean.User" %>
<%@ page import="com.mvc.dao.UserDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
</head>
<body>
    <h2>User Profile</h2>
    <%
        String username = (String) request.getSession().getAttribute("userName");

        if(username != null) {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserByUsername(username);

            if(user != null) {
    %>
                <p>Full Name: <%= user.getFullName() %></p>
                <p>Email: <%= user.getEmail() %></p>
                <p>Username: <%= user.getUsername() %></p>
                <p>Mobile Number: <%= user.getMobileNumber() %></p>
                <p>City: <%= user.getCity() %></p>
                <p>State: <%= user.getState() %></p>
                <p>Country: <%= user.getCountry() %></p>
                <a href="editUserProfile.jsp"><p>Edit your profile</p></a>
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

