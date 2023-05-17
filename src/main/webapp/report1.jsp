<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.io.PrintWriter"%>


<% 
response.setContentType("text/html");
PrintWriter pw = response.getWriter();
out.println("<html><body>");

Connection con = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

    String query = "SELECT RoomNumber FROM bookings WHERE CheckInDate IS NOT NULL  AND CheckOutDate IS NOT NULL AND MONTH(CheckInDate) = MONTH(GETDATE()) AND MONTH(CheckOutDate) = MONTH(GETDATE())";
    		   		  
    Statement statement = con.createStatement();
    ResultSet resultSet = statement.executeQuery(query);

    pw.println("<h1>Reserved Room Numbers:</h1>");

    while (resultSet.next()) {
        int roomNumber = resultSet.getInt("RoomNumber");
        pw.println("<p>Room Number: " + roomNumber + "</p>");
    }

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

out.println("</body></html>");
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="admin.jsp">
<input type = "submit" value ="back">
</form>
</body>
</html>