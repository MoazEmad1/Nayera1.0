<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


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
    <meta charset="UTF-8">
    <title>Number of Bookings for Each Room</title>
    <style>
        .container {
            margin-top: 100px;
            text-align: center;
        }
        
        .btn {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%
    response.setContentType("text/html");
    PrintWriter pw = response.getWriter();

    Connection con = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");

        String query = "SELECT RoomNumber, COUNT(*) AS NumBookings FROM bookings WHERE CheckInDate IS NOT NULL AND CheckOutDate IS NOT NULL AND MONTH(CheckInDate) = MONTH(CURRENT_DATE()) AND MONTH(CheckOutDate) = MONTH(CURRENT_DATE()) GROUP BY RoomNumber";

        Statement statement = con.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        pw.println("<div class=\"container\">");
        pw.println("<h1>Number of Bookings for Each Room</h1>");

        if (!resultSet.next()) {
            pw.println("<p>No bookings found for the current month.</p>");
        } else {
            do {
                int roomNumber = resultSet.getInt("RoomNumber");
                int numBookings = resultSet.getInt("NumBookings");
                pw.println("<p>Room Number: " + roomNumber + ", Number of Bookings: " + numBookings + "</p>");
            } while (resultSet.next());
        }

        pw.println("<form action=\"admin.jsp\">");
        pw.println("<input class=\"btn\" type=\"submit\" value=\"Back\">");
        pw.println("</form>");
        pw.println("</div>");

    } catch (SQLException e) {
        e.printStackTrace();
        pw.println("<p>Error occurred while retrieving the number of bookings.</p>");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        pw.println("<p>Database driver not found.</p>");
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
