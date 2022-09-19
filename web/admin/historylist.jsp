<%@page import="com.fd.model.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>"> 
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>新闻管理</title>
		<meta name="description" content="Restyling jQuery UI Widgets and Elements" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace.min.css" id="main-ace-style" />
		<%--提示框--%>
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/message.css"/>
		<%--对话框--%>
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/dialog.css" />
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-part2.min.css" />
		<![endif]-->
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="<%=basePath%>/admin/assets/js/ace-extra.min.js"></script>
		<!--[if lte IE 8]>
		<script src="<%=basePath%>/admin/assets/js/html5shiv.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			.CSSearchTbl{ border:1px #008CD4 solid;}
			.CSSearchTbl thead{}
			.CSSearchTbl thead tr{}
			.CSSearchTbl thead tr th{  text-align:left; padding-left:10px;}
			.CSSearchTbl tbody{}
			.CSSearchTbl tbody tr{}
			.CSSearchTbl tbody tr td{  padding: 10px;}
			.CSSearchTbl tbody tr td.right{ text-align: left;}
			.CSSearchTbl tbody tr td.left{ text-align: right;}
			.table-responsive{ display: none;}
		</style>
	</head>

	<body class="no-skin">
	
		<!-- #section:basics/navbar.layout -->
			<%@ include file="navbar.jsp" %>
		<!-- /section:basics/navbar.layout -->

		<div class="main-container" id="main-container">
			<!-- #section:basics/sidebar -->
				<%@ include file="sidebar.jsp" %>
			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="<%=basePath%>/admin/index.jsp">首页</a>
						</li>
						<li>
							<a href="javascript:void(0)">信息管理</a>
						</li>
						<li>
							<a href="<%=basePath%>/admin/userlist.jsp">信息</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>

				<div class="page-content">
					<!-- /section:settings.box -->
					<div class="page-content-area">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
									<div class="col-xs-12">
										<table id="data_table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr style="text-align: center">
													<th class="center">
														<label class="position-relative">
															<input type="checkbox" class="ace" />
															<span class="lbl"></span>
														</label>
													</th>
													<th>id</th><th style="width: 200px">题目名称</th><th style="width: 90px">简介</th><th style="width: 90px">更新时间</th><th style="width: 90px">更新者</th><th>图片</th><th class="hidden-480" style="width: 80px">操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${allHistory}" var="history">
												<tr>
													<td class="center"><label class="position-relative"><input type="checkbox" class="ace" /><span class="lbl"></span></label></td>
													<td><a href="#">${history.id}</a></td>
													<td>${history.title }</td>
													<td>${history.introduction}</td>
													<td>${history.updateDate}</td>
													<td>${history.user.userName }</td>
													<td><img src="<%=basePath%>/${history.image}" alt="${history.title}图片" style="width: 200px;height: 100px"></td>
													<td>
														<div class="hidden-sm hidden-xs btn-group">
															<div class="hidden-sm hidden-xs btn-group">
																<a class="btn btn-xs btn-info" href="${pageContext.request.contextPath}/admin/toUpdateUser?userName=${user.userName}"><i class="ace-icon fa fa-pencil bigger-120"></i></a>&nbsp;&nbsp;
															</div>
														</div>
													</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div><!-- /.span -->
								</div><!-- /.row -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content-area -->
				</div><!-- /.page-content -->
			</div><!-- /.main-content -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=basePath%>/admin/assets/js/jquery.min.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='<%=basePath%>/admin/assets/js/jquery1x.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<%=basePath%>/admin/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="<%=basePath%>/admin/assets/js/bootstrap.min.js"></script>

		<script src="<%=basePath%>/admin/assets/js/jquery.dataTables.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/jquery.dataTables.bootstrap.js"></script>

		<!-- ace scripts -->
		<script src="<%=basePath%>/admin/assets/js/ace-elements.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/ace.min.js"></script>
		<%--提示信息--%>
		<script src="<%=basePath%>/admin/assets/js/message.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/bootbox.min.js"></script>
		<%--对话框--%>
		<script src="<%=basePath%>/admin/assets/js/dialog.js"></script>
		<script type="text/javascript">
			$(function(){
				if(window.history.replaceState){
					window.history.replaceState(null, null, "${pageContext.request.contextPath}/admin/historylist.jsp")
				}
			},
			$("#data_table tr:gt(0)").click(function () {
				let id = $(this).find("td a")[0].innerHTML;
				console.log($(this).find(":checkbox").prop("checked"));
				if ($(this).find(":checkbox").prop("checked"))// 此处要用prop不能用attr，至于为什么你测试一下就知道了。
				{
					$(this).find(":checkbox").removeAttr("checked");
					// $(this).find(":checkbox").attr("checked", 'false');
				}
				else
				{
					$(this).find(":checkbox").prop("checked", true);
				}
			}),
			)
		</script>
	</body>
</html>
