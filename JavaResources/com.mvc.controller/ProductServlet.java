package com.mvc.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mvc.bean.ProductBean;
import com.mvc.dao.ProductDao;
import com.mvc.util.DBConnection;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDao productDao = new ProductDao(DBConnection.createConnection());
        List<ProductBean> productList = productDao.getAllProducts();

        for (ProductBean product : productList) {
            byte[] imageData = product.getImageData();
            if (imageData != null) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                System.out.println("Base64 image for product ID " + product.getProductId() + ": " + base64Image);
                product.setBase64Image(base64Image);
            }
        }
        
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("checkproduct.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
