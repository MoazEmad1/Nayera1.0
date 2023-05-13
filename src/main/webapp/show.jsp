<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
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
		<% String name = "";%>
		<h1>Select the suitable room</h1>
		<select name="name">
			<% 
       int i = 0;
       int count = Integer.parseInt(request.getParameter("count"));
       while (i < count) {
           name = "combo" + i;
           String comboBoxOptions = "";
           PrintWriter pw = response.getWriter();
           try {
               Connection con ;
               Class.forName("com.mysql.cj.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");
               Statement s = con.createStatement();
               ResultSet rs = s.executeQuery("SELECT * FROM rooms WHERE state='available'");
             
               while (rs.next()) {
            	    comboBoxOptions += "<option value='" + rs.getInt(1) + "'>" + rs.getString(2) + " Type: " + rs.getString(3) + " Price: " + rs.getString(4) + "</option>";
               }
               con.close();
           } catch (ClassNotFoundException e) {
               System.out.println("class not found");
           } catch (SQLException e) {
               e.printStackTrace();
           }
           %>
			<%= name %>
		</select>
		<% i++; } %>
		<input type="submit" name="checkout" value="Proceed to checkout">
	</form>
</body>
</html>
