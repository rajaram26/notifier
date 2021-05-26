<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page import="java.util.*" %>
<%@page import="virtusa.notifier.model.RegisteredUser" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
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
    height: 464px;
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
			<form method="POST" action="/update-user">
				<div style="text-align:center">
					<h1>Edit Profile</h1>
				</div>
				<%
				 RegisteredUser data = (RegisteredUser) request.getAttribute("data");
				%>
					<input type="hidden" value="${id}" name="id" style="width:60%;height:2rem" autocomplete="off"/>
					<input type="hidden" value="<%=data.getEmail() %>" name="email" style="width:60%;height:2rem" autocomplete="off"/>
				<div>
					<label>User Name:</label>
					<input type="text" value="<%=data.getUsername() %>" name="username" style="width:60%;height:2rem" autocomplete="off"/>
				</div>
				<div>
					<label>Mobile:</label>
					<input type="text" value="<%=data.getMobile() %>" name="mobile" style="width:60%;height:2rem" autocomplete="off"/>
				</div>
				<div>
					<label>Password:</label>
					<input type="text" value="<%=data.getPassword()%>" name="password" style="width:60%;height:2rem" autocomplete="off"/>
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