<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
	while(i!=count){
		String outs=request.getParameter("combo"+(i+1));
		int colonIndex = outs.indexOf(":");
        String extractedString = outs.substring(colonIndex + 1).trim();
		
        int j=0;
        String Srno="";
		while(extractedString.charAt(j)>=48&&extractedString.charAt(j)<=57){
			Srno+=extractedString.charAt(j);
			j++;
		}
		int rno=Integer.parseInt(Srno);
        extractedString = extractedString.substring(colonIndex + 1).trim();
        j=0;
        String type="";
        while((extractedString.charAt(j)>=65&&extractedString.charAt(j)<=90)||(extractedString.charAt(j)>=97&&extractedString.charAt(j)<=122)){
			type+=extractedString.charAt(j);
			j++;
		}
        extractedString = extractedString.substring(colonIndex + 1).trim();
        extractedString = extractedString.substring(1);
		System.out.println(extractedString);
		int price=Integer.parseInt(extractedString);
        System.out.println(price);
		
		price=price+price*(26/100);
		sum+=price;
		%>
		<h1>Room number : <%=rno %> Room Type : <%=type %> Price : <%=price %></h1><br/>
		<%
		i++;
	}
	%>
	<h1>Summation = <%=sum %></h1>
<form action = "userServlet" method="get">
<input type ="submit" name ="confirm" value ="Confirm">
</center>
</form>
</body>
</html>