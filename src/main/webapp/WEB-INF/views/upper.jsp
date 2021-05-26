<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<%@page import="java.util.*" %>
<%@page import="virtusa.notifier.model.UserNotes" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<style>
body {
  font-family: "Lato", sans-serif;
  margin:0px;
  padding:0px;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav p {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav p:hover {
  color: #f1f1f1;
  cursor:pointer;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-left .5s;
  margin:0px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
#main ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

#main li {
  float: left;
}

#main li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.active {
  background-color: #4CAF50;
}
p{
	  color: white;
	  font-size:20px;
	  padding-left:10px;
}
h3{
	  color: white;
	  font-size:20px;
	  padding-left:10px;
	  
}
#notes{
	transition: margin-left .5s;
}

.inner-box ul li{
	margin:.1rem .5rem 0 3rem;
}

.inner-box ul li a{
	text-decoration: none;
	color:#0009;
}

.inner-box ul li a:hover{
	text-shadow: 1px 1px white;
}

//wrapper

 
.card {
 	background-color: white;
    width: 100%;
    max-width: 500px;
    height: 490px;
    font-family: Arial, Helvetica, sans-serif;
    margin: 5% auto;
    padding: 20px;
    position: relative; 
}
 
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

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <h3 style="margin-left:1.5rem;">Hi,</h3>
  <a href="/note-books">NoteBooks</a>
  <p id="add">Add Notes</p>
  <a href="/edit-users">Edit User</a>
</div>

<div id="main">
  <ul>
  	  <li style="font-size:25px;cursor:pointer;color:white;padding:5px" onclick="openNav()">&#9776;</li>
	  <li style="font-size:20px"><a>Notifier</a></li>
	  <li style="float:right"><a class="active" href="/logout">Logout</a></li>
	  <li style="float:right;font-size:35px;color:white;margin-right:1.5rem;">
	  <div>
	  	<div style="height: 14px;width: 14px;border-radius: 8px;background-color: red;position: absolute;margin-left: 1.4rem;margin-top: .4rem;">
	  		<p style="font-size: 8px;padding: 0px;margin: 4px;">0</p>
	  	</div>
	  	<span style="cursor: pointer;" class="open-email">&#9993;</span>
	  </div>
	  </li>
  </ul>
</div>
<div>
	<div class="box" id="notes" style="width:900px;height:600px;margin:1rem 0rem 0rem 2rem;padding:1rem">
		<div style="display:flex;">
			<div>
				<h1>All Notes</h1>
			</div>
			<div style="margin: 2rem;padding-left: 1rem;">
				<button onclick="add()">&#10010; Add Note</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>