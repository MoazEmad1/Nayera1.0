<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to our website</title>
<style>
  body {
    background-color: #f2f2f2;
    font-family: Arial, sans-serif;
  }
  
  h1 {
    text-align: center;
    margin-top: 100px;
    font-size: 30px;
    color: #333333;
  }
  
  .container {
    width: 300px;
    margin: 0 auto;
    text-align: center;
  }
  
  .btn {
    display: block;
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    font-size: 18px;
    color: #ffffff;
    background-color: #999999; /* Updated to grey color */
    border: none;
    border-radius: 5px;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
  }
  
  .btn:hover {
    background-color: #777777; /* Updated to darker grey color on hover */
  }
</style>
</head>
<body>
  <div class="container">
    <h1>Welcome to our website</h1><br><br>
    <form action="userServlet" method="get">
      <input class="btn" type="submit" name="login" value="LOGIN">
      <input class="btn" type="submit" name="register" value="REGISTER">
    </form>
  </div>
</body>
</html>
