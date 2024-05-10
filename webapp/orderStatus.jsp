<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"] {
            width: calc(100% - 20px); /* Adjust for input padding */
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            background-color: #333;
            color: #fff;
        }

        button[type="submit"]:hover {
            background-color: #555;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #333;
        }
    </style>
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
    <a href="Cart.jsp">Cart</a>
    <a href="Home.jsp">Home</a>
    <a href="Product.jsp">Product</a>
</body>
</html>
