<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<%
	int count=Integer.parseInt(""+session.getAttribute("count"));
	int i=0;
	int sum=0;
	while(i!=count){
		int rno=Integer.parseInt(""+session.getAttribute("rno"+(i+1)));
		String type=""+session.getAttribute("type"+(i+1));
		double price = Double.parseDouble("" + session.getAttribute("price" + (i + 1)));
		price=price+price*(26.0/100.0);
		sum+=price;
		
		%>
		<h1>Room number : <%=rno %> Room Type : <%=type %> Price : <%=price %></h1><br/>
		<%
		i++;
	}
	%>
	<h1>Summation = <%=sum %></h1>
<form action = "userservlet" method="get">
<input type ="submit" name ="confirm" value ="Confirm">
</center>
</form>
</body>
</html>