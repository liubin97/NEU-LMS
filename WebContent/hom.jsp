
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <title>Home</title>
</head>

<body>
<c:if test="${sessionScope.username != null && sessionScope.username !=''}">
    <div class="main">
        <%@include file="header.jsp" %>
        <div id = "box">
            <h2>欢迎 !!!</h2>
            <div class ="introduction">
                <h3>活动设施:</h3>
                <p>

                </p>

                <h3>宗旨:</h3>
                <p>
                    图书馆的使命是提供全面的资源和服务，以支持大学的研究，教学需求。
                </p>
                <h3>视野:</h3>
                <p>
                    建立世界一流的知识资源中心，为了教学和学习提供创新的服务和收藏。
                </p>
                <h3>开馆时间:</h3>
                <p>
                    图书馆将于上午八时至晚上七时开放，周末正常开放在大学假期完全关闭。
                </p>
            </div>
        </div>
    </div>
</c:if>
</body>
<script >
    var d = document.getElementById("homeHeader");
    d.className += "active";
</script>
</html>
