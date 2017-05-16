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

        <form action="StudentsController" class="myForm">
            <div class = "formLeft">
                <br>
                <label for="input1">学号</label><br>
                <label for="input2">性氏</label><br>
                <label for="input3">名字</label><br>
                <label for="input4">邮箱</label><br>
                <label for="input5">电话</label><br>
                <label for="input6">地址</label><br>
                <label for="input7">性别</label><br>
                <label for="input8">婚否</label><br>
                <label for="input9">部门</label><br>

            </div>
            <div class = "formRight">
                <br>
                <input type="text" name="id" required placeholder="Id should be an integer..."
                        <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                       readonly value="<c:out value="${student.id}"/>"
                        <%}%> style="width: 200px"/><c:if test="${param.action == 'update'}"><font color="red">(你不能修改这个字段!!!)</font></c:if><br>

                <input type="text" name="firstname" required
                        <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                       value="<c:out value="${student.firstName}"/>"
                        <%}%> style="width: 200px"/><br>

                <input type="text" name="lastname"
                        <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                       value="<c:out value="${student.lastName}"/>"
                        <%}%> style="width: 200px"/><br>
                <input type="email" name="email"
                        <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                       value="<c:out value="${student.email}"/>"
                        <%}%> style="width: 200px"/><br>

                <input type="text" name="phoneno"
                        <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                       value="<c:out value="${student.phoneNo}"/>"
                        <%}%> style="width: 200px"/><br>

                <input type="text" name="address"
                        <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                       value="<c:out value="${student.address}"/>"
                        <%}%> style="width: 200px"/><br>

                <input type="radio" name="gender" value="1" <c:if test="${action == update and student.gender == 1 or empty action}">checked</c:if>/>男
                <input type="radio" name="gender" value="2" <c:if test="${action == update and student.gender == 2}">checked</c:if>/>女<br>


                <input type="radio" name="ms" value="1" <c:if test="${action == update and student.ms == 1 or empty action}">checked</c:if>/> 结婚
                <input type="radio" name="ms" value="2" <c:if test="${action == update and student.ms == 2}">checked</c:if>/> 单身<br>


                <input type="text" name="dept" required value="${student.dept}" style="width: 200px"/><br>


            </div>
            <input type="submit" name="${param.action == 'update' ? 'update' : 'create'}" value="${param.action == 'update' ? 'Update' : 'Create'}"/>

        </form>
    </div>

</c:if>
</body>
</html>
