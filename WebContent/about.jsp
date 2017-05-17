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
    <title>About</title>
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

                    <li class="active">
                        <a href="about.jsp">
                            <i class="glyphicon glyphicon-cog"></i>
                            关于系统
                        </a>
                    </li>
                </ul>

            </div>

            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <div class="jumbotron">
                    <h1>
                        本馆简介
                    </h1>
                    <p class="lead">
                        &nbsp&nbsp&nbsp&nbsp图书馆采用较先进的管理员系统，实现了图书馆业务自动化，管理员能够实时完成读者借阅信息查询等功能。图书馆以“尊重、理解、关心、服务”为工作理念，积极主动地为我校的教学和科研服务，建立了完整的藏借阅大空间一体化的读者服务体系。
                    </p>
                    <p class="lead">
                            &nbsp&nbsp&nbsp&nbsp除此之外，图书馆构建了先进的网络设施，通过校园网为全校用户提供信息检索服务。目前，图书馆在自动化、网络化建设方面取得了很大的发展。我们的发展目标是建设一个现代化的、多功能的、高度文明的大学图书馆，一个在文献保障、信息环境、服务水平、人员素质等方面接近世界先进水平的大学图书馆。
                     </p>
                     <p class="lead">
                            &nbsp&nbsp&nbsp&nbsp本图书馆实行了大面积开架借阅，并提出了“能开架的不闭架，能外借的不内阅”的口号，本图书馆立足于多年开架服务的实践，从图书馆管理与服务人性化的视角出发，从公益性图书馆以读者为中心的理念出发，对原有开架方式进行全方位的分析与理性思考，并创新性地提出并实现了一种新的开架服务超市型管理模式，也称“超市式”开架。
                     </p>

                    <p class="lead">
                            &nbsp&nbsp&nbsp&nbsp“超市式”开架的实施，变原来的“以书库管理为中心”为“以读者需求为中心”，实现了多种文献资源共存、多种服务功能相融合的复合式服务，不但扩大了流通、提高了文献资源的利用率，也体现了图书馆对读者的人文关怀。
                    </p>

                    <p>
                        <a class="btn btn-primary btn-large" href="#">了解</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</c:if>
</body>
</html>
