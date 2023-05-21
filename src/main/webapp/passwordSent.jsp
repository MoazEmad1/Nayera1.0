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
  
  h3 {
    text-align: center;
    margin-top: 100px;
    font-size: 24px;
    color: #333333;
  }
  
  .container {
    width: 300px;
    margin: 0 auto;
    text-align: center;
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
  <div class="container">
    <form action="login.jsp">
      <h3>Your password has been sent to your email</h3>
      <input type="submit" value="Login Page">
    </form>
  </div>
</body>
</html>
