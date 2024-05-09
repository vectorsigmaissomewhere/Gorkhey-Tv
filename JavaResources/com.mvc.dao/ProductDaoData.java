package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.mvc.bean.ProductDataBean;
import com.mvc.util.DBConnection;

public class ProductDaoData {
    private Connection con;

    public ProductDaoData() {
        con = DBConnection.createConnection();
    }

    public List<ProductDataBean> getAllProducts() {
        List<ProductDataBean> products = new ArrayList<>();
        try {
            String query = "SELECT * FROM product";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ProductDataBean product = new ProductDataBean();
                product.setProductId(rs.getInt("productid"));
                product.setProductName(rs.getString("name"));
                product.setProductDescription(rs.getString("description"));
                product.setProductPrice(rs.getString("price"));
                product.setProductStock(rs.getInt("stock"));
                product.setProductActive(rs.getString("active"));
                // You can set additional properties here as needed
                products.add(product);
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    
    public ProductDataBean getProductById(int productId) {
        ProductDataBean product = null;
        try {
            String query = "SELECT * FROM product WHERE productid=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, productId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                product = new ProductDataBean();
                product.setProductId(rs.getInt("productid"));
                product.setProductName(rs.getString("name"));
                product.setProductDescription(rs.getString("description"));
                product.setProductPrice(rs.getString("price"));
                product.setProductStock(rs.getInt("stock"));
                product.setProductActive(rs.getString("active"));
                // You can set additional properties here as needed
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }


}
