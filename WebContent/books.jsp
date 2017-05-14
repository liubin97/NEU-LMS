<%-- 
    Document   : books
    Author     : GJC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <title>Books Page</title>
    </head>
    <body>
    <c:if test="${sessionScope.username != null && sessionScope.username !=''}">
    	<div class="main" action = "StudentsController" method="get">
        <%@include file="header.jsp" %>

            <div id = "box">

                <h3>书本 </h3>
                <form action="BooksController">
                    <input type="text" name="searchbox" placeholder="Enter id to search..."/>
                <input type="submit" name ="searchbutton" value="Search"/>
                </form>
                <br/><br/>

                <c:if scope="request" test="${exists == 'yes'}" var="reg">
                    <font color="red"><b>*** Id should be unique!!</b></font><br/><br/>
                </c:if>
                <c:if scope="request" test="${flag == 'reg'}" var="reg">
                    <font color="green"><b>*** New Book Added!!</b></font><br/><br/>
                </c:if>
                <c:if scope="request" test="${flag == 'update'}" var="upd">
                    <font color="green"><b>*** Update Successful!!</b></font><br/><br/>
                </c:if>

                <table border="1" style="width: 100%">
                    <thead>
                        <tr>
                            <th>书号</th>
                            <th>书名</th>
                            <th>作者名</th>
                            <th>类别</th>
                            <th>数目</th>                    
                            <th colspan="2">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${allBooks==null}">
                    <tr <c:if test="${isbn == book.isbn}"> style="background-color: " </c:if>>
                                <td><c:out value="${book.isbn}"/></td>
                                <td><c:out value="${book.bookname}"/></td>
                                <td><c:out value="${book.authorname}"/></td>
                                <td><c:out value="${book.category}"/></td>
                                <td><c:out value="${book.selfno}"/></td>
                                <td><a href="BooksController?action=update&isbn=${book.isbn}">更新</a></td>
                                <td><a href="BooksController?action=delete&isbn=${book.isbn}">删除</a></td>
                            </tr>
                    </c:if>
                    
                        <c:forEach items="${allBooks}" var="book">
                            <tr <c:if test="${isbn == book.isbn}"> style="background-color: " </c:if>>
                                <td><c:out value="${book.isbn}"/></td>
                                <td><c:out value="${book.bookname}"/></td>
                                <td><c:out value="${book.authorname}"/></td>
                                <td><c:out value="${book.category}"/></td>
                                <td><c:out value="${book.selfno}"/></td>
                                <td><a href="BooksController?action=update&isbn=${book.isbn}">更新</a></td>
                                <td><a href="BooksController?action=delete&isbn=${book.isbn}">删除</a></td>
                            </tr>

                        </c:forEach>
                    </tbody>

                    <tfoot>
                        <tr>
                            <td > <a href="newbook.jsp" > <img class = "addImage" src="images/add.png"></a>
                            </td> 
                        </tr>

                    </tfoot>


                </table>
            </div>
           </div>
        </c:if>
</body>
<script >
var d = document.getElementById("bookHeader");
d.className += "active";
</script>
</html>
