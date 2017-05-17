
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--home页面的css-->
    <link href="css/home.css" rel = "stylesheet">
    <link href="css/indexstyle.css" rel="stylesheet">
    <!--font-awesome-->
    <link href="font-awesome/css/font-awesome.min.css"  rel="stylesheet"  type="text/css">
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="js/bootstrap.min.js"></script>
    <title>Borrow</title>
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
                        <li>
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

                        <li class="active">
                            <a href="borrow.jsp">
                                <i class="fa fa-book fa-lg"></i>
                                <i class="fa fa-hand-lizard-o fa-lg"></i>
                                学生借书
                                <span class="label label-warning pull-right">${size}</span>
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
                                 <h2 class="page-header">学生借书</h2>

                            <c:if test="${flag}"><font color="green"><b>*** 借书成功!!!</b></font><br/><br/> </c:if>

                            <form class="form-horizontal" role="form" action="BorrowController">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="studentID">借书人:</label>
                                    <div class="col-sm-6">
                                        <input class="form-control" type="text" name="studentid" id = "studentID" required placeholder="输入学号" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for = "bookID">所借书:</label>
                                    <div class="col-sm-6">
                                        <input class="form-control" type="text" name="bookid" id = "bookID" required placeholder="输入书号" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button  class="btn btn-default" type="submit" name="submit" value="提交"/>提交</button>
                                    </div>
                                </div>
                            </form>
                            <script type="text/javascript">alert("${errMsg}")</script>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </c:if>
</body>
</html>
