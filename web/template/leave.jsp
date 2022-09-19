<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
	<link href="<%=basePath%>/css/base.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath%>/css/pagename.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!--header-->
	<jsp:include page="header.jsp"/>
	<!--header结束-->

	<div class="container">
			<!--banner-->
			<div class="banner_erji">
				<img src="../images/banner_erji6.jpg" width="1000" height="187" alt="" title="">
			</div>
			<!--banner end-->
			<!--content-->
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
					<p>地址：XXXX</p>
					<p>联系人：XXXX</p>
					<p>电话：0771-xxxxxxx</p>
					<p>QQ：9XXX95</p>
					<p>网址：www.lczdnn.com</p>
					<p>邮编：530001</p>
				</div>
			</div>
				<div class="rightbar">
					<div class="bread"><a href="../index.html">首页</a> >给我留言</div>
					<div class="contact_nei">
					<form id="feedback_form" name="feedback_form" action="#" onsubmit="return false">
						<ul>
							<li>
								<label>您的称呼：</label><input id="txtUserName" name="leaveName" type="text" class="yuyue_in" />
							</li>
							<li>
								<label>您的电话：</label><input id="txtUserTel" name="leavePhone" type="text" class="yuyue_in" />
							</li>
							<li>
								<label>您的性别：</label><input type="radio" class="yuyue_ra" name="leaveSex" value="1" /> <em>男</em> <input name="leaveSex" value="2" type="radio" class="yuyue_ra" /> <em>女</em></li>
							<li>
								<label>你的留言：</label><textarea id="txtContent" name="leaveContent" cols="" rows="" class="yuyue_te"></textarea>
							</li>
							<li>
								<button name="btnSubmit" id="btnSubmit" type="submit" class="btn" >提交</button> <input name="" type="reset" value="重置" class="btn" />
							</li>
						</ul>
					</form>
					</div>
				</div>
			</div>
			<!--content end-->
	</div>

	<!--footer开始-->
	<jsp:include page="footer.jsp"/>
	<!--footer 结束-->
	<script>
		$("#btnSubmit").click(function () {
			$.ajax({
				dataType:"json",
				url:"${pageContext.request.contextPath}/addLeave",
				data:$("#feedback_form").serialize(),
				type:"post",
				success:function (msg){
					if(msg === true){
						Qmsg.info("感谢留言");
						$("#feedback_form").reset();
					}else {
						Qmsg.info("抱歉留言失败了");
					}
				}
			})
		})
	</script>
</body>

</html>

