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
<script>
    function updateOptions() {
      // Get the selected value of the first combobox
      var selectedValue = document.getElementById("combo1").value;

      // Disable or remove the selected option from the other comboboxes
      var comboboxes = document.getElementsByClassName("customCombobox");
      for (var i = 0; i < comboboxes.length; i++) {
        var combobox = comboboxes[i];
        var options = combobox.options;

        for (var j = 0; j < options.length; j++) {
          var option = options[j];

          if (option.value === selectedValue) {
            // Disable the option
            option.disabled = true;
          } else {
            // Enable the option (in case it was disabled previously)
            option.disabled = false;
          }
        }
      }
    }
  </script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 
  <%
  int count;
  if(request.getParameter("count")!=null){
  	count = Integer.parseInt(request.getParameter("count"));
  	session.setAttribute("count", count);
  }else{
	  %>
	  <h1>YOU CANNOT CHOOSE THE SAME ROOM MORE THAN ONE TIME</h1>
	  <%
	  	count = Integer.parseInt(""+session.getAttribute("count"));

  }
  %>
	<form action="checkout.jsp">

		<%
		String name = "";
		%>
		<h1>Select the suitable room</h1>
		<%
		int i = 1;
		String start;
		String end;
		LocalDate startdate1=null;
		LocalDate enddate1=null;
		if(request.getAttribute("start")!=null){
			start = "" + request.getAttribute("start");
			end = "" + request.getAttribute("end");
			System.out.println(start);
			startdate1 = LocalDate.parse(start);
			enddate1 = LocalDate.parse(end);
			session.setAttribute("startdate", startdate1);
			session.setAttribute("enddate", enddate1);
		}else{
			startdate1=(LocalDate)session.getAttribute("startdate");
			enddate1=(LocalDate)session.getAttribute("enddate");

		}
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
				ResultSet rs = s.executeQuery("SELECT * FROM Rooms r WHERE r.RoomNumber NOT IN "
				+ "(SELECT b.RoomNumber FROM Bookings b WHERE (b.CheckInDate <= '" + startdate1 + "' AND b.CheckOutDate >= '" + enddate1
				+ "') OR (b.CheckInDate < '" + startdate1 + "' AND b.CheckOutDate >= '" + enddate1 
				+ "') OR (b.CheckInDate >= '"+ startdate1 + "' AND b.CheckOutDate < '"+enddate1+"'))");
				int j=1;
				while (rs.next()) {
					
					session.setAttribute("rno"+j, rs.getInt(1));
					session.setAttribute("type"+j, rs.getString(2));
					session.setAttribute("price"+j, rs.getString(3)); 
					
		%>


			<option>Room Number :<%=rs.getInt(1)%> Room Type :<%=rs.getString(2)%> Price :<%=rs.getInt(3)%></option>
			<%
			j++;
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
