<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
	<form action="userServlet" method="post">
		FirsName: <input type="text" name="Fname">
		LastName: <input type="text" name="Lname">
		E-mail:        <input type="text" name="email">
		Phone number:  <input type="number" name="phonenumber">
		no of visits : <input type="number" name="visits">
		username : <input type="text" name="username">
		Password : <input type="password" name="pass">
		
		<input type="submit" name="signupcheck" value="register">
	</form>
</body>
</html>