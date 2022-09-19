<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE HTML>
<html>
<head>
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
                <img src="<%=basePath%>/images/banner_erji5.jpg" width="1000" height="187" alt="" title="">        </div>
            <!--banner end-->

            <!--content-->
            <div class="content clearfix">
                <div class="leftbar">
                    <div class="leftnav">
                        <h1>新闻分类</h1>
                        <ul class="ul_left">
            <li><h3><a href="${pageContext.request.contextPath}/selectNewsByNewsTypes?newsTypes=1">旅游动态</a></h3></li>
            <li><h3><a href="${pageContext.request.contextPath}/selectNewsByNewsTypes?newsTypes=2">旅游公告</a></h3></li>
                </ul>
                  </div>
                    <div class="left_lx">
                        <h1>联系方式</h1>
                        <p>地址：XXXXX</p>
                          <p>联系人：XXXX</p>
                          <p>电话：0771-xxxxxxx</p>
                          <p>QQ：951XXX395</p>
                          <p>网址：www.XXXcom</p>
                          <p>邮编：530001</p>
                    </div>
                </div>
                <div class="rightbar">
                    <div class="bread"><a href="../index.html">首页</a> <c:if test="${newsList.get(0).newsTypes==1}"> >旅游动态</c:if> <c:if test="${newsList.get(0).newsTypes==2}"> >旅游公告</c:if></div>
                <ul class="ul_news">
                    <c:forEach items="${newsList}" var="news">
                        <c:if test="${news.state == 3}">
                            <li><span>${news.newsAddDate}</span><a href="${pageContext.request.contextPath}/selectNewsByNewsId?newsId=${news.newsId}">${news.newsTitle}</a></li>
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

</html>

