<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
    String userName = null;
    try {
      userName = (String) session.getAttribute("userName");
    } catch (NullPointerException e) {
    }
  %>
<% if (userName != null && !userName.isEmpty()) { %>
			<p>Here is your Cart Thank you</p>
			<a href="Home.jsp">Home Page</a>
        <% } else { %>
          <p>Sorry you need to log-in to view the cart</p>
          <p><a href="Login.jsp">log-in</a></p>
        <% } %>
</body>
</html>
