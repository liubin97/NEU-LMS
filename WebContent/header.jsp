<%--
    Document   : header
    Author     : GJC
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/header.css">
	</head>
	<body>
		<div class="header">
			<div class="logo">
			     <div>NEU&nbsp;<span>LBS</span></div>
	    	</div>
	    	 <div class="menu">
	      	  <ul>
		          <li id="homeHeader"><a href="home.jsp" style="border-radius: 8px		;">主页</a></li>
		          <li id="studentHeader"> <a href="StudentsController" style="border-radius: 8px;">学生</a></li>
		          <li id="bookHeader"><a href="BooksController" style="border-radius: 8px;">书本</a></li>
		          <li id="borrowHeader"><a href="borrow.jsp" style="border-radius: 8px;">借书</a></li>
		          <li id="returnHeader"><a href="ReturnController" style="border-radius: 8px;">还书</a></li>
		          <li><a href="logout.jsp" style="border-radius: 8px;">退出</a></li>
	       	 </ul>
	     	 </div>
	   </div>
	   <br>
   </body>
</html>
