<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<script> 
function validate() { 
    var fullname = document.form.fullname.value;
    var email = document.form.email.value;
    var username = document.form.username.value; 
    var password = document.form.password.value;
    var conpassword = document.form.conpassword.value;
    var phonenumber = document.form.phonenumber.value;
    var city = document.form.city.value;
    var state = document.form.state.value;
    var country = document.form.country.value;
    var tole = document.form.address.value;
     
    if (fullname==null || fullname=="") { 
        alert("Full Name can't be blank"); 
        return false; 
    } else if (email==null || email=="") { 
        alert("Email can't be blank"); 
        return false; 
    } else if (username==null || username=="") { 
        alert("Username can't be blank"); 
        return false; 
    } else if(password.length<6) { 
        alert("Password must be at least 6 characters long."); 
        return false; 
    } else if (password!=conpassword) { 
        alert("Confirm Password should match with the Password"); 
        return false; 
    } 
} 
</script> 
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }

    h2 {
        text-align: center;
    }

    form {
        text-align: center;
        margin: 0 auto;
        max-width: 400px;
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
        width: calc(100% - 10px); /* Adjust for input padding */
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
</head>
<body>
    <h2>Registration</h2>
    <form name="form" action="RegisterServlet" method="post" onsubmit="return validate()">
        <label for="fullname">Full Name</label>
        <input type="text" name="fullname">

        <label for="email">Email</label>
        <input type="text" name="email">

        <label for="phonenumber">Phone Number</label>
        <input type="text" name="phonenumber">

        <label for="username">Username</label>
        <input type="text" name="username">

        <label for="password">Password</label>
        <input type="password" name="password">

        <label for="conpassword">Confirm Password</label>
        <input type="password" name="conpassword">

        <label for="address">Enter Address</label>
        <input type="text" name="address">

        <label for="city">Enter City</label>
        <input type="text" name="city">

        <label for="state">Enter State</label>
        <input type="text" name="state">

        <label for="country">Enter Country</label>
        <input type="text" name="country">

        <span style="color:red;"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>

        <input type="submit" value="Register">
        <input type="reset" value="Reset">
    </form>
</body>
</html>
