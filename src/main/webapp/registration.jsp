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
		Name: <input type="text" name="name">
		E-mail: <input type="text" name="email">
		Password: <input type="password" name="pass">
		<input type="submit" name="signupcheck" value="register">
	</form>
</body>
</html>