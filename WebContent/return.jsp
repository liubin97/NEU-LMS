<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.Instant"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="model.Borrow"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <li>
                            <a href="borrow.jsp">
                                <i class="fa fa-book fa-lg"></i>
                                <i class="fa fa-hand-lizard-o fa-lg"></i>
                                学生借书
                                <span class="label label-warning pull-right">5</span>
                            </a>
                        </li>

                        <li class="active">
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
                            <h2 class="page-header">返还书本 </h2>
                            <c:if test="${flag}"><font color="green"><b>*** 还书成功!!!</b></font><br/><br/> </c:if>
                                <div class="table-responsive">
                                    <form class="form-inline" role="form" action="ReturnController">
                                        <div class="form-group">
                                            <label class="sr-only" for="name">名称</label>
                                            <input type="text" name="searchbox" class="form-control" id="name" placeholder="请输入搜索内容">
                                        </div>
                                        <button type="submit" name ="searchbutton" class="btn btn-default" value="Search"><span class="glyphicon glyphicon-search">搜索</span></button>
                                    </form>
                                </div>

                        <table class="table table-hover" >

                            <thead>
                                <tr>
                                    <th>Borrow Id</th>
                                    <th>书名</th>
                                    <th>作者</th>
                                    <th>学号</th>
                                    <th>学生姓名</th>
                                    <th>借阅时间</th>
                                    <th>归还时间</th>
                                    <th>Fine</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                                <tbody>
                                <c:forEach var="br" items="${allBr}">
                                    <tr>
                                        <td><c:out value="${br.id}"/></td>
                                        <td><c:out value="${br.title}"/></td>
                                        <td><c:out value="${br.authorName}"/></td>
                                        <td><c:out value="${br.studentId}"/></td>
                                        <td><c:out value="${br.studentName}"/></td>
                                        <td><c:out value="${br.borrowDate}"/></td>
                                        <td><c:out value="${br.returnDate}"/></td>

                                        <c:set var="borrowDate" value="${br.borrowDate}"/>
                                        <c:set var="returnDate" value="${br.returnDate}"/>

                                        <td>
                                            <%
                                                Date borrowDate = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(pageContext.getAttribute("borrowDate").toString());
                                                Date returnDate = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(pageContext.getAttribute("returnDate").toString());
                                                Date currentDate = new Date();

                                                int diffInDays = (int) ((currentDate.getTime() - borrowDate.getTime()) / (1000 * 60 * 60 * 24));
                                                pageContext.setAttribute("diffInDays", diffInDays);

                                                DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                                Calendar calobj = Calendar.getInstance();
                                                String returnedDate = df.format(calobj.getTime());
                                                pageContext.setAttribute("returnDate", returnedDate);
                                            %>
                                            <c:choose>
                                                <c:when test="${diffInDays > 7}">
                                                    <c:set var="fine" value="${(diffInDays - 7) * 5}"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="fine" value="${0}"/>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:out value="${fine}"/>
                                        </td>
                                        <td><a href="ReturnController?id=${br.id}&fine=${fine}&returndate=${returnDate}" title="还书"><span class="fa fa-mail-reply"></span></a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>
                            <%--For displaying Page numbers. 
				    The when condition does not display a link for the current page--%>
				   <ul class=" pager">
                  
                        <c:if test="${currentPage != 1}">
				         <li><a href="ReturnController?page=${currentPage - 1}">&laquo;</a></li>
				    	</c:if>
                        	<c:forEach begin="1" end="${noOfPages}" var="i">
				                <c:choose>
				                    <c:when test="${currentPage eq i}">
				                       <li><a href="#" class = "active">${i}</a></li> 
				                    </c:when>
				                    <c:otherwise>
				                    	<li><a href="ReturnController?page=${i}">${i}</a></li>
				    
				                    </c:otherwise>
				                </c:choose>
				            </c:forEach>
                            <c:if test="${currentPage lt noOfPages}">
				        		<li><a href="ReturnController?page=${currentPage + 1}">&raquo;</a></li>
				    		</c:if>
                        </ul>
                        </div>
                    </div>
                </div>
    </c:if>
</body>
</html>
