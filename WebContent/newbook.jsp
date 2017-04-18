<%--
    Document   : newbook
    Author     : GJC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <title>New Book Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <c:if test="${sessionScope.username != null && sessionScope.username !=''}">
            <div id = "box" style = "text-align:center">
            	 <c:if scope="request" test="${action == 'update'}" var="upd">
                   <h2>修改书本信息</h2>
                </c:if>
                <c:if scope="request" test="${action != 'update'}" var="cre">
                   <h2>添加新书</h2>
                </c:if>
                <form action="BooksController">
                   
                        <table>
                            <tbody>
                                <tr>
                                    <td>ISBN: </td>
                                    <td>
                                        <input type="text" name="isbn" required
                                               <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                                               readonly value="<c:out value="${book.isbn}"/>"
                                               <%}%>/>
                                    </td>
                                    <td>
                                        <c:if test="${param.action == 'update'}"><font color="red">(你不能编辑这个字段!!!)</font></c:if>
                                        </td>
                               </tr>
                                 <tr>
                                        <td>Book's Title:</td>
                                        <td><input type="text" name="bookname" required
                                            <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                                            value="<c:out value="${book.bookname}"/>"
                                            <%}%>/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Author's Name:</td>
                                    <td><input type="text" name="authorname" required
                                               <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                                               value="<c:out value="${book.authorname}"/>"
                                               <%}%>/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Category:</td>
                                    <td> <input type="text" name="category"
                                                <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                                                value="<c:out value="${book.category}"/>"
                                                <%}%>/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Self NO.:</td>
                                    <td><input type="text" name="selfno" required placeholder="Put an Integer..."
                                               <% if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {%>
                                               value="<c:out value="${book.selfno}"/>"
                                               <%}%>/>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="submit" name="${param.action == 'update' ? 'update' : 'create'}" value="${param.action == 'update' ? 'Update' : 'Create'}"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                </form>
            </div>
    </c:if>
</body>
</html>
