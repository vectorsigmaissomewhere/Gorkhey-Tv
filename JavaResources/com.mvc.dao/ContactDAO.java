package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mvc.bean.Message;
import com.mvc.util.DBConnection;

public class ContactDAO {
    public void saveMessage(Message message) {
        String query = "INSERT INTO contact (username, messagetitle, messagedescription) VALUES (?, ?, ?)";
        
        try (Connection connection = DBConnection.createConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, message.getUsername());
            preparedStatement.setString(2, message.getMessageTitle());
            preparedStatement.setString(3, message.getMessageDescription());
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
    }
}
