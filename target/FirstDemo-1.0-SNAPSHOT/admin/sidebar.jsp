<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'sidebar.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/bootstrap.min.css" />
	  <link rel="stylesheet" href="<%=basePath%>/admin/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace.min.css" id="main-ace-style" />

		<!--[if lte IE 9]>
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-rtl.min.css" />
  </head>
  
  <body>
    	<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar responsive">
				<ul class="nav nav-list">
					<li class="active">
						<a href="index.jsp"><i class="menu-icon fa fa-tachometer"></i><span class="menu-text"> 总控制台 </span></a>
						<b class="arrow"></b>
					</li>

					<c:if test="${user.status == 3}">
						<li class="">
							<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-list"></i><span class="menu-text"> 用户管理 </span>
								<b class="arrow fa fa-angle-down"></b>
							</a>
							<b class="arrow"></b>
							<ul class="submenu">
								<li class="">
									<a href="${pageContext.request.contextPath}/admin/userList" ><i class="menu-icon fa fa-caret-right"></i>用户信息</a>
									<b class="arrow"></b>
								</li>
								<li class="">
									<a href="<%=basePath%>/admin/adduser.jsp"><i class="menu-icon fa fa-caret-right"></i>添加用户</a>
									<b class="arrow"></b>
								</li>
							</ul>
						</li>
					</c:if>


					<li class="">
						<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-list"></i><span class="menu-text"> 景点管理 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="${pageContext.request.contextPath}/admin/sceneryList" ><i class="menu-icon fa fa-caret-right"></i>景点信息</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a href="<%=basePath%>/admin/addscenery.jsp"><i class="menu-icon fa fa-caret-right"></i>添加景点</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-list"></i><span class="menu-text"> 美食管理 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="${pageContext.request.contextPath}/admin/foodList" ><i class="menu-icon fa fa-caret-right"></i>美食信息</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a href="<%=basePath%>/admin/addfood.jsp"><i class="menu-icon fa fa-caret-right"></i>添加美食</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-list"></i><span class="menu-text"> 新闻管理 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="${pageContext.request.contextPath}/admin/newsList" ><i class="menu-icon fa fa-caret-right"></i>新闻信息</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a href="<%=basePath%>/admin/addnews.jsp"><i class="menu-icon fa fa-caret-right"></i>添加新闻</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-list"></i><span class="menu-text"> 轮播图管理 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="${pageContext.request.contextPath}/admin/slideshowList" ><i class="menu-icon fa fa-caret-right"></i>轮播图信息</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a href="<%=basePath%>/admin/addslideshow.jsp"><i class="menu-icon fa fa-caret-right"></i>添加轮播图</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-pencil-square-o"></i><span class="menu-text"> 评论管理 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="${pageContext.request.contextPath}/admin/commentList"><i class="menu-icon fa fa-caret-right"></i>评论信息</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-pencil-square-o"></i><span class="menu-text"> 留言管理 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="${pageContext.request.contextPath}/admin/leaveList"><i class="menu-icon fa fa-caret-right"></i>留言信息</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
				</ul><!-- /.nav-list -->

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
			</div>
  </body>
</html>
