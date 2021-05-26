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
    height: 550px;
    font-family: Arial, Helvetica, sans-serif;
    margin: 5% auto;
    padding: 20px;
    position: relative; 
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
					<h1>Edit Notes</h1>
				</div>
				<%
					UserNotes data = (UserNotes) request.getAttribute("list");
				%>
					<input type="hidden" value="${id}" name="id" style="width:60%;height:2rem" autocomplete="off"/>
					<input type="hidden" value="<%=data.getEmail() %>" name="email" style="width:60%;height:2rem" autocomplete="off"/>
				<div>
					<label>Notes name:</label>
					<input type="text" value="<%=data.getNote_name() %>" name="notes-name" style="width:60%;height:2rem" autocomplete="off"/>
				</div>
				<div>
					<label>Start date:</label>
					<input type="date" value="<%=data.getStart_date()%>" name="start-date" style="width:60%;height:2rem" autocomplete="off"/>
				</div>
				<div>
					<label>End date:</label>
					<input type="date" value="<%=data.getEnd_date() %>" name="end-date" style="width:60%;height:2rem" autocomplete="off"/>
				</div>
				<div>
					<label>Remainder date:</label>
					<input type="date" value="<%=data.getRem_date() %>" name="remainder-date" style="width:60%;height:2rem" autocomplete="off"/>
				</div>
				<div>
					<label>Description:</label>
					<input type="text" value="<%=data.getDescription() %>" name="description" style="width:60%;height:2rem" autocomplete="off"/>
				</div>
				<div style="text-align:center">
					<button class="btn">Update</button>
				</div>
				<div>
					<a href="/dashboard" style="text-decoration: none;"> < Back</a>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>