<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="showrooms" method="get">
		<%
		String name = "";
		%>
		<h1>Select the suitable room</h1>
		<%
		int i = 1;
		int count = Integer.parseInt(request.getParameter("count"));
		String start = "" + request.getAttribute("start");
		String end = "" + request.getAttribute("end");
		LocalDate startdate1 = LocalDate.parse(start);
		LocalDate enddate1 = LocalDate.parse(end);
		
		while (i <= count) {
			name = "combo" + i;
			%>
		<select name=<%=name%>>
			<%
			String comboBoxOptions = "";
			PrintWriter pw = response.getWriter();
			try {
				Connection con;
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");
				Statement s = con.createStatement();
				ResultSet rs = s.executeQuery("SELECT * FROM Rooms WHERE RoomNumber NOT IN "
				+ "(SELECT RoomNumber FROM Bookings WHERE " + "(CheckInDate BETWEEN " + startdate1 + " AND " + enddate1
				+ ") OR (CheckOutDate BETWEEN " + startdate1 + " AND " + enddate1 + "))");

				while (rs.next()) {
		%>


			<option>Room Number :<%=rs.getInt(1)%>>Room Type :<%=rs.getString(2)%>Price :<%=rs.getInt(3)%></option>
			<%
			}
			con.close();
			} catch (ClassNotFoundException e) {
			System.out.println("class not found");
			} catch (SQLException e) {
			e.printStackTrace();
			}
		i++;
		%>
		</select>
		<%
		}
		%>
		<input type="submit" name="checkout" value="Proceed to checkout">
	</form>
</body>
</html>
