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
  
  .input-field {
    display: block;
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
  }
  
  .btn {
    display: block;
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    font-size: 18px;
    color: #ffffff;
    background-color: #999999;
    border: none;
    border-radius: 5px;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
  }
  
  .btn:hover {
    background-color: #777777;
  }
  
  .forgot-password {
    text-align: right;
    font-size: 14px;
    color: #333333;
  }
  
  .forgot-password a {
    text-decoration: none;
    color: #337ab7;
  }
  
  .forgot-password a:hover {
    color: #23527c;
  }
</style>
</head>
<body>
  <div class="container">
  <br>
  <br>
    <form action="userServlet" method="post">
      E-mail: <input class="input-field" type="text" name="email"><br>
      Password: <input class="input-field" type="password" name="pass"><br><br>
      <input class="btn" type="submit" name="start" value="Login"><br><br>
      <div class="forgot-password">
        <a href="ForgetPassword.jsp">Forgot Password?</a>
      </div>
    </form>
  </div>
</body>
</html>
