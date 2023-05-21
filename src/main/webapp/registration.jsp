<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Welcome to our website</title>
<style>
  body {
    background-color: #f2f2f2;
    font-family: Arial, sans-serif;
  }
  
  form {
    width: 300px;
    margin: 0 auto;
    text-align: center;
  }
  
  input[type="text"],
  input[type="number"],
  input[type="password"] {
    display: block;
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    font-size: 16px;
  }
  
  input[type="submit"] {
    display: block;
    width: 100%;
    padding: 10px;
    margin-top: 20px;
    font-size: 18px;
    color: #ffffff;
    background-color: #337ab7;
    border: none;
    border-radius: 5px;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
  }
  
  input[type="submit"]:hover {
    background-color: #23527c;
  }
</style>
</head>
<body>
<center><h1> please enter the following data to register</h1></center>

  <form action="userServlet" method="post">
    <input type="text" name="Fname" placeholder="First Name">
    <input type="text" name="Lname" placeholder="Last Name">
    <input type="text" name="email" placeholder="Email">
    <input type="number" name="phonenumber" placeholder="Phone Number">
    <input type="number" name="visits" placeholder="Number of Visits">
    <input type="text" name="username" placeholder="Username">
    <input type="password" name="pass" placeholder="Password">
    
    <input type="submit" name="signupcheck" value="Register">
  </form>
</body>
</html>
