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
    <title>修改个人信息</title>
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
                    <a href="<%=basePath%>/index.jsp">首页</a>
                </li>
                <li>
                    <a href="javascript:void(0)">修改个人信息</a>
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
                                <h4 class="widget-title lighter">修改个人信息</h4>
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
                                            <h3 class="lighter block blue">请修改个人信息</h3>

                                            <form:form action="${pageContext.request.contextPath}/admin/updateUser" class="form-horizontal " id="validation-form" method="post" enctype="multipart/form-data">
                                                <div class="col-md-8">
                                                    <input type="text" name="userId" id="userId" class="col-xs-12 col-sm-4 " value="${user.userId}" hidden/>
                                                    <div class="form-group">
                                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="userName">用户名:</label>
                                                        <div class="col-xs-12 col-sm-9">
                                                            <div class="clearfix">
                                                                <input type="text" name="userName" id="userName" class="col-xs-12 col-sm-4 " value="${user.userName}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="space-2"></div>
                                                    <div class="form-group">
                                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password">密码:</label>

                                                        <div class="col-xs-12 col-sm-9">
                                                            <div class="clearfix">
                                                                <input type="text" name="password" id="password" class="col-xs-12 col-sm-4" value="${user.password }"/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="space-2"></div>

                                                    <div class="form-group">
                                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">邮箱:</label>
                                                        <div class="col-xs-12 col-sm-9">
                                                            <div class="clearfix">
                                                                <input type="email" name="email" id="email" class="col-xs-12 col-sm-4" value="${user.email }"/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="space-2"></div>
                                                    <div class="form-group">
                                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right">性别</label>

                                                        <div class="col-xs-12 col-sm-9">
                                                            <div>
                                                                <label>
                                                                    <input name="sex" value="1" type="radio" class="ace"  ${(1 eq user.sex)?"checked":"" }/>
                                                                    <span class="lbl"> 男</span>
                                                                </label>
                                                            </div>
                                                            <div>
                                                                <label>
                                                                    <input name="sex" value="2" type="radio" class="ace" ${(2 eq user.sex)?"checked":"" }/>
                                                                    <span class="lbl"> 女</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-4">
                                                    <div class="col-sm-12">
                                                        <div class="clearfix">
                                                            <img id="headPro" src="<%=basePath%>/${user.headPro}" height="180px" width="150px" alt="${user.userName}" style="border: #00a0e9 1px solid">
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <div class="clearfix">
                                                            <label type="button" class="btn-primary btn-sm" for="multipartFile" style="margin-top: 10px;margin-right: 10px">更换头像</label>
                                                            <span id="imgName"></span>
                                                            <input type="file" name="multipartFile" id="multipartFile" style="opacity: 0;"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="hr hr-dotted"></div>

                                                <div class="form-group">
                                                    <div class="col-xs-12 col-sm-4 col-sm-offset-3">
                                                        <label>
                                                            <input type="submit" value="保存修改" class="btn btn-lg btn-successs"/>
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

<script>
    $(
        $("#multipartFile").change(function (){
            let fileObj = $("#multipartFile")[0].files[0];
            let imgName = fileObj.name;
            let reader = new FileReader();
            reader.readAsDataURL(fileObj);
            console.log(imgName);
            $("#imgName").html(imgName);
            reader.onload = function (){
                $("#headPro").attr("src",reader.result);
            }
        })
    )
</script>

</body>
</html>
