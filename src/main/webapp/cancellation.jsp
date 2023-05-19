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
	// TODO show the upcoming bookings only
	int id=(int)session.getAttribute("id");
	Connection con = null;
	try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");

    String query = "SELECT * FROM bookings WHERE CustomerID = '"+id+"'";
    		   		  
    Statement statement = con.createStatement();
    ResultSet resultSet = statement.executeQuery(query);
%>
	<select>
	<% 
    while (resultSet.next()) {
        %>
		<option>Room Number :<%=resultSet.getInt("RoomNumber")%> CheckIn Date :<%=resultSet.getString("CheckInDate")%> CheckOut Date :<%=resultSet.getString("CheckOutDate")%></option>
        <%
    }
	%>
	</select>
	<%

} catch (SQLException | ClassNotFoundException e) {
    e.printStackTrace();
    out.println("<p>Error occurred while retrieving reserved room numbers.</p>");
} finally {
    try {
        if (con != null)
            con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

%>
</body>
</html>