package com.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mvc.dao.ContactDAO;
import com.mvc.bean.Message;

@WebServlet("/SaveMessageServlet")
public class SaveMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String messageTitle = request.getParameter("messagetitle");
        String messageDescription = request.getParameter("messagedescription");
        
        Message message = new Message(username, messageTitle, messageDescription);
        
        ContactDAO contactDAO = new ContactDAO();
        contactDAO.saveMessage(message);
        
        response.sendRedirect("confirmation.jsp");
    }
}
