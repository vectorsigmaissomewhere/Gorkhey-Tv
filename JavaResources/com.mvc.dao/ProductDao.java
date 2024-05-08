package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.mvc.bean.ProductBean;

public class ProductDao {
    private Connection con;

    public ProductDao(Connection con) {
        super();
        this.con = con;
    }

    public List<ProductBean> getAllProducts() {
        List<ProductBean> list = new ArrayList<ProductBean>();
        try {
            String query = "SELECT * FROM product";
            Statement statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setProductId(rs.getInt("productid"));
                product.setProductName(rs.getString("name"));
                product.setProductDescription(rs.getString("description"));
                product.setProductPrice(rs.getString("price"));
                product.setProductStock(rs.getInt("stock"));
                product.setProductActive(rs.getString("active"));
                product.setFileName(rs.getString("filename"));
                product.setImageData(rs.getBytes("data"));
                byte[] imageData = rs.getBytes("data");
                System.out.println("Image data length for product ID " + product.getProductId() + ": " + imageData.length);
                product.setImageData(imageData);
                list.add(product);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}

