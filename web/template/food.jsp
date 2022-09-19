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
				<img src="<%=basePath%>/images/banner_erji3.jpg" width="1000" height="187" alt="" title="">        </div>
			<!--banner end-->
			<!--content-->
			<div class="content clearfix">
				<div class="leftbar">
					<div class="leftnav">
						<h1>必吃美食</h1>
						<ul class="ul_left">
							<li><h3><a href="${pageContext.request.contextPath}/foodListByType?types=2">风味小吃</a></h3></li>
							<li><h3><a href="${pageContext.request.contextPath}/foodListByType?types=1">特色菜</a></h3></li>
						</ul>
					</div>
					<div class="left_lx">
						<h1>联系方式</h1>
						<p>地址：XXXXX</p>
						  <p>联系人：XXXXX</p>
						  <p>电话：XXXXXx</p>
						  <p>QQ：XXXXX</p>
						  <p>网址：XXXX</p>
						  <p>邮编：530001</p>
					</div>
				</div>
				<div class="rightbar">
					<div class="bread"><a href="../index.html">首页</a> <c:if test="${foods.get(0).types==2}"> >特色菜</c:if> <c:if test="${foods.get(0).types==1}"> >风味小吃</c:if></div>
					<ul class="ul_zj clearfix">
						<c:forEach items="${foods}" var="food">
							<c:if test="${food.state == 3}">
								<li><a href="${pageContext.request.contextPath}/selectFoodByFoodId?foodId=${food.foodId}"><img src="<%=basePath%>/${food.foodImage}" width="220" height="140"><span>${food.foodName}</span></a></li>
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

