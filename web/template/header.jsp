<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <title>Title</title>
    <meta content="潇湘之地-永州" name="keywords" />
    <meta content="潇湘之地-永州" name="description" />
    <link href="<%=basePath%>/css/base.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>/css/pagename.css" rel="stylesheet" type="text/css"/>
    <%--提示框--%>
    <link rel="stylesheet" href="<%=basePath%>/admin/assets/css/message.css"/>
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
<div class="header">
    <div class="w1000">
        <p>你好，欢迎光临潇湘之地永州！</p>
        <div class="contact"><a href="../index.jsp">设为首页</a> <a href="../index.jsp">加入收藏</a></div>
    </div>
</div>
<div class="w1000">
    <div class="header_bottom">
        <a href="../index.jsp"><img src="<%=basePath%>/images/logo.jpg" width="294" height="49" alt="" title="潇湘之地-永州"></a>
        <ul>
            <li><a href="<%=basePath%>/index.jsp">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/selectHistoryById?id=3">历史</a></li>
            <li><a href="${pageContext.request.contextPath}/showSceneryList">风景</a></li>
            <li><a href="${pageContext.request.contextPath}/foodListByType?types=2">美食</a></li>
            <li><a href="${pageContext.request.contextPath}/selectNewsByNewsTypes?newsTypes=1">动态</a></li>
            <li><a href="<%=basePath%>/template/leave.jsp">留言</a></li>
            <li><a href="<%=basePath%>/template/about.jsp">团队介绍</a></li>
            <li><a href="<%=basePath%>/template/connection.jsp">联系我们</a></li>
        </ul>
        <img src="<%=basePath%>/images/loginLogo.png" style="padding-left:130px;height: 50px;width: 55px;border-radius: 100%" onclick="showLogin()" id="headPro">
    </div>
    <%--登录框--%>
    <div id="container">
        <div style="width: 600px;height: 40px;"><label style="float: right;font-size: 30px;background-color: #FFFFFF;text-align: center;color: #99a2aa;font-weight: 100;margin-right: 10px" onclick="Closed()">×</label></div>
        <div style="width: 600px;height: 50px;text-align: center;"><label style="font-size: 38px">用户登录</label></div>
        <div style="width: 380px;height: 83px;border: #e7e7e7 1px solid;border-radius: 10px;margin-left: 110px;margin-top: 10px">
            <div style="width: 380px;height: 30px;text-align: center;padding-top: 5px">
                <span style="width: 50px;height: 35px;display: inline-block;"><label style="font-size: 13px;">用户名 </label></span>
                <input type="text" style="height: 35px;width: 250px;outline: none;border: 0" placeholder="请输入用户名" id="userName">
            </div>
            <hr style="height: 1px;width: 380px;background:#e7e7e7;border: 0">
            <div style="width: 380px;height: 30px;text-align: center;">
                <span style="width: 50px;height: 30px;display: inline-block;"><label style="font-size: 13px;">密码 </label></span>
                <input type="password" style="height: 30px;width: 185px;outline: none;border: 0" placeholder="请输入密码" id="password">
                <label style="color: #17a9da">忘记密码？</label>
            </div>
            <div style="width: 380px;height: 35px;margin-top: 20px">
                <span><button class="btn2">注册</button></span>
                &nbsp;&nbsp;&nbsp;
                <span><button  class="btn3" onclick="login()">登录</button></span>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.SuperSlide.2.1.js"></script>
<%--提示信息--%>
<script src="<%=basePath%>/admin/assets/js/message.min.js"></script>
<script src="<%=basePath%>/admin/assets/js/bootbox.min.js"></script>
<script>
    $(function (){
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
        let userName = document.getElementById("userName").value;
        let password = document.getElementById("password").value;
        let data = {"userName":userName,"password":password};
        $.ajax({
            dataType:"json",
            url:"${pageContext.request.contextPath}/userLogin",
            data:data,
            type:"post",
            success:function (data) {
                console.log(data);
                if(data !== false){
                    window.location.reload();
                }else {
                    Qmsg.error("用户名或密码错误");
                }
            }
        })
    }
</script>
</body>
</html>
