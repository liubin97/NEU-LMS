<%--
    Document   : home
    Author     : GJC
--%>

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
                <article>
                	
                	<h2>欢迎 !!!</h2>
                    <h3>活动设施:</h3>
                    <p>
                        <p>NEU图书馆是一个设备齐全的多层建筑。它正在通过不同部门进行日常活动，例如位于图书馆大楼不同地点的采购部分，流通部分，处理部分和参考部分。图书馆行政部门进行行政活动。
                        收购科一直在努力收集用户所需的各种文件。最近，它为这所大学的不同学院收集了大量不同类型的书籍。
                        流通部分设在图书馆大楼的底层。这所大学的所有研究人员，学生和老师都可以根据流通部门的规定借阅所需的书籍，以便在图书馆或家庭之外读书。只有那些超过2份的书可以借给学生/教师/研究人员。
                        处理部门正在做一个重要的工作。它使用AACR-2代码和D.D.C.编写目录并分类所有类型的文档。方案。它位于图书馆大楼的一楼。
                        参考部分是另一个重要部分。它位于建筑物的一楼和二楼。教师，研究人员和学生可以阅读参考部分中的罕见文件。它还提供一张名义费用的影印设备。本节另一重要的服务是现在的意识服务。它经常将当前收到的文件清单发送给学院。论文73页，“国内外期刊”和“15日报”均保留在大楼二楼。各类用户可以在这里阅读杂志，日报和论文。图书馆有一个网络中心。所有用户可能会使用网络中心的费用。
                    </p>
                    <h3>宗旨:</h3>
                    <p>
                        	图书馆的使命是提供全面的资源和服务，以支持大学社区的研究，教学和学习需求。
                    </p>
                    <h3>视野:</h3>
                    <p>
                       	 建立世界一流的知识资源中心，并通过最新的技术为研究，教学和学习社区提供创新的服务和收藏。
                    </p>
                     <h3>开馆时间:</h3>
                    <p>
                      	  图书馆将于上午八时至晚上七时开放。 在大学假期完全关闭。
                    </p>
                </article>
            </div>
 		</div>
    </c:if>
</body>
</html>
