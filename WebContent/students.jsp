
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
<script type="text/javascript">
    $(function(){
        $(".close").click(function(){
            $("#myAlert").alert();
        });
    });
</script>

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
                        <li><a href="https://github.com/Xie-Dong/JSP_Work"><span class="fa fa-github"></span>GitHub</a></li>
                        <li><a href="#"><span class="fa fa-spinner fa-pulse"></span></a></li>
                        <li><a title="联系我们" href="mailto:xdmango@icloud.com"><span class="fa fa-envelope-o">联系我们</span></a></li>
                        <li><a href="#"><span class="fa fa-chrome fa-pulse"></span></a></li>
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
                            <a href="about.jsp">
                                <i class="glyphicon glyphicon-cog"></i>
                                关于系统
                            </a>
                        </li>
                    </ul>

                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h2 class="page-header">学生列表</h2>

                    <div class="table-responsive">

                        <div class="col-md-11">
                        <form class="form-inline" role="form" action="">
                            <div class="form-group">
                                <label class="sr-only" for="name">名称</label>
                                <input type="text" name="searchbox" class="form-control" id="name" placeholder="请输入搜索内容">
                            </div>
                            <button type="submit" name ="searchbutton" class="btn btn-default" value="Search"><span class="glyphicon glyphicon-search">搜索</span></button>
                        </form>
                       </div>

                        <div class="col-md-1 pull-right" >
                            <button class="btn btn-default">  <a href="newstudent.jsp" > <span class="fa fa-plus">增加</span></a> </button>
                        </div>

                    </div>
                        <c:if scope="request" test="${exists == 'yes'}" var="reg">
                            <div id="myAlert" class="alert alert-danger">
                                <a href="#" class="close" data-dismiss="alert">&times;</a>
                                <strong>学生Id 重复!!</strong>
                            </div>
                        </c:if>
                        <c:if scope="request" test="${flag == 'reg'}" var="reg">
                            <div id="myAlert" class="alert alert-success">
                                <a href="#" class="close" data-dismiss="alert">&times;</a>
                                <strong> 注册成功!!</strong>
                            </div>
                        </c:if>
                        <c:if scope="request" test="${flag == 'update'}" var="upd">
                            <div id="myAlert" class="alert alert-success">
                                <a href="#" class="close" data-dismiss="alert">&times;</a>
                                <strong>更新成功!!</strong>
                            </div>
                        </c:if>
                    <div class="table_marign">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>学号</th>
                            <th>姓</th>
                            <th>名</th>
                            <th>邮箱</th>
                            <th>电话</th>
                            <th>地址</th>
                            <th>性别</th>
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
                                <td><c:out value="${student.dept}"/></td>
                                <td  ><a href="StudentsController?action=update&id=${student.id}" title="更新"><span class="fa fa-refresh fa-spin"></span></a></td>
                                <td ><a href="StudentsController?action=delete&id=${student.id}" title="删除"><sapn class="fa fa-close"></sapn></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                        <ul class=" pager">

                            <c:if test="${currentPage != 1}">
                                <li><a href="StudentsController?page=${currentPage - 1}">&laquo;</a></li>
                            </c:if>
                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                <c:choose>
                                    <c:when test="${currentPage eq i}">
                                        <li><a href="#" class = "active">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="StudentsController?page=${i}">${i}</a></li>

                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${currentPage lt noOfPages}">
                                <li><a href="StudentsController?page=${currentPage + 1}">&raquo;</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</body>
</html>
