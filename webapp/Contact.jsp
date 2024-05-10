<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: calc(100% - 20px); /* Adjust for input padding */
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            background-color: #333;
            color: #fff;
        }

        button[type="submit"]:hover {
            background-color: #555;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #333;
        }
    </style>
</head>
<body>
    <h2>Contact Form</h2>
    <% 
    String success = request.getParameter("success");
    if (success != null && success.equals("true")) { 
    %>
        <p style="color: red; text-align: center;">Message has been sent successfully!</p>
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
    <a href="Cart.jsp">Cart</a>
    <a href="Home.jsp">Home</a>
    <a href="Product.jsp">Product</a>
</body>
</html>
