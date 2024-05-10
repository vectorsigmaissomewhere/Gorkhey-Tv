package com.mvc.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mvc.bean.ProductBean;
import com.mvc.dao.ProductDao;

@WebServlet("/allProducts")
public class AllProductsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao productDao = new ProductDao();
        List<ProductBean> products = productDao.getAllProducts();
        for (ProductBean product : products) {
            // Convert byte[] image data to Base64 for display in HTML
            String base64Image = java.util.Base64.getEncoder().encodeToString(product.getImageData());
            product.setBase64Image(base64Image);
        }
        request.setAttribute("products", products);
        request.getRequestDispatcher("allProductAndEditProduct.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
