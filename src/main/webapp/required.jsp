<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        
        form {
            margin-top: 100px;
            text-align: center;
        }
        
        h1 {
            color: black;
        }
        
        input[type="date"], input[type="submit"], input[type="radio"] {
            margin: 10px;
            padding: 5px;
            font-size: 16px;
        }
        
        input[type="submit"] {
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
        }
        
        label, input[type="radio"] {
            color: black;
        }
    </style>
</head>
<body>
    <form action="showrooms" method="post">
        <h1>PLEASE ENTER HERE START AND END DATE OF YOUR TRIP</h1>
        
        <div>
            <label for="startdate">Start Date:</label>
            <input type="date" id="startdate" name="startdate">
        </div>
        <div>
            <label for="enddate">End Date:</label>
            <input type="date" id="enddate" name="enddate">
        </div>
        <div>
            <label>No. of Rooms Needed:</label>
            <input type="radio" name="count" value="1" id="room1">
            <label for="room1">1</label>
            <input type="radio" name="count" value="2" id="room2">
            <label for="room2">2</label>
            <input type="radio" name="count" value="3" id="room3">
            <label for="room3">3</label>
        </div>
        <div>
            <input type="submit" name="search" value="SEARCH">
        </div>
    </form>
</body>
</html>
