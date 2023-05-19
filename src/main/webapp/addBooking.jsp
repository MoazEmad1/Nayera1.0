<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
	<%

		Connection con=null;
		ResultSet rs=null;
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");
		int id=Integer.parseInt(""+session.getAttribute("id"));
		Statement s = con.createStatement();
		
		con.close();
		int count = Integer.parseInt("" + session.getAttribute("count"));
		int i = 0;
		int sum = 0;
		while (i != count) {
			
			int rno = Integer.parseInt("" + session.getAttribute("rno" + (i + 1)));
			String start=""+request.getAttribute("start");
			String end=""+request.getAttribute("end");

			s.executeUpdate("INSERT INTO bookings (CustomerID,RoomNumber,CheckInDate,CheckOutDate) VALUES(" + id + "," + rno + ","+ start +","+ end +")");

			i++;

		}
			} catch (SQLException e) {
		e.printStackTrace();
			} catch (ClassNotFoundException e) {
		e.printStackTrace();
			} catch (Exception e) {
			}
	%>
</body>
</html>