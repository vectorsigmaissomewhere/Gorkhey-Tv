<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<script> 
function validate()
{ 
	 var fullname = document.form.fullname.value;
	 var email = document.form.email.value;
	 var username = document.form.username.value; 
	 var password = document.form.password.value;
	 var conpassword= document.form.conpassword.value;
	 var phonenumber = document.form.phonenumber.value;
	 var city = document.form.city.value;
	 var state = document.form.state.value;
	 var country = document.form.country.value;
	 
	 
	 if (fullname==null || fullname=="")
	 { 
	 alert("Full Name can't be blank"); 
	 return false; 
	 }
	 else if (email==null || email=="")
	 { 
	 alert("Email can't be blank"); 
	 return false; 
	 }
	 else if (username==null || username=="")
	 { 
	 alert("Username can't be blank"); 
	 return false; 
	 }
	 else if(password.length<6)
	 { 
	 alert("Password must be at least 6 characters long."); 
	 return false; 
	 } 
	 else if (password!=conpassword)
	 { 
	 alert("Confirm Password should match with the Password"); 
	 return false; 
	 } 
	 else if(phonenumber)
 } 
</script> 
</head>
<body>
<center><h2>Java Registration application using MVC and MySQL </h2></center>
	<form name="form" action="RegisterServlet" method="post" onsubmit="return validate()">
		<table align="center">
		 <tr>
		 <td>Full Name</td>
		 <td><input type="text" name="fullname" /></td>
		 </tr>
		 <tr>
		 <td>Email</td>
		 <td><input type="text" name="email" /></td>
		 </tr>
		 <tr>
		 <td>Phone Number</td>
		 <td><input type="text" name="phonenumber" /></td>
		 </tr>
		 <tr>
		 <td>Username</td>
		 <td><input type="text" name="username" /></td>
		 </tr>
		 <tr>
		 <td>Password</td>
		 <td><input type="password" name="password" /></td>
		 </tr>
		 <tr>
		 <td>Confirm Password</td>
		 <td><input type="password" name="conpassword" /></td>
		 </tr>
		 <tr>
		 <td>Enter Address</td>
		 <td><input type="text" name="address" /></td>
		 </tr>
		 <tr>
		 <td>Enter City</td>
		 <td><input type="text" name="city" /></td>
		 </tr>
		 <tr>
		 <td>Enter State</td>
		 <td><input type="text" name="state" /></td>
		 </tr>
		 <tr>
		 <td>Enter Country</td>
		 <td><input type="text" name="country" /></td>
		 </tr>
		 <tr>
		 <td><%=(request.getAttribute("errMessage") == null) ? ""
		 : request.getAttribute("errMessage")%></td>
		 </tr>
		 <tr>
		 <td></td>
		 <td><input type="submit" value="Register"></input><input
		 type="reset" value="Reset"></input></td>
		 </tr>
		</table>
	</form>
</body>
</html>
