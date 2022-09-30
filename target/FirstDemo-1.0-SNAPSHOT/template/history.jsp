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
			<!--banner开始-->
			<div class="banner_erji">
				<img src="<%=basePath%>/images/banner_erji.jpg" width="1000" height="187" alt="" title="">
			</div>
			<!--banner结束-->
			<!--content开始-->
			<div class="content clearfix">
				<div class="leftbar">
					<div class="leftnav">
						<h1>话说永州</h1>
						<ul class="ul_left">
							<li><h3><a href="${pageContext.request.contextPath}/selectHistoryById?id=1">永州简介</a></h3></li>
							<li><h3><a href="${pageContext.request.contextPath}/selectHistoryById?id=2">永州文化</a></h3></li>
							<li><h3><a href="${pageContext.request.contextPath}/selectHistoryById?id=3">永州历史</a></h3></li>
						</ul>
					</div>
					<div class="left_lx">
						<h1>联系方式</h1>
						<p>地址：XXX</p>
						  <p>联系人：XXX</p>
						  <p>电话：0771-xxxxxxx</p>
						  <p>QQ：9XXX95</p>
						  <p>网址：wXXX.com</p>
						  <p>邮编：530001</p>
					</div>
				</div>
				<div class="rightbar">
					<div class="bread"><a href="../index.html">首页</a> > ${history.title}</div>
					<div class="con_news">
						<p class="p_tit2">
							<span>${history.title}</span>
							发布人:${history.user.userName}　　发布时间：${history.updateDate}
					  </p>
						<div class="con">
							${history.content}
						</div>
				  </div>
				</div>
			</div>
			<!--content结束-->
	</div>

	<!--footer开始-->
	<jsp:include page="footer.jsp"/>
	<!--footer 结束-->


</body>

</html>

