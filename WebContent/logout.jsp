<%-- 
    Document   : logout
    Author     : GJC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <body>
        <%
            session.setAttribute("username", null);
            session.invalidate();
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
