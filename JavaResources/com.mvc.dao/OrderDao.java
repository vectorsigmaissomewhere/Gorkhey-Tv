package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderDao {
    private Connection connection;

    public OrderDao(Connection connection) {
        this.connection = connection;
    }

    public void insertOrder(String username, String productName, int total, String paymentMethod, String transactionId, String address, String orderDate) throws SQLException {
        String query = "INSERT INTO orderDetail (username, productName, total, payment_method, transaction_id, status, address, orderdate) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, productName); // productName can be null in this context
            preparedStatement.setInt(3, total);
            preparedStatement.setString(4, paymentMethod);
            preparedStatement.setString(5, transactionId);
            preparedStatement.setBoolean(6, false); // Assuming status is initially false
            preparedStatement.setString(7, address);
            preparedStatement.setString(8, orderDate);
            preparedStatement.executeUpdate();
        }
    }
}
