<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <%@page import="java.time.LocalDate"%>
    <%@page import="Project.DataBaseConnect"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<%
	int count=Integer.parseInt(""+session.getAttribute("count"));
	int i=0;
	int sum=0;
	int j=0;
	String startdate1=""+session.getAttribute("startdate");	
	String enddate1=""+session.getAttribute("enddate");
	System.out.println(startdate1);
	System.out.println(enddate1);
	DataBaseConnect db=new DataBaseConnect();
	int duration;
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
		if(i==0){
		duration=db.getStayDuration(startdate1,enddate1,(int)session.getAttribute("id"),rno);
		}
		price = (price + (price * (26.0 / 100.0))) * duration;
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