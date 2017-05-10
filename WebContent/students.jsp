<%--
    Document   : students
    Author     : GJC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <title>学生</title>
    </head>
    <body>
    <c:if test="${sessionScope.username != null && sessionScope.username !=''}">
        
        <div class="main">
        <%@include file="header.jsp" %>
            <div id = "box">
                <h3>学生 </h3>
            
                <input type="text" name="searchbox" placeholder="Enter to search..."/>
                <input type="submit" name ="searchbutton" value="Search"/><br/><br/>

                <c:if scope="request" test="${exists == 'yes'}" var="reg">
                    <font color="red"><b>*** 学生Id 重复!!</b></font><br/><br/>
                </c:if>
                <c:if scope="request" test="${flag == 'reg'}" var="reg">
                    <font color="green"><b>*** 注册成功!!</b></font><br/><br/>
                </c:if>
                <c:if scope="request" test="${flag == 'update'}" var="upd">
                    <font color="green"><b>*** 更新成功!!</b></font><br/><br/>
                </c:if>

                <table border="1" style="border: none;">
                    <thead>
                        <tr>
                            <th>学号</th>
                            <th>姓</th>
                            <th>名</th>
                            <th>邮箱</th>
                            <th>电话</th>
                            <th>地址</th>
                            <th>性别</th>
                            <th>可借书？</th>
                            <th>学院</th>
                            <th colspan="2">行为</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${allStudents}" var="student">
                            <tr <c:if test="${id == student.id}"> style="background-color: gainsboro" </c:if>>
                                <td><c:out value="${student.id}"/></td>
                                <td><c:out value="${student.firstName}"/></td>
                                <td><c:out value="${student.lastName}"/></td>
                                <td><c:out value="${student.email}"/></td>
                                <td><c:out value="${student.phoneNo}"/></td>
                                <td><c:out value="${student.address}"/></td>
                                <td><c:out value="${student.gender == 1 ? '男' : '女'}"/></td>
                                <td><c:out value="${student.ms == 1 ? '可借' : '不可借'}"/></td>
                                <td><c:out value="${student.dept}"/></td>
                                <td style="color = 'green'"><a href="StudentsController?action=update&id=${student.id}">修改</a></td>
                                <td style="color = 'red'"><a href="StudentsController?action=delete&id=${student.id}">删除</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot><tr><td  > <a href="newstudent.jsp" ><img class = "addImage" src="images/add.png"></a></td> </tr></tfoot>
                </table>

            </div>
        </div>
    </c:if>
</body>
<script >
var d = document.getElementById("studentHeader");
d.className += "active";
</script>
</html>
