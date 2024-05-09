package com.mvc.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mvc.bean.Product;
import com.mvc.dao.ProductDao;

@WebServlet("/AddProductServlet")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String active = request.getParameter("active");
        
        // Get the image part
        Part filePart = request.getPart("image");
        
        // Get filename
        String fileName = filePart.getSubmittedFileName();
        
        // Get input stream of the image
        InputStream imageData = filePart.getInputStream();
        
        // Create Product object
        Product product = new Product(name, description, price, stock, active, fileName, imageData);
        
        // Create DAO object
        ProductDao productDAO = new ProductDao();
        
        // Add product to database
		productDAO.addProduct(product);
		response.sendRedirect("addProductConfirmation.jsp");
    }
}


