<%--
    Document   : newstudents
    Author     : GJC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <title>New Student Page</title>
    </head>
    <body>
     <c:if test="${sessionScope.username != null && sessionScope.username !=''}">
        <%@include file="header.jsp" %>
            <div id = "box" style="text-align:center">
                 <c:if scope="request" test="${action == 'update'}" var="upd">
                   <h2>修改学生信息</h2>
                </c:if>
                <c:if scope="request" test="${action != 'update'}" var="cre">
                   <h2>添加学生</h2>
                </c:if>
 
                <form action="StudentsController">
              
                        <table>
                            <tbody>
                                <tr>
                                    <td>Id:</td>
                                    <td>
                                        <input type="text" name="id" required placeholder="Id should be an integer..."
                                               <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                                               readonly value="<c:out value="${student.id}"/>"
                                               <%}%> style="width: 200px"/>                                    
                                    </td>
                                    <td>
                                        <c:if test="${param.action == 'update'}"><font color="red">(你不能修改这个字段!!!)</font></c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>First Name:</td>
                                        <td><input type="text" name="firstname" required
                                            <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                                            value="<c:out value="${student.firstName}"/>"
                                            <%}%> style="width: 200px"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Last Name:</td>
                                    <td><input type="text" name="lastname"
                                               <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                                               value="<c:out value="${student.lastName}"/>"
                                               <%}%> style="width: 200px"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>E-mail:</td>
                                    <td> <input type="email" name="email"
                                                <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                                                value="<c:out value="${student.email}"/>"
                                                <%}%> style="width: 200px"/>
                                    </td>
                                <tr>
                                    <td>Phone NO.:</td>
                                    <td><input type="text" name="phoneno"
                                               <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                                               value="<c:out value="${student.phoneNo}"/>"
                                               <%}%> style="width: 200px"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Address:</td>
                                    <td><input type="text" name="address"
                                               <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                                               value="<c:out value="${student.address}"/>"
                                               <%}%> style="width: 200px"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Gender: </td>
                                    <td>
                                        <input type="radio" name="gender" value="1" <c:if test="${action == update and student.gender == 1 or empty action}">checked</c:if>/>Male
                                        <input type="radio" name="gender" value="2" <c:if test="${action == update and student.gender == 2}">checked</c:if>/>Female
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Marital Status: </td>
                                        <td>
                                            <input type="radio" name="ms" value="1" <c:if test="${action == update and student.ms == 1 or empty action}">checked</c:if>/> Married
                                        <input type="radio" name="ms" value="2" <c:if test="${action == update and student.ms == 2}">checked</c:if>/> Unmarried
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Department:</td>
                                        <td><input type="text" name="dept" required value="${student.dept}" style="width: 200px"/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="submit" name="${param.action == 'update' ? 'update' : 'create'}" value="${param.action == 'update' ? 'Update' : 'Create'}"/>                                        
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                </form>
            </div>
   
    </c:if>
</body>
</html>
