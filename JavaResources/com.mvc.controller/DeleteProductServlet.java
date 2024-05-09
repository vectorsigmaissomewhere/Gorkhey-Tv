package com.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mvc.dao.ProductDaoData;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the product ID parameter from the request
        int productId = Integer.parseInt(request.getParameter("productId"));

        // Create an instance of ProductDaoData
        ProductDaoData productDao = new ProductDaoData();

        // Delete the product
        boolean deleted = productDao.deleteProduct(productId);

        // Redirect based on deletion result
        if (deleted) {
            response.sendRedirect(request.getContextPath() + "/deleteProductSuccess.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/deleteProductFailed.jsp");
        }
    }
}
