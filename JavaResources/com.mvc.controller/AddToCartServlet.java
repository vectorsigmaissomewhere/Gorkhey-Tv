package com.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.CartBean;
import com.mvc.dao.CartDao;
import com.mvc.util.DBConnection;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Assuming the username is stored in session as "userName"
        String username = (String) request.getSession().getAttribute("userName");

        CartBean cartItem = new CartBean();
        cartItem.setUsername(username);
        cartItem.setProductName(productName);
        cartItem.setPrice(price);
        cartItem.setQuantity(quantity);

        // Establish database connection. You may have a separate DB connection management.
        Connection connection = DBConnection.createConnection();

        // Create CartDao instance
        CartDao cartDao = new CartDao(connection);

        try {
            cartDao.addToCart(cartItem);
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
