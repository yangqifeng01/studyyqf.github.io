<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
    <link href="css/base.css" rel="stylesheet" type="text/css">
    <link href="css/pagename.css" rel="stylesheet" type="text/css">
    <%--提示框--%>
    <link rel="stylesheet" href="<%=basePath%>/admin/assets/css/message.css"/>
    <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.SuperSlide.2.1.js"></script>
    <style>
        #hidebg {
            position: absolute;
            width: 100%;
            height: 100%;
            background: #000;
            opacity: 0.5;
            filter: alpha(opacity=50);
            display: none;
        }
    </style>
</head>

<body>
<div id="hidebg"></div>
<!--header开始-->
<div class="w1000">
    <div class="header_bottom">
        <a href="index.jsp"><img src="images/logo.jpg" width="294" height="49" alt="" title="绿城之都-南宁"></a>
        <ul>
            <li><a href="${pageContext.request.contextPath}/showSlideshow">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/selectHistoryById?id=3">历史</a></li>
            <li><a href="${pageContext.request.contextPath}/showSceneryList">风景</a></li>
            <li><a href="${pageContext.request.contextPath}/foodListByType?types=2">美食</a></li>
            <li><a href="${pageContext.request.contextPath}/selectNewsByNewsTypes?newsTypes=1">动态</a></li>
            <li><a href="<%=basePath%>/template/leave.jsp">留言</a></li>
            <li><a href="<%=basePath%>/template/about.jsp">团队介绍</a></li>
            <li><a href="<%=basePath%>/template/connection.jsp">联系我们</a></li>
        </ul>
        <span><img src="<%=basePath%>/images/loginLogo.png" style="margin-left:130px;height: 50px;width: 55px;border-radius: 100px;border:#eceff4 solid 1px" onclick="showLogin()" id="headPro"></span>
    </div>
</div>
<!--header结束-->
<div class="container">
		<!--banner开始-->
		<div class="banner">
            <div class="bd">
                <ul>
                    <c:forEach items="${slideshowList}" var="slideshow">
                        <c:if test="${slideshow.imageTypes == 1}"><li style="background:url(<%=basePath%>/${slideshow.imageName}) no-repeat;background-size:100% 100%;"></li></c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
		 <!--调用JS模块图片滚动--> 
        <script type="text/javascript">jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",delayTime:1000,interTime:3000,autoPlay:true, autoPage:true, trigger:"click" });</script>
		<!--banner结束-->
		<!--content开始-->
		<div class="content">
			<p class="p_tit1">走进永州</p>
			<ul class="ul_jishu clearfix">
                <c:forEach items="${indexHistory}" var="history">
                    <li class="fl ml10">
                        <a href="${pageContext.request.contextPath}/selectHistoryById?id=${history.id}"><img src="<%=basePath%>/${history.image}" width="291" height="126" alt="" title="">
                            <p><a href="${pageContext.request.contextPath}/selectHistoryById?id=${history.id}">${history.title}</a>
                                    ${history.introduction}
                            </p>
                        </a>
                    </li>
                </c:forEach>
            </ul>

            <div class="feilei">
                <c:forEach items="${sceneries}" var="scenery" varStatus="varStatus">
                    <div class="fl${varStatus.index+1} fldiv">
                        <a href="${pageContext.request.contextPath}/selectSceneryById?id=${scenery.id}"><img src="<%=basePath%>/${scenery.image}" width="75" height="76" alt="" title="" style="border-radius: 50%"></a>
                        <p><a href="#">${scenery.name}</a></p>
                    </div>
                </c:forEach>
            </div>

            <div class="zjfc">
            	<p class="p_tit1">秀丽永州</p>
                <div class="picScroll-left">
                    <div class="hd">
                        <a class="next"><</a>
                        <a class="prev">></a>
                    </div>
                    <div class="bd">
                        <ul class="picList">
                            <c:forEach items="${slideshowList}" var="slideshow">
                                <c:if test="${slideshow.imageTypes == 2}">
                                    <li><div class="pic"><img src="<%=basePath%>/${slideshow.imageName}" width="231" height="151" /></div></li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
        		<!--为秀丽永州模块图片向左滚到-->
                <script type="text/javascript">
                jQuery(".picScroll-left").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"left",autoPlay:true,vis:4,trigger:"click"});
                </script>
            </div>
		</div>
		<!--content 结束-->
    <%--登录框--%>
    <div id="container">
        <div style="width: 600px;height: 40px;"><label style="float: right;font-size: 30px;background-color: #FFFFFF;text-align: center;color: #99a2aa;font-weight: 100;margin-right: 10px" onclick="Closed()">×</label></div>
        <div style="width: 600px;height: 50px;text-align: center;"><label style="font-size: 20px" onclick="showlogin()">用户登录</label> &nbsp;&nbsp; <label style="font-size: 20px" onclick="showRegister()">用户注册</label></div>
        <div style="width: 380px;height: 83px;border: #e7e7e7 1px solid;border-radius: 10px;margin-left: 110px;margin-top: 10px">
            <div id="login">
                <div style="width: 380px;height: 30px;text-align: center;padding-top: 5px">
                    <span style="width: 50px;height: 35px;display: inline-block;"><label style="font-size: 13px;">用户名 </label></span>
                    <input type="text" style="height: 35px;width: 250px;outline: none;border: 0" placeholder="请输入用户名" id="loginUserName">
                </div>
                <hr style="height: 1px;width: 380px;background:#e7e7e7;border: 0">
                <div style="width: 310px;height: 30px;text-align: center;">
                    <span style="width: 50px;height: 30px;display: inline-block;"><label style="font-size: 13px;">密 码 </label></span>
                    <input type="password" style="height: 30px;width: 185px;outline: none;border: 0" placeholder="请输入密码" id="loginPassword">
                </div>
                <div style="width: 380px;height: 35px;margin-top: 20px">
                    <span><button class="btn2" onclick="showRegister()">注册</button></span>
                    &nbsp;&nbsp;&nbsp;
                    <span><button  class="btn3" onclick="login()">登录</button></span>
                </div>
            </div>
            <div id="register" style="display: none">
                <div style="width: 380px;height: 30px;text-align: center;padding-top: 5px">
                    <span style="width: 50px;height: 35px;display: inline-block;"><label style="font-size: 13px;">用户名 </label></span>
                    <input type="text" style="height: 35px;width: 250px;outline: none;border: 0" placeholder="请输入用户名" id="RegUserName">
                </div>
                <hr style="height: 1px;width: 380px;background:#e7e7e7;border: 0">
                <div style="width: 310px;height: 30px;text-align: center;">
                    <span style="width: 50px;height: 30px;display: inline-block;"><label style="font-size: 13px;">密 码 </label></span>
                    <input type="password" style="height: 30px;width: 185px;outline: none;border: 0" placeholder="请输入密码" id="RegPassword">
                </div>
                <div style="width: 380px;height: 35px;margin-top: 20px;margin-left: 100px">
                    <span><button class="btn3" onclick="register()">注册</button></span>
                </div>
            </div>
        </div>
    </div>
</div>

<!--footer开始-->
<div class="footer">
	<p><a href="${pageContext.request.contextPath}/showSlideshow">首页</a> | <a href="${pageContext.request.contextPath}/selectHistoryById?id=3">历史</a> | <a href="${pageContext.request.contextPath}/showSceneryList">风景</a> | <a href="${pageContext.request.contextPath}/foodListByType?types=2">美食</a> | <a href="${pageContext.request.contextPath}/selectNewsByNewsTypes?newsTypes=1">动态</a> | <a href="<%=basePath%>/template/leave.jsp">留言</a> | <a href="<%=basePath%>/template/connection.jsp">联系我们</a></p>
    <p>Copyright &copy; 2015－2016 All Rights Reserved 版权所有 XXXXXXXXXXXXXXXXXX</p>
    <p>地址：XXXXXXXXXXXXXXXXXX  来源:<a href="http://down.admin5.com/" target="_blank">A5源码</a> </p>
</div>
<!--footer 结束-->
<%--提示信息--%>
<script src="/admin/assets/js/message.min.js"></script>
<script src="/admin/assets/js/bootbox.min.js"></script>
<script>
    $(function (){
        if(window.history.replaceState){
            window.history.replaceState(null,null,'${pageContext.request.contextPath}/fakeIndex.jsp')
        }
        //登录后显示的页面
        if(${normalUser != null}){
            let headPro = document.getElementById("headPro");
            headPro.onclick = function toUser(){
                window.location.href = '${pageContext.request.contextPath}/norUser/index.jsp'
            };
            headPro.src = "<%=basePath%>/${normalUser.headPro}";
        }
    })

    function showLogin(){
        let con = document.getElementById("container");
        let hidebg = document.getElementById("hidebg");
        console.log(hidebg);
        con.style.display = "block";
        hidebg.style.display = "block";
        if(document.body.clientHeight > document.body.scrollHeight){
            hidebg.style.height = document.body.clientHeight + "px";
        }else {
            hidebg.style.height = document.body.scrollHeight + "px";
        }
    }

    function Closed(){
        let con = document.getElementById("container");
        let hidebg = document.getElementById("hidebg");
        console.log(con);
        con.style.display = "none";
        hidebg.style.display = "none";
    }

    function login(){
        let userName = document.getElementById("loginUserName").value;
        let password = document.getElementById("loginPassword").value;
        let data = {"userName":userName,"password":password};
        $.ajax({
            dataType:"json",
            url:"${pageContext.request.contextPath}/userLogin",
            data:data,
            type:"post",
            success:function (data) {
                console.log(data);
                if(data !== false){
                    //关闭登录框
                    window.location.reload();
                }else {
                    Qmsg.error("用户名或密码错误");
                }
            }
        })
    }

    function register(){
        let userName = document.getElementById("RegUserName").value;
        let password = document.getElementById("RegPassword").value;
        let data = {"userName":userName,"password":password};
        $.ajax({
            dataType:"json",
            url:"${pageContext.request.contextPath}/userReg",
            data:data,
            type:"post",
            success:function (data) {
                console.log(data);
                if(data !== false){
                    //关闭注册
                    showlogin();
                }else {
                    Qmsg.error("该用户名已存在");
                }
            }
        })
    }

    function showlogin(){
        let login = document.getElementById("login");
        let register = document.getElementById("register");
        login.style.display = "";
        register.style.display = "none";
    }
    function showRegister(){
        let login = document.getElementById("login");
        let register = document.getElementById("register");
        login.style.display = "none";
        register.style.display = "";
    }
</script>
</body>

</html>

