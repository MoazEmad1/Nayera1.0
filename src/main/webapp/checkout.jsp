<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.time.LocalDate"%>
    <%@page import="Project.DataBaseConnect"%>
    <%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<%
	int count = Integer.parseInt(""+session.getAttribute("count"));
	int id = (int)session.getAttribute("id");
	int i=0;
	int sum=0;
	int j=0;
	int duration = 0;
	String startdate1=""+session.getAttribute("startdate");	
	String enddate1=""+session.getAttribute("enddate");
	System.out.println(startdate1);
	System.out.println(enddate1);
	System.out.println(id);

	Connection con;
	
	int arr[]=new int[count];
	while(i!=count){
		String outs=null;
		if(count==1){
			outs=request.getParameter("combo1");
		}
		else{
			outs=request.getParameter("combo"+(i+1));
		}
		int colonIndex = outs.indexOf(":");
        String extractedString = outs.substring(colonIndex + 1).trim();
		
        j=0;
        String Srno="";
		while(extractedString.charAt(j)>=48&&extractedString.charAt(j)<=57){
			Srno+=extractedString.charAt(j);
			j++;
		}
		int rno=Integer.parseInt(Srno);
		arr[i]=rno;
		if(i==0){

			try {
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1", "root", "");
		        Statement s = con.createStatement();
		        ResultSet rs = s.executeQuery("SELECT DATEDIFF('" + enddate1 + "', '" + startdate1 + "') AS Duration");
		        
		        if (rs.next()) {
		        	 duration =rs.getInt("Duration");
		        	 
		        } else {
		            duration=0;
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } catch (ClassNotFoundException e) {
		        e.printStackTrace();
		    }
		}
		System.out.println(duration);
        extractedString = extractedString.substring(colonIndex + 1).trim();
        j=0;
        String type="";
        while((extractedString.charAt(j)>=65&&extractedString.charAt(j)<=90)||(extractedString.charAt(j)>=97&&extractedString.charAt(j)<=122)){
			type+=extractedString.charAt(j);
			j++;
		}
        extractedString = extractedString.substring(colonIndex + 1).trim();
        extractedString = extractedString.substring(1);
        String partString[]=extractedString.split(":");
        extractedString=partString[1].trim();
		double price=Double.parseDouble(extractedString);
		DataBaseConnect db=new DataBaseConnect();
		
		price = (price + (price * (26.0 / 100.0))) * duration ;
		sum+=price;
		%>
		<h1>Room number : <%=rno %> Room Type : <%=type %> Price : <%=price %></h1><br/>
		<%
		i++;
	}
	j=0;
	int flag=0;
	while(j!=(count-1)){
		if(arr[j]==arr[j+1]){
			flag=1;
		}
		j++;
		
	}
	if(flag==1){
		%>
			session.setAttribute("check",1);
		 <jsp:forward page="show.jsp"/>
		<%		
		}
	else if(arr[0]==arr[count-1]&&count!=1){

		%>
		session.setAttribute("check",1);
		
		 <jsp:forward page="show.jsp"/>
		<%
	}
	%>
	<h1>Summation = <%=sum %></h1>
<form action = "userServlet" method="get">
<input type ="submit" name ="confirm" value ="Confirm">
</center>
</form>
</body>
</html>