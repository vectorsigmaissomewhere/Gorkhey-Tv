package com.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.CartDao;
import com.mvc.util.DBConnection;

@WebServlet("/DeleteFromCartServlet")
public class DeleteFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the product name to be deleted from the request parameter
        String productName = request.getParameter("productName");

        // Assuming the username is stored in session as "userName"
        String username = (String) request.getSession().getAttribute("userName");

        // Establish database connection. You may have a separate DB connection management.
        Connection connection = DBConnection.createConnection();

        // Create CartDao instance
        CartDao cartDao = new CartDao(connection);

        try {
            // Delete the item from the cart
            cartDao.deleteCartItem(username, productName);
            // Redirect back to the cart page after successful deletion
            response.sendRedirect("Cart.jsp");
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
    }
}
