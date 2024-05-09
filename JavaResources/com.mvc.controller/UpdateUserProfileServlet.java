package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mvc.bean.User;
import com.mvc.dao.UserDAO;
import com.mvc.bean.PasswordEncryptionWithAes;

@WebServlet("/UpdateUserProfileServlet")
public class UpdateUserProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String newPassword = request.getParameter("newPassword");
        String mobileNumberStr = request.getParameter("mobileNumber");
        long mobileNumber = mobileNumberStr != null && !mobileNumberStr.isEmpty() ? Long.parseLong(mobileNumberStr) : 0;
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");

        // Encrypt the new password
        String encryptedPassword = null;
        if (newPassword != null && !newPassword.isEmpty()) {
            try {
                encryptedPassword = PasswordEncryptionWithAes.encryptPassword(newPassword, "U3CdwubLD5yQbUOG92ZnHw==");
            } catch (Exception e) {
                e.printStackTrace();
                // Handle encryption error
                response.sendRedirect("error.jsp");
                return;
            }
        }

        // Update user details in the database
        UserDAO userDAO = new UserDAO();
        try {
            User user = userDAO.getUserByUsername(username);
            if (user != null) {
                // Update user object with new details
                user.setFullName(fullName);
                if (encryptedPassword != null) {
                    user.setPassword(encryptedPassword);
                }
                user.setMobileNumber(mobileNumber);
                user.setCity(city);
                user.setState(state);
                user.setCountry(country);

                // Update user in the database
                userDAO.updateUser(user);

                // Redirect to a success page
                response.sendRedirect("UserProfile.jsp");
            } else {
                // User not found
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database error
            response.sendRedirect("error.jsp");
        }
    }
}
