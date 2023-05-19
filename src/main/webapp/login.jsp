<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="userServlet" method="post">
		E-mail: <input type="text" name="email">
		Password: <input type="password" name="pass"><br/>
		<input type="submit" name="start" value="Login"><br/><br/>
		<a href=ForgetPassword.jsp>Forget Password?</a>
	</form>
</body>
</html>