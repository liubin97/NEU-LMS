
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
    <title>Home</title>
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
                        <li class="active">
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

                        <li>
                            <a href="about.jsp">
                                <i class="glyphicon glyphicon-cog"></i>
                                关于系统
                            </a>
                        </li>
                    </ul>

                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

                    <div class="col-md-12 column">
                        <h1 class="text-center">
                            尊敬的管理员<small>欢迎使用NEU LBS</small>
                        </h1>
                        <div class="carousel slide" id="carousel-443893">
                            <ol class="carousel-indicators">
                                <li data-slide-to="0" data-target="#carousel-443893">
                                </li>
                                <li data-slide-to="1" data-target="#carousel-443893">
                                </li>
                                <li data-slide-to="2" data-target="#carousel-443893">
                                </li>
                                <li data-slide-to="3" data-target="#carousel-443893" class="active">
                                </li>

                            </ol>
                            <div class="carousel-inner">
                                <div class="item">
                                    <img alt="" src="images/player1.jpeg"style="width: 1200px;height: 500px" />
                                    <div class="carousel-caption">
                                        <h4>
                                            安静的时光
                                        </h4>
                                        <p>
                                            世界是那么的大，大到你不可能走遍世界的每一个角落，却可以静静聆听世界的美妙。
                                        </p>
                                    </div>
                                </div>

                                <div class="item">
                                    <img alt="" src="images/player3.jpg"style="width: 1200px;height: 500px" />
                                    <div class="carousel-caption">
                                        <h4>
                                            打开心灵的那扇窗
                                        </h4>
                                        <p>
                                            用心去感悟生活，用心去聆听美好，用心去追逐人生，用心去实现自我，用心去努力付出，用心去博取精彩！
                                        </p>
                                    </div>
                                </div>

                                <div class="item">
                                    <img alt="" src="images/player4.jpg" style="width: 1200px;height: 500px" />
                                    <div class="carousel-caption">
                                        <h4>
                                            与书为伴，幸福一生
                                        </h4>
                                        <p>
                                            打开一本好书，如与益友交谈，看着一本好书，如受良师教会；合上一本好书，如与知己握别。
                                        </p>
                                    </div>
                                </div>
                                <div class="item active">
                                    <img alt="" src="images/player5.jpg"style="width: 1200px;height: 500px" />
                                    <div class="carousel-caption">
                                        <h4>
                                            多读书
                                        </h4>
                                        <p>
                                            多读书，就会多一点自信；多读书，就会多一点魅力；多读书，就会多一点信仰；多读书，就会多一点进步。
                                        </p>
                                    </div>
                                </div>
                            </div> <a class="left carousel-control" href="#carousel-443893" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-443893" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>

                        <div class="row panel_margin">
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img alt="300x200" src="images/thumb1.jpg" />
                                    <div class="caption">
                                        <h3>
                                            设施
                                        </h3>
                                        <p>
                                            图书馆是为读者在馆内使用文献而提供的专门场所。有普通阅览室，专门阅览室和参考研究室三种类型。
                                        </p>
                                        <p>
                                            <a class="btn btn-primary" href="#"><span class="fa fa-hand-pointer-o">详情</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img alt="300x200" src="images/thumb2.jpg" />
                                    <div class="caption">
                                        <h3>
                                            秩序
                                        </h3>
                                        <p>
                                            1.严禁抽烟<br>
                                            2.保持安静<br>
                                            3.爱护读书<br>
                                            4.尊重管理人员<br>
                                        </p>
                                        </p>
                                        <p>
                                            <a class="btn btn-primary" href="#"><span class="fa fa-hand-pointer-o">详情</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img alt="300x200" src="images/thumb3.jpg" />
                                    <div class="caption">
                                        <h3>
                                            反馈意见
                                        </h3>
                                        <p>
                                            欢迎大家对本图书馆提出意见，我们会有针对的进行调整。
                                        </p>
                                        <p>
                                            <a class="btn btn-primary" href="#"><span class="fa fa-hand-pointer-o">详情</a>
                                        </p>
                                    </div>
                                </div>
                            </div>


                        </div>

                    <div class="row footer">
                        <div class="well well-lg" style="margin-bottom: 0px">© 2015-2011 Team 119. All rights reserved.<br>
                            问题反馈：1234599435820（刘冰），1235465777574（宫建春）；技术咨询： 123343582525（谢东），1243543643737（范克强）
                        </div>
                    </div>



                </div>
            </div>
        </div>
    </c:if>
</body>
</html>
