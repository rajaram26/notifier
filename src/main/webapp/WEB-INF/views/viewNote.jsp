<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page import="java.util.*" %>
<%@page import="virtusa.notifier.model.UserNotes" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update notes</title>
<style>
input{
	width:200px;
	height:25px;
}
.card div{
	padding:15px;
	padding-left:20px;
}
label{
	font-size:18px;
	font-family: 'Nunito', sans-serif;
}
.btn{
	width:100px;
	height:40px;
	background-color:black;
	color:white;
	font-size:20px;
	border-radius:.5rem;
	cursor:pointer;
}
.btn:hover{
	font-size:22px;
}
.wrapper-1{
    width: 100%;
    position: fixed;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    top: 0px;
    left: 0px;
    display: block;
}
	
.card{
    background-color: white;
    width: 100%;
    max-width: 500px;
    height: 460px;
    font-family: Arial, Helvetica, sans-serif;
    margin: 5% auto;
    padding: 20px;
    position: relative; 
}
card div label{
	margin-left: 1.5rem;
}
</style>
</head>
<body>
<jsp:include page="upper.jsp"></jsp:include>
<div>
	<div class="wrapper-1">
		<div class="card">
			<form method="POST" action="/update-notes">
				<div style="text-align:center">
					<h1>Notes Details</h1>
				</div>
				<div>
					<label><b>Notes name:</b> </label> ${list.note_name}
				</div>
				<div>
					<label><b>Start date:</b></label> ${list.start_date}
				</div>
				<div>
					<label><b>End date:</b></label> ${list.end_date}
				</div>
				<div>
					<label><b>Remainder date:</b></label> ${list.rem_date}
				</div>
				<div>
					<label><b>Description:</b></label> ${list.description}
				</div>
				<div style="margin-top:2rem">
					<a href="/dashboard" style="text-decoration: none;"> < Back</a>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>