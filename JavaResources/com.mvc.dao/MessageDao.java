package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.Message;
import com.mvc.util.DBConnection;

public class MessageDao {
    private Connection con;

    public MessageDao() {
        con = DBConnection.createConnection();
    }

    public List<Message> getLatestMessages() {
        List<Message> messages = new ArrayList<>();
        try {
            String query = "SELECT username, messagetitle, messagedescription FROM contact"; // Assuming contact_id is the primary key for the table
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String messageTitle = rs.getString("messagetitle");
                String messageDescription = rs.getString("messagedescription");
                Message message = new Message(username, messageTitle, messageDescription);
                messages.add(message);
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }
}
