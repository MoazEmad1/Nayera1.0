<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Reservation Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        
        form {
            margin-top: 100px;
            text-align: center;
        }
        
        h1 {
            color: #333333;
        }
        
        input[type="date"], input[type="submit"], input[type="radio"] {
            margin: 10px;
            padding: 5px;
            font-size: 16px;
        }
        
        input[type="submit"] {
            background-color: #337ab7;
            color: #ffffff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        
        label, input[type="radio"] {
            color: #333333;
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
