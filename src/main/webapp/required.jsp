<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
<form action="showrooms" method="post">
	<center>
	<h1> PLEASE ENTER HERE START AND END DATE OF YOUR TRIP <br><br>
		start date <input type = "date" placeholder="yyyy-mm-dd" name="startdate" >
		end date <input type = "date" placeholder="yyyy-mm-dd" name="enddate" ><br>
		no. of rooms needed
		 <input type="radio" name="count" value="1">1
		 <input type="radio" name="count" value="2">2
		 <input type="radio" name="count" value="3">3
		
		
		<input type="submit" name="search" value="SEARCH"></h1>
	</center>
</form>
</body>
</html>