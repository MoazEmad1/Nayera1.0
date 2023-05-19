<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    	<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
	<%
	System.out.println("hello from confirmcancellation");
	String outs=""+request.getParameter("cancelCombo");
	int colonIndex = outs.indexOf(":");
    String extractedString = outs.substring(colonIndex + 1).trim();
	
    int j=0;
    String Srno="";
	while(extractedString.charAt(j)>=48&&extractedString.charAt(j)<=57){
		Srno+=extractedString.charAt(j);
		j++;
	}
	int rno=Integer.parseInt(Srno);
	Connection con;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");
		int id=Integer.parseInt(""+session.getAttribute("id"));
		Statement s = con.createStatement();
		
		s.executeUpdate("DELETE FROM bookings WHERE CustomerID = '"+id+"' AND RoomNumber = '"+rno+"'");

		con.close();

			} catch (SQLException e) {
		e.printStackTrace();
			} catch (ClassNotFoundException e) {
		e.printStackTrace();
			} catch (Exception e) {
			}
	%>
	<h1>Cancellation confirmed</h1>
</body>
</html>