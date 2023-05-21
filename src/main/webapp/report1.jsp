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



<html>
<head>
<meta charset="ISO-8859-1">
<title>Reserved Room Numbers</title>
<style>
    body {
        background-color: #f2f2f2;
        font-family: Arial, sans-serif;
    }

    h1 {
        text-align: center;
        margin-top: 50px;
        color: #333333;
    }

    p {
        text-align: center;
        font-size: 18px;
    }

    .container {
        width: 300px;
        margin: 0 auto;
        text-align: center;
        margin-top: 20px;
    }

    .btn {
        display: block;
        width: 100%;
        padding: 10px;
        margin-top: 20px;
        font-size: 18px;
        color: #ffffff;
        background-color: #337ab7;
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
    }

    .btn:hover {
        background-color: #23527c;
    }
</style>
</head>
<body>
    <h1>Reserved Room Numbers:</h1>
    <% 
    response.setContentType("text/html");
    PrintWriter pw = response.getWriter();

    Connection con = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");

        String query = "SELECT  DISTINCT  RoomNumber FROM bookings WHERE CheckInDate IS NOT NULL   AND CheckOutDate IS NOT NULL   AND MONTH(CheckInDate) = MONTH(CURRENT_DATE())   AND MONTH(CheckOutDate) = MONTH(CURRENT_DATE());";

        Statement statement = con.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        pw.println("<div class=\"container\">");
        while (resultSet.next()) {
            int roomNumber = resultSet.getInt("RoomNumber");
            pw.println("<p>Room Number: " + roomNumber + "</p>");
        }
        pw.println("<form action=\"admin.jsp\">");
        pw.println("<input class=\"btn\" type=\"submit\" value=\"Back\">");
        pw.println("</form>");
        pw.println("</div>");

        
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        pw.println("<p>Error occurred while retrieving reserved room numbers.</p>");
    } finally {
        try {
            if (con != null)
                con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    pw.println("</body></html>");
    %>
</body>
</html>
