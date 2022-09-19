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
		<title>景点管理</title>
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
							<a href="javascript:void(0)">景点管理</a>
						</li>
						<li>
							<a href="<%=basePath%>/admin/userlist.jsp">景点信息</a>
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
									<div class="col-md-6" >
										<a href="<%=basePath%>/admin/addscenery.jsp" class="btn btn-default">添加景点</a>
										<a class="btn btn-default" href="<%=path%>/admin/">批量删除</a>
									</div>
									<div class="col-md-6">
										<div class="form-inline" style="float: right">
											<div class="form-group">
												<input type="text" class="form-control" placeholder="请输入景点名" id="nameString">
											</div>
											<div class="form-group">
												<button class="btn btn-sm" id="search">查询</button>
											</div>
										</div>
									</div>
								</div>
								<br/>
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
													<th>id</th><th  style="width: 80px">景点名称</th><th>景点位置</th><th>景点描述</th><th style="width: 80px">门票价格</th><th style="width: 80px">添加者</th><th>景点图片</th><th class="hidden-480" style="width: 80px">操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${allSceneries}" var="scenery">
													<c:if test="${scenery.state == 3 || user.status == 3}">
														<tr>
															<td class="center"><label class="position-relative"><input type="checkbox" class="ace" /><span class="lbl"></span></label></td>
															<td><a href="#" id="id">${scenery.id}</a></td>
															<td>${scenery.name }</td>
															<td class="hidden-480"><span class="label label-sm label-warning">${scenery.address } </span></td>
															<td>${scenery.introduction }</td>
															<c:choose><c:when test="${scenery.rates == 0.0}"><td>免费</td></c:when><c:otherwise><td>${scenery.rates}</td></c:otherwise></c:choose>
															<td>${scenery.user.userName }</td>
															<td><img src="<%=basePath%>/${scenery.image}" alt="${scenery.name}图片" style="width: 200px;height: 100px"></td>
																<%--超级管理员用户对于管理员用户添加信息的审核--%>
															<c:if test="${scenery.state == 0 && user.status == 3}"><td><a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/toCheckScenery?id=${scenery.id}">审核</a></td></c:if>
															<c:if test="${scenery.state == 1 && user.status == 3}"><td><label class="label label-sm label-warning">修改中</label></td></c:if>
															<c:if test="${scenery.state == 2 && user.status == 3}"><td><label class="label label-sm label-warning">待发布中</label></td></c:if>
															<c:if test="${scenery.state == 3}">
																<td>
																	<div class="hidden-sm hidden-xs btn-group">
																		<div class="hidden-sm hidden-xs btn-group">
																			<a class="btn btn-xs btn-info" href="${pageContext.request.contextPath}/admin/toUpdateScenery?id=${scenery.id}"><i class="ace-icon fa fa-pencil bigger-120"></i></a>&nbsp;&nbsp;
																			<button class="btn btn-xs btn-danger" onclick="Delete('${scenery.name}')"><i class="ace-icon fa fa-trash-o bigger-120"></i></button>
																		</div>
																	</div>
																</td>
															</c:if>
														</tr>
													</c:if>
													<c:if test="${scenery.authorId == user.userId && scenery.state != 3 && user.status == 2}">
														<tr>
															<td class="center"><label class="position-relative"><input type="checkbox" class="ace" /><span class="lbl"></span></label></td>
															<td><a href="#" id="sceneryId">${scenery.id}</a></td>
															<td>${scenery.name }</td>
															<td class="hidden-480"><span class="label label-sm label-warning">${scenery.address } </span></td>
															<td>${scenery.introduction }</td>
															<c:choose><c:when test="${scenery.rates == 0.0}"><td>免费</td></c:when><c:otherwise><td>${scenery.rates}</td></c:otherwise></c:choose>
															<td>${scenery.user.userName }</td>
															<td><img src="<%=basePath%>/${scenery.image}" alt="${scenery.name}图片" style="width: 200px;height: 100px"></td>
															<%--管理员用户对于超级管理员审核后的状态--%>
															<c:if test="${scenery.state == 0 }">
																<td><label class="label label-sm label-warning">审核中</label></td>
															</c:if>
															<c:if test="${scenery.state == 1}">
																<td align="center"><label class="label label-sm label-warning">审核未通过</label>
																<a class="btn btn-warning" style="margin-top: 5px" href="${pageContext.request.contextPath}/admin/toUpdateScenery?id=${scenery.id}">修改</a></td>
															</c:if>
															<c:if test="${scenery.state == 2}">
																<td><button class="btn btn-success" onclick="issue(${scenery.id})">发布</button></td>
															</c:if>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
										<%--分页--%>
										<div class="row">
											<span class="col-xs-1"></span>
											<div class="col-xs-11">
												<ul class="pagination">
													<li><span>共 ${pageInfo.total} 条</span></li>
													<li><a href="${pageContext.request.contextPath}/admin/fenYe2?pageNum=1&pageSize=${pageInfo.pageSize}">首页</a></li>
													<li><a href="${pageContext.request.contextPath}/admin/fenYe2?pageNum=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}">上一页</a></li>
													<%--最多五个页面选项，大于5个则只显示五个--%>
													<c:forEach begin="1" end="${pageInfo.pages}" var="i">
														<li id="${i}"><a <c:if test="${pageInfo.pageNum == i}">style="background-color: #4e72b8"</c:if> href="${pageContext.request.contextPath}/admin/fenYe2?pageNum=${i}&pageSize=${pageInfo.pageSize}">${i}</a></li>
													</c:forEach>
													<li ><a href="${pageContext.request.contextPath}/admin/fenYe2?pageNum=${pageInfo.pageNum+1}&pageSize=${pageInfo.pageSize}">下一页</a></li>
													<li><a href="${pageContext.request.contextPath}/admin/fenYe2?pageNum=${pageInfo.pages}&pageSize=${pageInfo.pageSize}">尾页</a></li>
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
			$(function(){
				if(window.history.replaceState){
					window.history.replaceState(null, null, "${pageContext.request.contextPath}/admin/scenerylist.jsp")
				}
			}
			)
			//指定当前页和页面数据数量
			function change(){
				let pageSize = $("#pageSize option:selected");
				let pageNum = $("#pageNum");
				window.location.href= "${pageContext.request.contextPath}/admin/fenYe2?pageNum="+pageNum.val()+"&pageSize="+pageSize.val();

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
			function Delete(name){
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
								"url":"${pageContext.request.contextPath}/admin/deleteScenery",
								"data":{"name":name},
								"type":"post",
								"dataType":"text",
								"success":function(data){
									console.log(data);
									console.log(name);
									if(data === "true"){
										// alert("删除成功");
										window.location.href="${pageContext.request.contextPath}/admin/scenerylist.jsp"
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
				let name = $("#nameString").val();
				if(name){
					$.ajax({
						url:"${pageContext.request.contextPath}/admin/selectSceneryByName",
						dataType: "json",
						data: {"name":name},
						type: "post",
						success:function (data){
							console.log(data);
							if(!data){
								Qmsg.warning("该景点不存在");
							}else{
								bootbox.dialog({
									message:"<span class='bigger-110'> 景点id:"+data.id+",景点名:"+data.name+",位置:"+data.address+",简介:"+data.introduction+","
											+"门票:"+data.rates+",开放时间:"+data.openTime+"</span>",
									buttons:
											{
												"success" :
														{
															"label" : "<i class='ace-icon fa fa-pencil bigger-120'></i> 编辑 ",
															"className" : "btn-sm btn-success",
															"callback": function() {
																window.location.href="${pageContext.request.contextPath}/admin/toUpdateScenery?id="+data.id;
															}
														},
												"danger" :
														{
															"label" : "<i class='ace-icon fa fa-trash-o bigger-120'></i> 删除 ",
															"className" : "btn-sm btn-danger",
															"callback": function() {
																Delete(name);
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

			function issue(id) {
				let data = {"id":id,"state":3,"checkMsg":null};
				$.ajax({
					dataType:"json",
					url:"${pageContext.request.contextPath}/admin/checkScenery",
					data:data,
					method:"post",
					success:function (msg){
						if(msg === true){
							alert("发布成功");
							window.location.href = "${pageContext.request.contextPath}/admin/sceneryList";
						}else {
							Qmsg.info("发布失败");
						}
					}
				})
			}

		</script>
	</body>
</html>
