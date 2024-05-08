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
        <p>Total: <%= CartUtility.calculateTotal(userName) %></p>
        <form action="orderStatus.jsp" method="post">
          <p>Proceed To Order</p>
          <button type="submit">Proceed to Order</button>
         </form>
        
        <a href="Home.jsp">Home Page</a>
    <% } else { %>
        <% 
            String message = "Login to view the cart.";
            response.sendRedirect("Login.jsp?message=" + java.net.URLEncoder.encode(message, "UTF-8"));
        %>
    <% } %>
</body>
</html>
