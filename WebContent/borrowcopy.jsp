
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <title>Borrow Page</title>
</head>
<body>
<c:if test="${sessionScope.username != null && sessionScope.username !=''}">
    <div class="main">
        <%@include file="header.jsp" %>
        <div id = "box" style="text-align:center">
            <h1>借书!!!</h1>

            <c:if test="${flag}"><font color="green"><b>*** 借书成功!!!</b></font><br/><br/> </c:if>

            <form action="BorrowController" class = "borrow">
                <label for="studentID">
                    <span>借书人:</span>
                    <input type="text" name="studentid" id = "studentID" required placeholder="输入学号" />
                </label>
                <br>
                <br>
                <label for = "bookID">
                    <span>所借书: </span>
                    <input type="text" name="bookid" id = "bookID" required placeholder="输入书号" />
                </label>
                <br>
                <br>
                <input type="submit" name="submit" value="提交"/>
            </form>
        </div>
    </div>
</c:if>
</body>
<script >
    var d = document.getElementById("borrowHeader");
    d.className += "active";
</script>
</html>
