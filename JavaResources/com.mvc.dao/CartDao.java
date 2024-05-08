package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.CartBean;

public class CartDao {
    private Connection connection;

    public CartDao(Connection connection) {
        this.connection = connection;
    }

    public void addToCart(CartBean cartItem) throws SQLException {
            // If the item does not exist, insert a new row
            String query = "INSERT INTO cart (username, product_name, quantity, price) VALUES (?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, cartItem.getUsername());
                preparedStatement.setString(2, cartItem.getProductName());
                preparedStatement.setInt(3, cartItem.getQuantity());
                preparedStatement.setInt(4, cartItem.getPrice());
                preparedStatement.executeUpdate();
            }
        }
    public void deleteCartItem(String username, String productName) throws SQLException {
        String query = "DELETE FROM cart WHERE username = ? AND product_name = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, productName);
            preparedStatement.executeUpdate();
        }
    }
    public List<CartBean> getCartItems(String username) throws SQLException {
        List<CartBean> cartItems = new ArrayList<>();
        String query = "SELECT * FROM cart WHERE username = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    CartBean cartItem = new CartBean();
                    cartItem.setUsername(resultSet.getString("username"));
                    cartItem.setProductName(resultSet.getString("product_name"));
                    cartItem.setQuantity(resultSet.getInt("quantity"));
                    cartItem.setPrice(resultSet.getInt("price"));
                    cartItems.add(cartItem);
                }
            }
        }
        return cartItems;
    }
    public int calculateTotal(String username) throws SQLException {
        int total = 0;
        String query = "SELECT SUM(price) AS total FROM cart WHERE username = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    total = resultSet.getInt("total");
                }
            }
        }
        return total;
    }

}

