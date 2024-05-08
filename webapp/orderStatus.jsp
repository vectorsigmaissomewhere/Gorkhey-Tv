<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Status</title>
</head>
<body>
    <h2>Order Details</h2>
    <% String message = request.getParameter("message");
           if (message != null && !message.isEmpty()) {
               out.println(message);
           }
     %>
    <form action="OrderServlet" method="post">
        <label for="transaction_id">Transaction ID:</label>
        <input type="text" id="transaction_id" name="transaction_id" required><br><br>
        
        <label for="payment_method">Payment Method:</label>
        <input type="text" id="payment_method" name="payment_method" required><br><br>
        
        <button type="submit" name="orderButton">Order</button>
    </form>
</body>
</html>
