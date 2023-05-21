<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@page import="java.time.LocalDate"%>
    <%@page import="Project.DataBaseConnect"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
<%
	int count=Integer.parseInt(""+session.getAttribute("count"));
	int id=(int)session.getAttribute("id");
	LocalDate startdate=(LocalDate)session.getAttribute("startdate");
	LocalDate enddate=(LocalDate)session.getAttribute("enddate");
	int i=0;
	int sum=0;
	DataBaseConnect db=new DataBaseConnect();
	while(i!=count){
		int rno=Integer.parseInt(""+session.getAttribute("rno"+(i+1)));
		db.addBooking(id, rno, startdate, enddate);
		i++;
	}
	%>
	<h1>Order has been confirmed</h1><br/>
	<%
	%>
<form action="logout.jsp">

<input type="submit" name ="logout" value="logout">
</form>
</body>
</html>