<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mvc.bean.Message" %>
<%@ page import="com.mvc.dao.MessageDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Message Received</title>
</head>
<body>
    <h1>Messages Received</h1>
    <%
        // Retrieve the list of latest messages from the database
        MessageDao messageDao = new MessageDao();
        List<Message> messages = messageDao.getLatestMessages();

        // Check if there are any messages
        if (messages != null && !messages.isEmpty()) {
            // Iterate over the list of messages and display each message
            for (Message message : messages) {
    %>
                <div>
                    <p><strong>Username:</strong> <%= message.getUsername() %></p>
                    <p><strong>Title:</strong> <%= message.getMessageTitle() %></p>
                    <p><strong>Description:</strong> <%= message.getMessageDescription() %></p>
                </div>
    <%
            }
        } else {
    %>
            <p>No messages received.</p>
    <%
        }
    %>
</body>
</html>
