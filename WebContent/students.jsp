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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--book页面的css-->
    <link href="css/home.css" rel = "stylesheet">
    <link href="css/indexstyle.css" rel="stylesheet">
    <!--font-awesome-->
    <link href="font-awesome/css/font-awesome.min.css"  rel="stylesheet"  type="text/css">
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="js/bootstrap.min.js"></script>
    <title>Student</title>
</head>
<body>
    <c:if test="${sessionScope.username != null && sessionScope.username !=''}">
        <!--顶部的导航栏-->
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <div class="title">
                        <a class="navbar-brand" id="logo" href="#">NEU&nbsp; <span >LBS</span></a>
                    </div>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Log-in</a></li>
                        <li><a href="#">Settings</a></li>
                        <li><a href="#">Profile</a></li>
                        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> 退出</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--中间的左边的控制栏-->

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul id="main-nav" class="nav nav-tabs nav-stacked" style="border-bottom:none">
                        <li >
                            <a href="home.jsp">
                                <i class="	glyphicon glyphicon-home"></i>
                                首页
                            </a>
                        </li>


                            <%--<li>--%>
                            <%--<a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">--%>
                            <%--<i class="fa fa-user-circle-o fa-lg"></i>--%>
                            <%--学生管理--%>
                            <%--<span class="pull-right glyphicon glyphicon-chevron-down"></span>--%>
                            <%--</a>--%>
                            <%--<ul id="systemSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">--%>
                            <%--<li><a href="#"><i class="glyphicon glyphicon-user"></i>学生管理</a></li>--%>
                            <%--<li><a href="#"><i class="glyphicon glyphicon-th-list"></i>书本管理</a></li>--%>
                            <%--<li><a href="#"><i class="glyphicon glyphicon-asterisk"></i>学生借书</a></li>--%>
                            <%--<li><a href="#"><i class="glyphicon glyphicon-edit"></i>学生还书</a></li>--%>
                            <%--</ul>--%>
                            <%--</li>--%>
                        <li class="active">
                            <a href="StudentsController" class="nav-header collapsed" >
                                <i class="fa fa-user-circle-o fa-lg"></i>
                                学生管理
                            </a>
                        </li>

                        <li>
                            <a href="BooksController">
                                <i class="glyphicon glyphicon-credit-card"></i>
                                书本管理
                            </a>
                        </li>

                        <li>
                            <a href="borrow.jsp">
                                <i class="fa fa-book fa-lg"></i>
                                <i class="fa fa-hand-lizard-o fa-lg"></i>
                                学生借书
                                <span class="label label-warning pull-right">5</span>
                            </a>
                        </li>

                        <li>
                            <a href="ReturnController">
                                <i class="fa fa-hand-o-right fa-lg"></i>
                                <i class="	glyphicon glyphicon-book"></i>
                                学生还书
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-cog"></i>
                                关于系统
                            </a>
                        </li>
                    </ul>

                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h2 class="page-header">学生列表</h2>
                    <div class="table-responsive">

                        <form class="form-inline" role="form" action="">
                            <div class="form-group">
                                <label class="sr-only" for="name">名称</label>
                                <input type="text" name="searchbox" class="form-control" id="name" placeholder="请输入搜索内容">
                            </div>
                            <button type="submit" name ="searchbutton" class="btn btn-default" value="Search"><span class="glyphicon glyphicon-search">搜索</span></button>
                        </form>

                    </div>
                        <c:if scope="request" test="${exists == 'yes'}" var="reg">
                            <font color="red"><b>*** 学生Id 重复!!</b></font><br/><br/>
                        </c:if>
                        <c:if scope="request" test="${flag == 'reg'}" var="reg">
                            <font color="green"><b>*** 注册成功!!</b></font><br/><br/>
                        </c:if>
                        <c:if scope="request" test="${flag == 'update'}" var="upd">
                            <font color="green"><b>*** 更新成功!!</b></font><br/><br/>
                        </c:if>
                    <table class="table table-striped">
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
                            <th colspan="2">Action</th>
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
                                <td  ><a href="StudentsController?action=update&id=${student.id}" title="更新"><span class="fa fa-refresh fa-spin"></span></a></td>
                                <td ><a href="StudentsController?action=delete&id=${student.id}" title="删除"><sapn class="fa fa-close"></sapn></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>

                        <tfoot>
                            <tr>
                                <td> <a href="newstudent.jsp" > <span class="glyphicon glyphicon-plus"></a></td> </tr></tfoot>

                </div>
            </div>
        </div>


                </table>

            </div>
        </div>
    </c:if>
</body>
</html>
