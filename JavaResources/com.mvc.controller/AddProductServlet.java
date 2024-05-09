package com.mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.Product;
import com.mvc.dao.ProductDao;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String active = request.getParameter("active");

        Product product = new Product(name, description, price, stock, active);

        ProductDao productDAO = new ProductDao();
        productDAO.addProduct(product);

        response.sendRedirect("addProductConfirmation.jsp");
    }
}

