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


/* .card {
	padding:5px;
	margin:auto;
	width:500px;
	height:500px;
	margin-top:50px;
	background-color:#e8eeef;
} 
 */
 
 
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

.wrapper{
    width: 100%;
    position: fixed;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    top: 0px;
    left: 0px;
    display: none;
}

.remainder p{
	font-size:15px;
	color:black;
	margin:0px;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <h3 style="margin-left:1.5rem;">Hi, <%= session.getAttribute("email")%></h3>
  <a href="/note-books">NoteBooks</a>
  <p id="add">Add Notes</p>
  <a href="/edit-user?id=<%= session.getAttribute("user_id")%>" >Edit User</a>
</div>

<div id="main">
  <ul>
  	  <li style="font-size:25px;cursor:pointer;color:white;padding:5px" onclick="openNav()">&#9776;</li>
	  <li style="font-size:20px"><a>Notifier</a></li>
	  <li style="float:right"><a class="active" href="/logout">Logout</a></li>
	  <li style="float:right;font-size:35px;color:white;margin-right:1.5rem;">
	  <div>
	  	<div style="height: 14px;width: 14px;border-radius: 8px;background-color: red;position: absolute;margin-left: 1.4rem;margin-top: .4rem;">
	  		<%
	  			ArrayList<UserNotes> note = (ArrayList<UserNotes>) request.getAttribute("remainder");
	  		%>
	  		<p style="font-size: 8px;padding: 0px;margin: 4px;"><%= note.size() %></p>
	  	</div>
	  	<span style="cursor: pointer;" class="open-email">&#9993;</span>
	  </div>
	  </li>
  </ul>
</div>
<div>
		<div class="email-box" style="float: right;min-height: 200px;width: 280px;background-color: #0002;border-radius: 3px;border: 2px solid #0003;margin-right: 1rem;display:none">
			<div>
			<b class="close-email" style="float: right;cursor: pointer;font-size: 18px;padding-top: .7rem;padding-right: .7rem;">x</b>
			</div>
			<h3 style="color:black">Remainder</h3>
			<c:set var="status" value="${status}" />
			<c:if test="${status!=false}">
				<c:forEach var="rem" items="${remainder}">
					<div style="display:flex;padding: 0px 5px;" class="remainder">
						<p>Name:<b><c:out value="${rem.note_name}"/></b></p>
						<p> Date:<c:out value="${rem.rem_date}" /></p>
					</div>
				</c:forEach>
			</c:if>
		</div>
	<div class="box" id="notes" style="width:900px;height:600px;margin:1rem 0rem 0rem 2rem;padding:1rem">
		<div style="display:flex;">
			<div>
				<h1>All Notes</h1>
			</div>
			<div style="margin: 2rem;padding-left: 1rem;">
				<button onclick="add()">&#10010; Add Note</button>
			</div>
		</div>
		<% 
			String d[]= String.valueOf(java.time.LocalDate.now()).split("-");
			String date = d[d.length-1];
		%>
		<c:forEach var="notes" items="${notes}">
			<div class="inner-box" style="width:700px;height:100px;background-color:#0002;border-radius:3px;border: 2px solid #0003;margin:1rem 0 1.5rem 0">
				<ul style="display:flex;text-decoration:none;padding:1.3rem 1.3rem 0 1.3rem;list-style-type: none;overflow: hidden; margin:.5rem 1rem 0rem 1.5rem">
					<li><c:out value="${notes.note_name}"/></li>
					<li><b>Started on:</b> <c:out value="${notes.start_date}"/></li>
					<li><b>Ended on:</b> <c:out value="${notes.end_date}"/></li>
				</ul>
				<div style="width:600px;">
						<ul style="display:flex;text-decoration:none;list-style-type: none;">
							<li>
								 <form method="POST" action="/edit-notes" >
									<input type="hidden" value="${notes.id}" name="note_id" /> 
									<button>&#9997; Edit</button>
								</form>
							</li>
							<li>
								<form method="POST" action="/delete-note">
									<input type="hidden" value="${notes.id}" name="note_id" />
									<button>&#10006; Delete</button>
								</form>
							</li>
							<li>
								<form method="POST" action="/view-notes" >
									<input type="hidden" value="${notes.id}" name="note_id" /> 
									<button>View</button>
								</form>
							</li>
							<li>
								<%-- <c:set var="curr_date" value="<c:out value="${date}" />" />
								<c:set var="len" value="${fn:length(notes.start_date)}" />
								<c:set var="start_date" value="${}"/>
								<c:if test="${notes.start_date>date}">
									<div style="height: 23px;width: 71px;background: black;color: antiquewhite;border-radius: 3px;">
											<h8 style="margin-top: 0px;padding:10px;">Started</h8>
									</div>
								</c:if> --%>
							</li>
						</ul>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div>
	<div class="wrapper">
		<div class="card" style="background-color: white;width: 100%;max-width: 500px;height: 490px;font-family: Arial, Helvetica, sans-serif;margin: 5% auto;padding: 20px;position: relative; ">
			<div style="padding:0">
				<h1 style="float:right;margin:0rem;cursor:pointer" id="close">&times;</h1>
			</div>
			<form method="POST" action="/notes">
				<div style="text-align:center">
					<h1>Add Notes</h1>
				</div>
				<div>
					<label>Notes name:</label>
					<input type="text" name="notes-name" style="width:60%;height:2rem" autocomplete="off"/>
				</div>
				<div>
					<label>Start date:</label>
					<input type="date" name="start-date" style="width:60%;height:2rem" autocomplete="off"/>
				</div>
				<div>
					<label>End date:</label>
					<input type="date" name="end-date" style="width:60%;height:2rem" autocomplete="off"/>
				</div>
				<div>
					<label>Remainder date:</label>
					<input type="date" name="remainder-date" style="width:60%;height:2rem" autocomplete="off"/>
				</div>
				<div>
					<label>Description:</label>
					<input type="text" name="description" style="width:60%;height:2rem" autocomplete="off"/>
				</div>
				<div style="text-align:center">
					<button class="btn">Add</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
  document.getElementById("notes").style.marginLeft = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
  document.getElementById("notes").style.marginLeft = "0";
}

const open= document.querySelector('#add');
function add(){
	const open= document.querySelector('#add');
	const txt=document.querySelector('.wrapper');
	txt.style.display = 'block';

}
const txt=document.querySelector('.wrapper');

open.addEventListener('click',()=>{
    txt.style.display = 'block';
});


const close=document.querySelector('#close');
const close1=document.querySelector('#close1');

close.addEventListener('click',()=>{
    txt.style.display = 'none';
});

/* close1.addEventListener('click',()=>{
	const txt1=document.querySelector('.wrapper-1');
    txt1.style.display = 'none';
});

 */
const openEmail=document.querySelector('.open-email');
const emailBox=document.querySelector('.email-box');
openEmail.addEventListener('click',()=>{
	emailBox.style.display='block';
});


const closeEmail=document.querySelector('.close-email');
closeEmail.addEventListener('click',()=>{
	emailBox.style.display='none';
});
</script>
	
</body>
</html>