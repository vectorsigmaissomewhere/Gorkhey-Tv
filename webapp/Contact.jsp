<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Form</title>
</head>
<body>
    <h2>Contact Form</h2>
    <% 
    String success = request.getParameter("success");
    if (success != null && success.equals("true")) { 
    %>
        <p style="color: red;">Message has been sent successfully!</p>
    <% } %>
    <form action="SaveMessageServlet" method="post">
        <label for="username">Username:</label><br>
        <!-- Display username from session -->
        <input type="text" id="username" name="username" value="<%= session.getAttribute("userName") %>" disabled><br>
        <!-- Hidden input field to store username -->
        <input type="hidden" id="username" name="username" value="<%= session.getAttribute("userName") %>"><br>
        <label for="messagetitle">Message Title:</label><br>
        <input type="text" id="messagetitle" name="messagetitle"><br>
        <label for="messagedescription">Message Description:</label><br>
        <textarea id="messagedescription" name="messagedescription" rows="4" cols="50"></textarea><br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
