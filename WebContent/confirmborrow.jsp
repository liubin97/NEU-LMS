
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
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
    <title>Confirmborrow</title>
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

                          <li class="active">
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

                              <h2 class="page-header">借书确认</h2>
                             <div class="table_marign">
                              <form class="form-horizontal" role="form" action="BorrowController">

                                  <table class="table table-striped">
                                      <thead>
                                      <tr><th><big><b>学生信息:</b></big></th></tr>
                                      </thead>
                                      <tbody>
                                      <tr><td>学号:</td><td>${student.id}</td></tr>
                                      <tr><td>姓名:</td><td>${student.firstName} ${student.lastName}</td></tr>
                                      <tr><td>E-mail:</td><td>${student.email}</td></tr>
                                      <tr><td>Phone:</td><td>${student.phoneNo}</td></tr>
                                      <tr><td>学院:</td><td>${student.dept}</td></tr>
                                      <tr><td>地址:</td><td>${student.address}</td></tr>
                                      </tbody>
                                  </table>

                                  <table class="table table-striped">
                                      <thead>
                                      <tr><th><big><b>书本信息:</b></big></th></tr>
                                      </thead>
                                      <tbody>
                                      <tr><td>ISBN:</td><td>${book.isbn}</td></tr>
                                      <tr><td>书名:</td><td>${book.bookname}</td></tr>
                                      <tr><td>作者:</td><td>${book.authorname}</td></tr>
                                      <tr><td>类型:</td><td>${book.category}</td></tr>
                                      <tr><td>Self No:</td><td>${book.selfno}</td></tr>
                                      </tbody>
                                  </table>

                                  <table class="table table-striped">
                                      <thead>
                                      <tr><th><big><b>借书信息</b></big></th></tr>
                                      </thead>
                                      <tbody>
                                      <tr>
                                          <td>借书日期: </td>
                                          <td>
                                              <%
                                                  DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                                  Calendar calobj = Calendar.getInstance();
                                                  String borrowdate = df.format(calobj.getTime());
                                                  out.println(borrowdate);
                                              %>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>归还日期: </td>
                                          <td>
                                              <%
                                                  calobj.add(Calendar.DATE, 7);
                                                  String returndate = df.format(calobj.getTime());
                                                  out.println(returndate);
                                              %>
                                          </td>
                                      </tr>
                                      </tbody>
                                  </table>

                                  <input type="hidden" name="borrowdate" value="<%=borrowdate%>" />
                                  <input type="hidden" name="returndate" value="<%=returndate%>" />
                                  <input type="hidden" name="studentid" value="${student.id}" />
                                  <input type="hidden" name="bookid" value="${book.isbn}" />
                                <div class="col-sm-4 col-sm-offset-5">
                                  <button type="submit" name="confirm" value="Confirm" class="btn btn-primary"><spann class="fa fa-check-circle">确认</spann></button>
                                  <button type="submit" name="notconfirm" value="Cancel" class="btn btn-danger"><span class="fa fa-times-circle">取消</span></button>
                                </div>

                              </form>
                             </div>


                  </div>
              </div>
          </div>

    </c:if>
</body>
</html>
