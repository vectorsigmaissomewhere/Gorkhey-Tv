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
// deleting all session value
session.invalidate(); 
response.sendRedirect("Login.jsp");
%>
</body>
</html>
