<%--
    Document   : borrow
    Author     : GJC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <title>Borrow Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <c:if test="${sessionScope.username != null && sessionScope.username !=''}">
      
            <div id = "box" style="text-align:center">
                <h1>借书!!!</h1>

                <c:if test="${flag}"><font color="green"><b>*** 借书成功!!!</b></font><br/><br/> </c:if>

                    <form action="BorrowController">
                      
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Student Id: </td>
                                        <td>
                                            <input type="text" name="studentid" required placeholder="输入Student Id:" style="width: 350px"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>ISBN NO.: </td>
                                        <td>
                                            <input type="text" name="bookid" required placeholder="输入ISBN NO.:" style="width: 350px"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input type="submit" name="submit" value="Submit"/>                                
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                   
                    </form>
                </div>
          
    </c:if>
</body>
</html>
