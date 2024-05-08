package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.CartBean;
import com.mvc.dao.CartDao;
import com.mvc.util.DBConnection;

public class CartUtility {
    
    public static int calculateTotal(String userName) {
        Connection connection = null;
        int total = 0;
        try {
            connection = DBConnection.createConnection();
            CartDao cartDao = new CartDao(connection);
            total = cartDao.calculateTotal(userName);
        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                // Handle connection close exception
                e.printStackTrace();
            }
        }
        return total;
    }
    
    public static void clearCart(String userName) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        try {
            connection = DBConnection.createConnection();
            String query = "DELETE FROM userCart WHERE username = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                // Handle connection close exception
                e.printStackTrace();
            }
        }
    }
    
    public static List<CartBean> getCartItems(String userName) {
        List<CartBean> cartItems = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {
            connection = DBConnection.createConnection();
            String query = "SELECT * FROM userCart WHERE username = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                CartBean cartItem = new CartBean();
                cartItem.setProductName(resultSet.getString("product_name"));
                cartItem.setPrice(resultSet.getInt("price"));
                // Set other properties of the CartBean if needed
                cartItems.add(cartItem);
            }
        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                // Handle connection close exception
                e.printStackTrace();
            }
        }
        
        return cartItems;
    }
}
