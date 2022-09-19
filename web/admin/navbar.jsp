<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'top.jsp' starting page</title>
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
  <div id="navbar" class="navbar navbar-default">
			<div class="navbar-container" id="navbar-container">
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler">
					<span class="sr-only">Toggle sidebar</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a href="<%=basePath%>/admin/index.jsp" class="navbar-brand">
						<small>
							<img src="<%=basePath%>/admin/assets/avatars/logo.png" alt="" />
						</small>
					</a>
				</div>

				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="green">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
								<span class="badge badge-success" id="message"></span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header" id="count">
									<i class="ace-icon fa fa-envelope-o"></i>

								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar" id="info">
									</ul>
								</li>

							</ul>
						</li>
						<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="<%=basePath%>/${user.headPro}" alt="Jason's Photo" />
								<span class="user-info">
									欢迎您<br />
									${user.userName }
								</span>
								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="<%=basePath%>/admin/perdet.jsp">
										<i class="ace-icon fa fa-user"></i>
										个人信息设置
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="${pageContext.request.contextPath}/admin/exit">
										<i class="ace-icon fa fa-power-off"></i>
										登出
									</a>
								</li>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>

				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>
  <script type="text/javascript">
	  window.jQuery || document.write("<script src='<%=basePath%>/admin/assets/js/jquery.min.js'>"+"<"+"/script>");
  </script>
  <SCRIPT type="text/javascript">
	  $(function (){
		  let count = 0;
		  let ul = $("#info")[0];
		  $.ajax({
			  dataType:"json",
			  url:"${pageContext.request.contextPath}/admin/sceneryChecking",
			  method:"post",
			  success:function (data) {
				  if(data != null){
					  console.log(data);
					  let state = "";
					  for(let i=0;i<data.length;i++){
					  	if(${user .status == 2}){
					  		count++;
							if(data[i].state === 0){
								state = "正在审核中";
							}
							if(data[i].state === 1){
								state = "审核未通过,请修改后再提交审核";
							}
							if(data[i].state === 2){
								state = "审核已通过，请发布";
							}
							let li = document.createElement("li");
							li.innerHTML = "<a href='${pageContext.request.contextPath}/admin/sceneryList'>\n"+
									"  <img src=\"${pageContext.request.contextPath}/"+data[i].image+"\" class='msg-photo' alt=\"Alex'sAvatar\" />\n"+
									"   <span class=\"msg-body\">\n"	+
									"   	 <span class=\"msg-title\">\n"	+
									"        <span class=\"blue\">景点管理:</span>\n"+
									data[i].name+
									"     </span>\n"+
									"     <span class=\"msg-time\">\n"+
									"        <i class=\"ace-icon fa fa-clock-o\"></i>\n"+
									"        <span>"+state+"</span>\n"+
									"     </span>\n"+
									"   </span>\n"+
									"</a>";
							ul.appendChild(li);
						}
						  console.log(${user.status});
					  	if(${user.status == 3} && data[i].state === 0){
							count++;
							let li = document.createElement("li");
							li.innerHTML = "<a href='${pageContext.request.contextPath}/admin/sceneryList'>\n"+
									"  <img src=\"${pageContext.request.contextPath}/"+data[i].image+"\" class='msg-photo' alt=\"Alex'sAvatar\" />\n"+
									"   <span class=\"msg-body\">\n"	+
									"   	 <span class=\"msg-title\">\n"	+
									"        <span class=\"blue\">景点管理:</span>\n"+
									data[i].name+
									"     </span>\n"+
									"     <span class=\"msg-time\">\n"+
									"        <i class=\"ace-icon fa fa-clock-o\"></i>\n"+
									"        <span>等待审核</span>\n"+
									"     </span>\n"+
									"   </span>\n"+
									"</a>";
							ul.appendChild(li);
						}
					  }
					  $("#message").html(count);
					  $("#count")[0].innerHTML = "<i class=\"ace-icon fa fa-envelope-o\"></i>\n"+count+"条信息"
				  }
			  }
		  })

		  $.ajax({
			  dataType:"json",
			  url:"${pageContext.request.contextPath}/admin/foodChecking",
			  method:"post",
			  success:function (data) {
				  if(data != null){
					  console.log(data);
					  let state = "";
					  for(let i=0;i<data.length;i++){
						  if(${user .status == 2}){
							  count++;
							  if(data[i].state === 0){
								  state = "正在审核中";
							  }
							  if(data[i].state === 1){
								  state = "审核未通过,请修改后再提交审核";
							  }
							  if(data[i].state === 2){
								  state = "审核已通过，请发布";
							  }
							  let li = document.createElement("li");
							  li.innerHTML = "<a href='${pageContext.request.contextPath}/admin/foodList'>\n"+
									  "  <img src=\"${pageContext.request.contextPath}/"+data[i].foodImage+"\" class='msg-photo' alt=\"Alex'sAvatar\" />\n"+
									  "   <span class=\"msg-body\">\n"	+
									  "   	 <span class=\"msg-title\">\n"	+
									  "        <span class=\"blue\">景点管理:</span>\n"+
									  data[i].foodName+
									  "     </span>\n"+
									  "     <span class=\"msg-time\">\n"+
									  "        <i class=\"ace-icon fa fa-clock-o\"></i>\n"+
									  "        <span>"+state+"</span>\n"+
									  "     </span>\n"+
									  "   </span>\n"+
									  "</a>";
							  ul.appendChild(li);
						  }
						  console.log(${user.status});
						  if(${user.status == 3} && data[i].state === 0){
							  count++;
							  let li = document.createElement("li");
							  li.innerHTML = "<a href='${pageContext.request.contextPath}/admin/foodList'>\n"+
									  "  <img src=\"${pageContext.request.contextPath}/"+data[i].foodImage+"\" class='msg-photo' alt=\"Alex'sAvatar\" />\n"+
									  "   <span class=\"msg-body\">\n"	+
									  "   	 <span class=\"msg-title\">\n"	+
									  "        <span class=\"blue\">美食管理:</span>\n"+
									  data[i].foodName+
									  "     </span>\n"+
									  "     <span class=\"msg-time\">\n"+
									  "        <i class=\"ace-icon fa fa-clock-o\"></i>\n"+
									  "        <span>等待审核</span>\n"+
									  "     </span>\n"+
									  "   </span>\n"+
									  "</a>";
							  ul.appendChild(li);
						  }
					  }

					  $("#message").html(count);
					  $("#count")[0].innerHTML = "<i class=\"ace-icon fa fa-envelope-o\"></i>\n"+count+"条信息"
				  }
			  }
		  })

		  $.ajax({
			  dataType:"json",
			  url:"${pageContext.request.contextPath}/admin/newsChecking",
			  method:"post",
			  success:function (data) {
				  if(data != null){
					  console.log(data);
					  let state = "";
					  for(let i=0;i<data.length;i++){
						  if(${user .status == 2}){
							  count++;
							  if(data[i].state === 0){
								  state = "正在审核中";
							  }
							  if(data[i].state === 1){
								  state = "审核未通过,请修改后再提交审核";
							  }
							  if(data[i].state === 2){
								  state = "审核已通过，请发布";
							  }
							  let li = document.createElement("li");
							  li.innerHTML = "<a href='${pageContext.request.contextPath}/admin/newsList'>\n"+
									  "  <img src=\"${pageContext.request.contextPath}/"+data[i].newsImage+"\" class='msg-photo' alt=\"Alex'sAvatar\" />\n"+
									  "   <span class=\"msg-body\">\n"	+
									  "   	 <span class=\"msg-title\">\n"	+
									  "        <span class=\"blue\">景点管理:</span>\n"+
									  data[i].newsTitle+
									  "     </span>\n"+
									  "     <span class=\"msg-time\">\n"+
									  "        <i class=\"ace-icon fa fa-clock-o\"></i>\n"+
									  "        <span>"+state+"</span>\n"+
									  "     </span>\n"+
									  "   </span>\n"+
									  "</a>";
							  ul.appendChild(li);
						  }
						  console.log(${user.status});
						  if(${user.status == 3} && data[i].state === 0){
							  count++;
							  let li = document.createElement("li");
							  li.innerHTML = "<a href='${pageContext.request.contextPath}/admin/newsList'>\n"+
									  "  <img src=\"${pageContext.request.contextPath}/"+data[i].newsImage+"\" class='msg-photo' alt=\"Alex'sAvatar\" />\n"+
									  "   <span class=\"msg-body\">\n"	+
									  "   	 <span class=\"msg-title\">\n"	+
									  "        <span class=\"blue\">新闻管理:</span>\n"+
									  data[i].newsTitle+
									  "     </span>\n"+
									  "     <span class=\"msg-time\">\n"+
									  "        <i class=\"ace-icon fa fa-clock-o\"></i>\n"+
									  "        <span>等待审核</span>\n"+
									  "     </span>\n"+
									  "   </span>\n"+
									  "</a>";
							  ul.appendChild(li);
						  }
					  }
					  $("#message").html(count);
					  $("#count")[0].innerHTML = "<i class=\"ace-icon fa fa-envelope-o\"></i>\n"+count+"条信息"
				  }
			  }
		  })

	  })
  </SCRIPT>
  </body>
</html>
