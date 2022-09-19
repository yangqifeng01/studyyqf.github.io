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
		<title>用户管理</title>
		<meta name="description" content="Restyling jQuery UI Widgets and Elements" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace.min.css" id="main-ace-style" />
		<%--提示框--%>
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/message.css"/>
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-part2.min.css" />
		<![endif]-->
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<%=basePath%>/admin/assets/css/ace-ie.min.css" />
		<![endif]-->
		
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
							<a href="javascript:void(0)">用户管理</a>
						</li>
						<li>
							<a href="<%=basePath%>/admin/userlist.jsp">用户信息</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>

				<br>
				<div class="page-content">
					<!-- /section:settings.box -->
					<div class="row">
							<!-- /section:table-content -->
						<div class="col-xs-12">
							<div class="row">
								<div class="col-md-6" >
									<a href="<%=basePath%>/admin/adduser.jsp" class="btn btn-default">添加用户</a>
									<a class="btn btn-default" href="<%=path%>/admin/">删除选中</a>
								</div>
								<div class="col-md-6">
									<div class="form-inline" style="float: right">
										<div class="form-group">
											<input type="text" class="form-control" placeholder="请输入用户名" id="nameString">
										</div>
										<div class="form-group">
											<button class="btn btn-sm" id="search">查询</button>
										</div>
									</div>
								</div>
							</div>
							<br/>
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center"><label class="position-relative"><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
										<th>序号</th><th>用户名</th><th class="hidden-480">性别</th><th>邮箱</th><th>用户状态</th><th>用户类型</th><th class="hidden-480"><i class="ace-icon fa fa-clock-go bigger-110 hidden-480"></i>头像</th><th class="hidden-480">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${allUsers}" var="user">
									<tr><td class="center"><label class="position-relative"><input type="checkbox" class="ace" /><span class="lbl"></span></label></td>
										<td><a href="#">${user.userId}</a></td>
										<td>${user.userName }</td>
										<c:choose><c:when test="${user.sex ==1 }"><td>男</td></c:when><c:otherwise><td>女</td></c:otherwise></c:choose>
										<td class="hidden-480"><span class="label label-sm label-warning">${user.email} </span></td>
										<c:choose><c:when test="${user.state==1 }"><td>可登录</td></c:when><c:otherwise><td>不可登录</td></c:otherwise></c:choose>
										<c:choose><c:when test="${user.status==1}"><td>普通用户</td></c:when> <c:when test="${user.status==2}"><td>普通管理员</td></c:when> <c:when test="${user.status==3}"><td>超级管理员</td></c:when></c:choose>
										<td ><img src="<%=basePath%>/${user.headPro}" alt="${user.userName}" width="100px" height="100px"></td>
										<c:if test="${user.status != 3}">
											<td>
												<div class="hidden-sm hidden-xs btn-group">
													<a class="btn btn-xs btn-info" href="${pageContext.request.contextPath}/admin/toUpdateUser?userName=${user.userName}"><i class="ace-icon fa fa-pencil bigger-120"></i></a>&nbsp;&nbsp;
													<button class="btn btn-xs btn-danger" onclick="Delete('${user.userName}')"><i class="ace-icon fa fa-trash-o bigger-120"></i></button>
												</div>
											</td>
										</c:if>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<%--分页--%>
							<div class="row">
								<span class="col-xs-1"></span>
								<div class="col-xs-11">
									<ul class="pagination">
										<li><span>共 ${pageInfo.total} 条</span></li>
										<li><a href="${pageContext.request.contextPath}/admin/fenYe?pageNum=1&pageSize=${pageInfo.pageSize}">首页</a></li>
										<li><a href="${pageContext.request.contextPath}/admin/fenYe?pageNum=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}">上一页</a></li>
										<%--最多五个页面选项，大于5个则只显示五个--%>
										<c:forEach begin="1" end="${pageInfo.pages}" var="i">
											<li id="${i}"><a <c:if test="${pageInfo.pageNum == i}">style="background-color: #4e72b8"</c:if> href="${pageContext.request.contextPath}/admin/fenYe?pageNum=${i}&pageSize=${pageInfo.pageSize}">${i}</a></li>
										</c:forEach>
										<li ><a href="${pageContext.request.contextPath}/admin/fenYe?pageNum=${pageInfo.pageNum+1}&pageSize=${pageInfo.pageSize}">下一页</a></li>
										<li><a href="${pageContext.request.contextPath}/admin/fenYe?pageNum=${pageInfo.pages}&pageSize=${pageInfo.pageSize}">尾页</a></li>
										<li><span>共 ${pageInfo.pages} 页</span></li>
										&nbsp;&nbsp;
										<li><label>
											<select id="pageSize">
												<option <c:if test="${pageInfo.pageSize==5}">selected="selected"</c:if> value="5"> 5条/页 </option>
												<option <c:if test="${pageInfo.pageSize==10}">selected="selected"</c:if> value="10"> 10条/页 </option>
												<option <c:if test="${pageInfo.pageSize==15}">selected="selected"</c:if> value="15"> 15条/页 </option>
												<option <c:if test="${pageInfo.pageSize==20}">selected="selected"</c:if> value="20"> 20条/页 </option>
											</select>
										</label>
										</li>
										&nbsp;&nbsp;
										<li><label> 前往 <input id="pageNum" type="text" style="height: 25px;width: 50px;border-radius: 7px;text-align: center" value="${pageInfo.pageNum}"> 页 </label></li>
									</ul>
								</div>
							</div>

						</div><!-- /.table-content -->
					</div>
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
		<script src="<%=basePath%>/admin/assets/js/ace-extra.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/ace-elements.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/ace.min.js"></script>
		<%--提示信息--%>
		<script src="<%=basePath%>/admin/assets/js/message.min.js"></script>
		<script src="<%=basePath%>/admin/assets/js/bootbox.min.js"></script>
		<script type="text/javascript">
			$(function(){
				if(window.history.replaceState){
					window.history.replaceState(null, null, "${pageContext.request.contextPath}/admin/userlist.jsp")
				}
			})
			//指定当前页和页面数据数量
			function change(){
				let pageSize = $("#pageSize option:selected");
				let pageNum = $("#pageNum");
				window.location.href= "${pageContext.request.contextPath}/admin/fenYe?pageNum="+pageNum.val()+"&pageSize="+pageSize.val();

			}
			//页数选择事件
			$("#pageSize").change(function (){
				change();
			})
			//指定页跳转
			$("#pageNum").blur(function (){
				change()
			})

			//删除用户
			function Delete(username){
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
								"url":"${pageContext.request.contextPath}/admin/deleteUser",
								"data":{"userName":username},
								"type":"post",
								"dataType":"text",
								"success":function(data){
									console.log(data);
									console.log(username);
									if(data === "true"){
										// alert("删除成功");
										window.location.href="${pageContext.request.contextPath}/admin/userlist.jsp"
									}else {
										Qmsg.info("权限不足，删除失败！");
									}
								}
							});
						}
					}
				});
			}

			$("#search").click(function () {
				let username = $("#nameString").val();
				if(username){
					$.ajax({
						url:"${pageContext.request.contextPath}/admin/searchUser2",
						dataType: "json",
						data: {"userName":username},
						type: "post",
						success:function (data){
							console.log(data);
							if(!data){
								Qmsg.warning("该用户不存在");
							}else{
								if(data.sex === 1){
									data.sex = "男";
								}else {
									data.sex = "女";
								}
								if(data.state === 1){
									data.state = "可登录";
								}else{
									data.state = "不可登录";
								}
								if(data.status === 1){
									data.status = "普通用户";
								}else{
									data.status = "管理员";
								}
								bootbox.dialog({
									message:"<span class='bigger-110'> 用户id:"+data.userId+",用户名:"+data.userName+",邮箱:"+data.email+",性别:"+data.sex+","
											+"状态:"+data.state+",用户类型:"+data.status+",创建时间:"+data.addDate+"</span>",
									buttons:
											{
												"success" :
														{
															"label" : "<i class='ace-icon fa fa-pencil bigger-120'></i> 编辑 ",
															"className" : "btn-sm btn-success",
															"callback": function() {
																window.location.href="${pageContext.request.contextPath}/admin/toUpdateUser?userName="+data.userName;
															}
														},
												"danger" :
														{
															"label" : "<i class='ace-icon fa fa-trash-o bigger-120'></i> 删除 ",
															"className" : "btn-sm btn-danger",
															"callback": function() {
																Delete(data.userName);
															}
														},
												"click" :
														{
															"label" : " 取消 ",
															"className" : "btn-sm btn-primary",
															"callback": function() {
															}
														}
											}
								});

							}
						}
					})
				}else{
					Qmsg.error("输入不能为空");
				}
			});
		</script>
	</body>
</html>
