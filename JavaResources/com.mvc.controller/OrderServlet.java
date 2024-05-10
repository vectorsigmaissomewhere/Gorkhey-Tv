package com.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.util.DBConnection;
import com.mvc.dao.CartUtility;
import com.mvc.dao.OrderDao;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("userName");
        
        if(userName != null && !userName.isEmpty()) {
            String transaction_id = request.getParameter("transaction_id");
            String payment_method = request.getParameter("payment_method");
            
            int total = CartUtility.calculateTotal(userName); // You need to define CartUtility class
            
            Date orderDate = new Date(); // Get current date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String strOrderDate = sdf.format(orderDate);
            
            // Assuming the address is stored in session as "city"
            String address = (String) session.getAttribute("city");
            
            try {
                Connection connection = DBConnection.createConnection();
                OrderDao orderDao = new OrderDao(connection);
                orderDao.insertOrder(userName, null, total, payment_method, transaction_id, address, strOrderDate);
                
                // Redirect to a success page
                response.sendRedirect("orderSuccess.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                // Redirect to an error page
                response.sendRedirect("error.jsp");
            }
        } else {
            // Redirect to login page
            String message = "Login to place an order.";
            response.sendRedirect("Login.jsp?message=" + java.net.URLEncoder.encode(message, "UTF-8"));
        }
    }
}

