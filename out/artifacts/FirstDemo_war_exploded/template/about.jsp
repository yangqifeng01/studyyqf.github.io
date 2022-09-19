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
	<title>潇湘之地-永州</title>
	<meta content="潇湘之地-永州" name="keywords" />
	<meta content="潇湘之地-永州" name="description" />
	<link href="../css/base.css" rel="stylesheet" type="text/css">
	<link href="../css/pagename.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!--header-->
	<jsp:include page="header.jsp"/>
	<!--header结束-->
	<div class="container">
			<!--banner开始-->
			<div class="banner_erji">
				<img src="../images/banner_erji.jpg" width="1000" height="187" alt="" title="">
			</div>
			<!--banner结束-->
			<!--content开始-->
			<div class="content clearfix">
				<div class="leftbar">
					<div class="leftnav">
						<h1>其他目录</h1>
						<ul class="ul_left">
							<li><h3><a href="leave.jsp">给我留言</a></h3></li>
							<li><h3><a href="about.jsp">团队介绍</a></h3></li>
							<li><h3><a href="connection.jsp">联系我们</a></h3></li>
						</ul>
					</div>
					<div class="left_lx">
						<h1>联系方式</h1>
						<p>地址:XXXXXXXX</p>
						  <p>联系人：XXXXX</p>
						  <p>电话：0771-xxxxxxx</p>
						  <p>QQ：XXXXX</p>
						  <p>网址：XXXXXX</p>
						  <p>邮编：530001</p>
					</div>
				</div>
				<div class="rightbar">
					<div class="bread"><a href="../index.html">首页</a> > 团队介绍</div>
					<div class="con_news">
						<p class="p_tit2">
							<span>团队介绍</span>
					  </p>
						<div class="con">
						   <p><p>
			&nbsp;&nbsp;&nbsp;&nbsp;我们的团队成员来自五湖四海，为了一个共同的梦想走到了一起。我们虽然拥有不同的性格、但都有一个共同的特点：热爱物联网、热爱网站开发！<br />
	&nbsp;&nbsp;&nbsp;&nbsp;我们激情四射，但底蕴丰厚；我们活力无限，也同样耐得住寂寞；我们满怀理想，脚踏实地去实现；我们创想无限，我们拒绝平庸！
	<br />
	&nbsp;&nbsp;&nbsp;&nbsp;在这里，我们的每个想法都会得到团队中肯的意见，最终趋于完美；在这里，我们在一起，没有曲高和寡，只有知己相伴；在这里，我们的工作受到应得的肯定，付出一定有回报！</p>
		<p><img src="../images/about.png"><br />
		<p>
			<br />
		</p>
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

