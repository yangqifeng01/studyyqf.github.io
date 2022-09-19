<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>修改新闻</title>
		<meta name="description" content="Restyling jQuery UI Widgets and Elements" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/select2.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace.min.css" id="main-ace-style" />
		<link rel="stylesheet" href="<%=path%>/uEditor/themes/default/css/ueditor.css">
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
				<!-- #section:basics/content.breadcrumbs -->
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="index.jsp">首页</a>
						</li>
						<li>
							<a href="javascript:void(0)">新闻管理</a>
						</li>
						<li>
							<a href="form-wizard.html">修改新闻</a>
						</li>
					</ul><!-- /.breadcrumb -->

				</div>

				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
					<!-- /section:settings.box -->
					<div class="page-content-area">
						<div class="row">
							<div class="col-xs-12">
							<div>
								<form action="${pageContext.request.contextPath}/admin/updateNews" class="form-inline" method="post" enctype="multipart/form-data">
								<div class="row">
									<input id="newsId" name="newsId" value="${news.newsId}" style="display: none">
									<span class="col-md-6" style="margin: 5px 0">
										<label for="newsTitle">新闻标题：</label><input id="newsTitle" type="text" name="newsTitle" style="width: 400px;" value="${news.newsTitle}"/>
									</span>
									<span class="col-md-6" style="margin: 5px 0">
										<label for="newsAuthor">新闻作者：</label><input id="newsAuthor" type="text" name="newsAuthor" style="width: 200px;" value="${news.newsAuthor}">
									</span>
									<span class="col-md-12" style="margin: 5px 0">
										<span><label style="text-align: center">新闻类型：</label></span>
										<label style="margin: 5px 0"><input type="radio" value="1" name="newsTypes" style="vertical-align: text-bottom;margin-bottom: 2px;" ${(1 eq news.newsTypes)?"checked":""}> 旅游动态 </label>
										<label style="margin: 5px 0"><input type="radio" value="2" name="newsTypes" style="vertical-align: text-bottom;margin-bottom: 2px;" ${(2 eq news.newsTypes)?"checked":""}> 旅游公告 </label>
									</span>
									<span class="col-md-12" style="margin: 5px 0">
										<label for="multipartFile">更换图片：</label>
										<img src="<%=basePath%>/${news.newsImage}" alt="${news.newsTitle}图片" style="width: 200px;height: 100px">
										<label for="multipartFile" style="margin: 5px 0">上传图片：</label ><input id="multipartFile" name="multipartFile" type="file" style="display: inline"/>
									</span>
								</div>
								<label for="myEditor" style="margin: 5px 0">新闻内容：</label>
								<textarea id="myEditor" style="padding-top: 2px;padding-bottom:5px;width: 1030px;height: 200px" name="newsContent">${news.newsContent}</textarea>
								<label class="col-md-5"></label><button class="btn btn-primary" style="text-align: center;margin: 0 auto">确认保存</button>
								</form>
							</div><!-- /.widget-main -->
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

		<!-- page specific plugin scripts -->
		<script src="<%=basePath%>/admin/assets/js/fuelux/fuelux.wizard.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/jquery.validate.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/additional-methods.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/bootbox.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/jquery.maskedinput.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/select2.min.js"></script>

		<!-- ace scripts -->
		<script src="<%=basePath%>/admin/assets/js/ace-elements.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/ace.min.js"></script>
		<!-- 配置文件 -->
		<script type="text/javascript" charset="utf-8" src="<%=path%>/uEditor/ueditor.config.js"></script>
		<!-- 编辑器源码文件 -->
		<script type="text/javascript" charset="utf-8" src="<%=path%>/uEditor/ueditor.all.js"></script>
		<script type="text/javascript"  charset="utf-8" src="<%=path%>/uEditor/lang/zh-cn/zh-cn.js"></script>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		$(function(){
			if(window.history.replaceState){
				window.history.replaceState(null, null, "<%=basePath%>/admin/addnews .jsp")
			}
		})
		</script>
		<script>
			var ue = UE.getEditor("myEditor");
			ue.ready(function (){
				console.log(ue.getContentTxt());
			});
		</script>
	</body>
</html>
