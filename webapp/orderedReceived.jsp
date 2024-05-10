<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }

    h1 {
        text-align: center;
    }

    form {
        text-align: center;
        margin: 0 auto;
        max-width: 300px;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-bottom: 5px;
        text-align: left;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type="submit"],
    input[type="reset"] {
        width: 48%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        background-color: #333;
        color: #fff;
    }

    input[type="submit"]:hover,
    input[type="reset"]:hover {
        background-color: #555;
    }
</style>
<script> 
function validate() { 
    var username = document.form.username.value; 
    var password = document.form.password.value;

    if (username==null || username=="") { 
        alert("Username cannot be blank"); 
        return false; 
    } else if(password==null || password=="") { 
        alert("Password cannot be blank"); 
        return false; 
    } 
}
</script> 
</head>
<body>
    <h1>Login application</h1>
    <br>
    <!-- Display message if available -->
    <div style="text-align:center; color:red;">
        <% String message = request.getParameter("message");
           if (message != null && !message.isEmpty()) {
               out.println(message);
           }
        %>
    </div>
    <form name="form" action="LoginServlet" method="post" onsubmit="return validate()">
        <!-- Do not use table to format fields. As a good practice use CSS -->
        
        <label for="username">Username</label>
        <input type="text" name="username">

        <label for="password">Password</label>
        <input type="password" name="password">
        
        <span style="color:red;"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>
        
        <input type="submit" value="Login">
        <input type="reset" value="Reset">
    </form>
</body>
</html>
