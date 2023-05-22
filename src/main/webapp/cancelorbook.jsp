<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
<h1> CHOOSE YOUR SERVICE </h1>
<form action="userServlet" method ="get">
<% int id=(int)request.getAttribute("id");
        session.setAttribute("id", id);%> 
<input type="submit" name="cancel" value ="cancellation">
<input type="submit" name="reserve" value ="reservation">
</form>

</body>
</html>