<%@ page import="com.fd.model.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
		<title>添加用户</title>
		<meta name="description" content="Restyling jQuery UI Widgets and Elements" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath%>/admin/assets/css/select2.css" />
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
							<a href="<%=basePath%>/admin/index.jsp">首页</a>
						</li>
						<li>
							<a href="javascript:void(0)">用户管理</a>
						</li>
						<li>
							<a href="form-wizard.html">增加用户</a>
						</li>
					</ul><!-- /.breadcrumb -->

				</div>

				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">

					<!-- /section:settings.box -->
					<div class="page-content-area">

						<div class="row">
							<div class="col-xs-12">

								<div class="widget-box">
									<div class="widget-header widget-header-blue widget-header-flat">
										<h4 class="widget-title lighter">添加新用户</h4>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<!-- #section:plugins/fuelux.wizard -->
											<div id="fuelux-wizard" data-target="#step-container">

												<!-- /section:plugins/fuelux.wizard.steps -->
											</div>

											<hr />

											<!-- #section:plugins/fuelux.wizard.container -->
											<div class="step-content pos-rel" id="step-container">
												<div class="step-pane active" id="step1">
													<h3 class="lighter block blue">请输入用户信息</h3>

													<form:form action="${pageContext.request.contextPath}/admin/addUser" class="form-horizontal " id="validation-form" method="post" enctype="multipart/form-data">
														<div class="form-group">
														  <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="userName">用户名:</label>
														  <div class="col-xs-12 col-sm-9">
																<div class="clearfix">
																	<input type="text" name="userName" id="userName" class="col-xs-12 col-sm-4 " />
																</div>
															</div>
														</div>

														<div class="form-group">
															<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password">密码:</label>
															<div class="col-xs-12 col-sm-9">
																<div class="clearfix">
																	<input type="password" name="password" id="password" class="col-xs-12 col-sm-4" />
																</div>
															</div>
														</div>

														<div class="form-group">
															<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password2">再次输入密码:</label>
															<div class="col-xs-12 col-sm-9">
																<div class="clearfix">
																	<input type="password" name="password2" id="password2" class="col-xs-12 col-sm-4" />
																</div>
															</div>
														</div>

														<div class="form-group">
															<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">邮箱:</label>
															<div class="col-xs-12 col-sm-9">
																<div class="clearfix">
																	<input type="email" name="email" id="email" class="col-xs-12 col-sm-4" />
																</div>
															</div>
														</div>

														<div class="hr hr-dotted"></div>

														<div class="form-group">
															<label class="control-label col-xs-12 col-sm-3 no-padding-right">用户类型</label>
															<div class="col-xs-12 col-sm-9">
																<div>
																	<label>
																		<input name="status" value="1" type="radio" class="ace" />
																		<span class="lbl"> 普通用户</span>
																	</label>
																</div>
																<div>
																	<label>
																		<input name="status" value="2" type="radio" class="ace" />
																		<span class="lbl"> 管理员用户</span>
																	</label>
																</div>
															</div>
														</div>

														<div class="form-group">
															<label class="control-label col-xs-12 col-sm-3 no-padding-right">性别</label>
															<div class="col-xs-12 col-sm-9">
																<div>
																	<label class="line-height-1 blue">
																		<input name="sex" value="1" type="radio" class="ace" />
																		<span class="lbl"> 男</span>
																	</label>
																</div>

																<div>
																	<label class="line-height-1 blue">
																		<input name="sex" value="2" type="radio" class="ace" />
																		<span class="lbl"> 女</span>
																	</label>
																</div>
															</div>
														</div>

														<div class="hr hr-dotted"></div>

														<div class="form-group">
															<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="multipartFile">上传头像 </label>
															<div class="col-xs-12 col-sm-9">
																<div class="clearfix">
																	<input type="file" name="multipartFile" id="multipartFile" class="col-xs-12 col-sm-4 " />
																</div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-xs-12 col-sm-4 col-sm-offset-3">
																<label>
																	<input class="btn btn-lg btn-success" type="submit" value="提交" id="submit"/>
																</label>
															</div>
													  </div>
													</form:form>
												</div>
											</div>

											<!-- /section:plugins/fuelux.wizard.container -->
											<hr />
<!-- /section:plugins/fuelux.wizard -->
										</div><!-- /.widget-main -->
									</div><!-- /.widget-body -->
								</div>
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
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		$(function(){
			if(window.history.replaceState){
				window.history.replaceState(null, null, "${pageContext.request.contextPath}/admin/adduser.jsp")
			}
		})
		
		$("#validation-form").validate({
			errorElement: 'div',
			errorClass: 'help-block',
			/* focusInvalid: false, */
            rules: {
            	userName: {
                	required:true,
                	checkUsername:true
                },
                password: {
                    required: true,
                    minlength: 5
                },
                password2: {
                    required: true,
                    equalTo: "#password"
                },
                email: "required",
                status:"required",
                sex:"required"
            },
            messages: {
            	userName: {
                	required:"用户名不能为空",
                	checkUsername:"用户名已存在"
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于5个字符"
                },
                password2: {
                    required: "请确认密码",
                    equalTo: "两次密码输入不一致"
                },
                email: "请输入一个正确的邮箱",
                status:"请选择用户类型",
                sex:"请选择性别"
            },
            
            highlight: function (e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},
	
			success: function (e) {
				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
				$(e).remove();
			},
			
			errorPlacement: function (error, element) {
				if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
					var controls = element.closest('div[class*="col-"]');
					if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
					else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
				}
				else if(element.is('.select2')) {
					error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
				}
				else if(element.is('.chosen-select')) {
					error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
				}
				else error.insertAfter(element.parent());
			}
			
        });
		$("#submit").click(function(){
			var username = $("#userName").val();
			var password = $("#password").val();
			var email = $("#email").val();
			var status = $(':radio[name="status"]:checked').val();
			var sex= $(':radio[name="sex"]:checked').val();
			var data = {
					userName:username,
					password:password,
					email: email,
					status:status,
					sex:sex
				}
			console.log(username+","+password+","+ email+","+ status+","+ sex);
		});
		$.validator.addMethod("checkUsername",function(value,elements,params){
			var flag = false;
			$.ajax({
				"async":false,
				"url":"${pageContext.request.contextPath}/admin/searchUser",
				"data":{"userName":value},
				"type":"post",
				"dataType":"json",
				"success":function(data){
					console.log("data");
					console.log(data);
					flag = data;
				}
			});
			return flag;}
		);
		</script>
	</body>
</html>
