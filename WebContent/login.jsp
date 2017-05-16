<%--
    Document   : index
    Author     : GJC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel = "stylesheet" href = "css/mystyle.css">
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="js/bootstrap.min.js"></script>
    <title>LoginController</title>
</head>
<body>
<div class="background">
    <div class="container">
        <div class="header">
            <div>NEU<span>LBS</span></div>
        </div>
        <div class="hight_control">
            <form action="LoginController"  class="form-signin" method="post">
                <h2 class="form-signin-heading"  style="color: white">请登录</h2>
                <label for="inputUsername" class="sr-only">Username</label>
                <input type="text" id="inputUsername" name="username" class="form-control" placeholder="username" required autofocus>
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="password" required>
                <div class="checkbox" style="color: white">
                    <label>
                        <input  type="checkbox" value="remember-me">记住我
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit" value="Login">登录</button>
            </form>
        </div>
    </div>
</div>
<!-- /container -->

<c:if test="${not empty errMsg}">
    <div class="error"><b>Warming: </b> <c:out value="${errMsg}"/><b></b></div>
</c:if>

</body>
</html>
