<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mvc.util.DBConnection" %>
<%@ page import="com.mvc.bean.CartBean" %>
<%@ page import="com.mvc.dao.CartDao" %>
<%@ page import="com.mvc.dao.CartUtility" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        td button {
            background-color: #f44336;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        td button:hover {
            background-color: #d32f2f;
        }

        .total {
            text-align: right;
            margin-bottom: 20px;
        }

        .proceed-btn {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .proceed-btn:hover {
            background-color: #45a049;
        }

        .link-container {
            text-align: center;
        }

        .link-container a {
            margin-right: 10px;
            color: #333;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <% 
            String userName = null;
            try {
              userName = (String) session.getAttribute("userName");
            } catch (NullPointerException e) {
            }
            if(userName.equals("isadmin")){
            	response.sendRedirect("AdminDashboard.jsp");
            }
        %>
        <% if (userName != null && !userName.isEmpty()) { %>
            <table>
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Action</th> <!-- New column for delete button -->
                    </tr>
                </thead>
                <tbody>
                    <% 
                        // Establish database connection. You may have a separate DB connection management.
                        Connection connection = DBConnection.createConnection();
                        
                        // Create CartDao instance
                        CartDao cartDao = new CartDao(connection);
                        
                        try {
                            List<CartBean> cartItems = cartDao.getCartItems(userName);
                            for (CartBean cartItem : cartItems) {
                    %>
                            <tr>
                                <td><%= cartItem.getProductName() %></td>
                                <td><%= cartItem.getPrice() %></td>
                                <td>
                                    <form action="DeleteFromCartServlet" method="post">
                                        <input type="hidden" name="productName" value="<%= cartItem.getProductName() %>">
                                        <button type="submit">Delete</button>
                                    </form>
                                </td>
                            </tr>
                    <% 
                            }
                        } catch (SQLException e) {
                            // Handle SQL exception
                            e.printStackTrace();
                            // Redirect to an error page or handle the error accordingly
                            response.sendRedirect("error.jsp");
                        } finally {
                            try {
                                connection.close();
                            } catch (SQLException e) {
                                // Handle connection close exception
                                e.printStackTrace();
                            }
                        }
                    %>
                </tbody>
            </table>
            <p class="total">Total: <%= CartUtility.calculateTotal(userName) %></p>
            <form action="orderStatus.jsp" method="post">
              <p>Proceed To Order</p>
              <button type="submit" class="proceed-btn">Proceed to Order</button>
             </form>
            <div class="link-container">
                <a href="orderedHistory.jsp">Check purchase History</a>
                <a href="Home.jsp">Home Page</a>
                <a href="Product.jsp">Product</a>
            </div>
        <% } else { %>
            <% 
                String message = "Login to view the cart.";
                response.sendRedirect("Login.jsp?message=" + java.net.URLEncoder.encode(message, "UTF-8"));
            %>
        <% } %>
    </div>
</body>
</html>


