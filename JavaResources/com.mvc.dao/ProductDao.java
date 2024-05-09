package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.Product;
import com.mvc.bean.ProductBean;
import com.mvc.util.DBConnection;

public class ProductDao {
    private Connection con;

    public ProductDao(Connection con) {
        super();
        this.con = con;
    }
    
    public ProductDao() {
        
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
    
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO product (name, description, price, stock, active, filename, data) VALUES (?, ?, ?, ?, ?, ?, ?)";

    public void addProduct(Product product) {
        try (Connection connection = DBConnection.createConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {

            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setInt(3, product.getPrice());
            preparedStatement.setInt(4, product.getStock());
            preparedStatement.setString(5, product.getActive());
            preparedStatement.setString(6, product.getFilename());
            preparedStatement.setBlob(7, product.getData());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}



