package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mvc.bean.User;
import com.mvc.util.DBConnection;

public class UserDAO {
    public User getUserByUsername(String username) {
        User user = null;
        String query = "SELECT * FROM users WHERE username = ?";
        
        try (Connection connection = DBConnection.createConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    user = new User();
                    user.setFullName(resultSet.getString("fullname"));
                    user.setEmail(resultSet.getString("email"));
                    user.setUsername(resultSet.getString("username"));
                    user.setMobileNumber(resultSet.getLong("mobileNumber"));
                    user.setCity(resultSet.getString("city"));
                    user.setState(resultSet.getString("state"));
                    user.setCountry(resultSet.getString("country"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException
        }
        
        return user;
    }
    public void updateUser(User user) throws SQLException {
        String query = "UPDATE users SET fullname=?, mobileNumber=?, city=?, state=?, country=?, password=? WHERE username=?";
        
        try (Connection connection = DBConnection.createConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setLong(2, user.getMobileNumber());
            preparedStatement.setString(3, user.getCity());
            preparedStatement.setString(4, user.getState());
            preparedStatement.setString(5, user.getCountry());
            preparedStatement.setString(6, user.getPassword());
            preparedStatement.setString(7, user.getUsername());
            
            preparedStatement.executeUpdate();
        }
    }
}
