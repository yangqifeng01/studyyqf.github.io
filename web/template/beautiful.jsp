<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE HTML>
<html lang="en">
    <head>
        <base href="<%=basePath%>">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>绿城之都-南宁</title>
        <meta content="绿城之都-南宁" name="keywords" />
        <meta content="绿城之都-南宁" name="description" />
        <link href="<%=basePath%>/css/base.css" rel="stylesheet" type="text/css">
        <link href="<%=basePath%>/css/pagename.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <!--header-->
        <jsp:include page="header.jsp"/>
        <!--header结束-->
        <div class="container">
                <!--banner-->
                <div class="banner_erji">
                    <img src="<%=basePath%>/images/banner_erji1.jpg" width="1000" height="187" alt="" title="">
                </div>
                <!--banner end-->
                <!--content-->
                <div class="content clearfix">
                    <div class="leftbar">
                        <div class="leftnav">
                            <h1>风景景点</h1>
                            <ul class="ul_left">
                                <li><h3><a href="<%=basePath%>/template/beautiful.jsp">景点介绍</a></h3></li>
                            </ul>
                        </div>
                        <div class="left_lx">
                            <h1>联系方式</h1>
                            <p>地址：XXXX</p>
                            <p>联系人：XXXX</p>
                            <p>电话：0771-xxxxxxx</p>
                            <p>QQ：9XXXX5</p>
                            <p>网址：wwwXXXXm</p>
                            <p>邮编：530001</p>
                        </div>
                    </div>
                    <div class="rightbar">
                        <div class="bread"><a href="../index.jsp">首页</a> > 旅游风景</div>
                        <ul class="ul_zj clearfix">
                            <c:forEach items="${sList}" var="scenery">
                                <c:if test="${scenery.state == 3}">
                                    <li><a href="${pageContext.request.contextPath}/selectSceneryById?id=${scenery.id}"><img src="<%=basePath%>/${scenery.image}" style="width:220px; height:140px" alt=""><span>${scenery.name}</span></a></li>
                                </c:if>
                            </c:forEach>
                        </ul>
                        <div class="paging"></div>
                    </div>
                </div>
                <!--content end-->
        </div>
        <!--footer开始-->
        <jsp:include page="footer.jsp"/>
        <!--footer 结束-->
    </body>
    <script>
        document.onload = function () {
            console.log(${sList.size()});
        }
    </script>
</html>

