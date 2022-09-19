<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>绿城之都-南宁</title>
    <meta content="绿城之都-南宁" name="keywords" />
    <meta content="绿城之都-南宁" name="description" />
    <link href="../css/base.css" rel="stylesheet" type="text/css">
    <link href="../css/pagename.css" rel="stylesheet" type="text/css">
</head>
<body>

    <!--header-->
    <jsp:include page="header.jsp"/>
    <!--header结束-->

    <div class="container">
            <!--banner-->
            <div class="banner_erji">
                <img src="../images/address1.png" width="1000" height="187" alt="" title="">        </div>
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
                        <p>地址：岳阳湖南理工学院</p>
                          <p>联系人：杨祁峰</p>
                          <p>电话：0771-xxxxxxx</p>
                          <p>QQ：2212761033</p>
                          <p>网址：www.lczdnn.com</p>
                          <p>邮编：530001</p>
                    </div>
                </div>
                <div class="rightbar">
                    <div class="bread"><a href="../index.html">首页</a> >联系我们</div>
                    <div class="contact_nei">
                        <div class="luxian_l">
                        <p>
                            地址XXXXXXXXXXXXXXXXXX<br />
                            联系人：XXXXX<br />
                            电话：0771-xxxxxxx&nbsp; XXX7118362<br />
                            传真：530001</p>
                            <p><img src="../images/address2.png" width="600" height="500"> </p>
                        </div>
                    </div>
                </div>
            </div>
            <!--content end-->
    </div>
    <!--footer开始-->
    <jsp:include page="footer.jsp"/>
    <!--footer 结束-->

</body>

</html>

