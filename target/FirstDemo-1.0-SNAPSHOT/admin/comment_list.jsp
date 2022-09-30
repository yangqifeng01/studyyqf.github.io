 <%@page import="com.fd.model.Comment"%>
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
		<title>留言管理</title>
		<meta name="description" content="Restyling jQuery UI Widgets and Elements" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace.min.css" id="main-ace-style" />
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
		<%--提示框--%>
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/message.css"/>
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
							<a href="admin/index.jsp">首页</a>
						</li>
						<li>
							<a href="javascript:void(0)">评论管理</a>
						</li>
						<li>
							<a href="admin/comment_list.jsp">评论信息</a>
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
										<table id="sample-table-1" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
														<label class="position-relative">
															<input type="checkbox" class="ace" />
															<span class="lbl"></span>
														</label>
													</th>
													<th>序号</th>
													<th>评论号</th>
													<th class="hidden-480">评论内容</th>
													<th>
														评论用户
													</th>
													<th>评论时间</th>
													<th class="hidden-480">操作</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${allComments}" var="comment" varStatus="status">
												<tr>
													<td class="center">
														<label class="position-relative">
															<input type="checkbox" class="ace" />
															<span class="lbl"></span>
														</label>
													</td>

													<td>
														<a href="#">${status.index+1}</a>
													</td>
													
													<td>${comment.commentId }</td>
													
													<td>${comment.commentContent }</td>
																								
													<td>${comment.user.userName }</td>
													<td >${comment.adddate }</td>
													<td>
														<div class="hidden-sm hidden-xs btn-group">
															<button class="btn btn-xs btn-danger" onclick="Delete('${comment.commentId}')">
																<i class="ace-icon fa fa-trash-o bigger-120"></i>
															</button>
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


		<script type="text/javascript">
			jQuery(function($) {

				$(".tbl-search").click(function(){
					$(".table-responsive").slideDown("fast");
				})

				var oTable1 = 
				$('#sample-table-2')
				.dataTable( {
					bAutoWidth: false,
					bInfo:false,
					"aoColumns": [
					  { "bSortable": false },
					  null, 
					  null,
					  null,
					  null, 
					  null,
					  { "bSortable": false },
					  null,
					  { "bSortable": false }
					],
					"aaSorting": [],
			    } );
			
				$(document).on('click', 'th input:checkbox' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
				});
			});

			//删除用户
			function Delete(commentId){
				bootbox.confirm({
					message: "<h3>确认删除吗？</h3>",
					buttons: {
						confirm: {
							label: "确认",
							className: "btn-sm btn-danger",
						},
						cancel: {
							label: "取消",
							className: "btn-sm"
						},
					},
					callback: function (result) {
						if (result) {
							$.ajax({
								"async":true,
								"url":"${pageContext.request.contextPath}/admin/deleteComment",
								"data":{"commentId":commentId},
								"type":"post",
								"dataType":"text",
								"success":function(data){
									console.log(data);
									console.log(commentId);
									if(data === "true"){
										// alert("删除成功");
										window.location.href="${pageContext.request.contextPath}/admin/comment_list.jsp"
									}else {
										Qmsg.info("删除失败！");
									}
								}
							});
						}
					}
				});
			}
		</script>
	</body>
</html>
