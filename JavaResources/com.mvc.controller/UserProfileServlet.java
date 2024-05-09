package com.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mvc.bean.User;
import com.mvc.dao.UserDAO;

@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("userName");
        if (username != null) {
            UserDAO userDao = new UserDAO();
            User user = userDao.getUserByUsername(username);
            request.setAttribute("user", user);
            request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login.jsp");
        }
    }
}
