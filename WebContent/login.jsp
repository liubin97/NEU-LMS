<%-- 
    Document   : index
    Author     : GJC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel = "stylesheet" href = "css/login.css">

        <title>LoginController</title>
    </head>
    <body>
      <div class="background"></div>
		<div class="grad"></div>
       <div class="header">
			<div>NEU<span>LBS</span></div>
	  </div>
            
            <form action="LoginController"  class="login"> 
		
				<input type="text" type="text" name="username" placeholder="username"/><br>		
		
				<input type="password" name="password" placeholder="password" />
			
				<input type="submit" value="Login" >			
		
			</form>
 
           <c:if test="${not empty errMsg}">    
           <div class="error"><b>Warming: </b> <c:out value="${errMsg}"/><b></b></div>	                  
           </c:if>
       
    </body>
</html>
