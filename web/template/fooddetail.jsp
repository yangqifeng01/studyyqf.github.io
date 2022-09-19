<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <title>Title</title>
    <style>
        body,
        html {
            width: 100%;
            height: 100%;
        }

        .like-1 {
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image: url(<%=basePath%>/images/good.png);
            background-size: 100%;
        }

        .like-1:hover {
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image: url(<%=basePath%>/images/gooding.png);
        }

        .like-2 {
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image: url(<%=basePath%>/images/gooded.png);
            background-size: 100%;
        }

        .dislike-1{
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image: url(<%=basePath%>/images/dislike.png);
            background-size: 100%;
        }

        .dislike-1:hover {
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image: url(<%=basePath%>/images/disliking.png);
        }

        .dislike-2{
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image: url(<%=basePath%>/images/disliked.png);
            background-size: 100%;
        }
        .btn1{
            width: 40px;
            height: 25px;
            background-color: #00a1d6;
            color: #ffffff;
            border-radius: 3px;
            border: #00a1d6;
            line-height: 25px;
            text-align: center
        }
        .btn1:hover{
            width: 40px;
            height: 25px;
            background-color: #00b5e5;
            color: #ffffff;
            border-radius: 3px;
            border: #00a1d6;
            line-height: 25px;
            text-align: center;
        }
        .txt{
            width: 500px;
            height: 80px;
            background-color: #e5e9ef;
            border-radius: 8px;
            border-color: #e5e9ef;
            padding-top: 5px;
            padding-left: 10px;
            padding-right: 15px;
            outline: #00a1d6 none;
        }

        .txt:hover{
            width: 500px;
            height: 80px;
            background-color: #FFFFFF;
            border-radius: 8px;
            border-color: #00a1d6;
            padding-top: 5px;
            padding-left: 10px;
            padding-right: 15px;
            outline: #00a1d6 none;
        }

        #container{
            position: fixed;
            width: 600px;
            height: 300px;
            left: 50%;
            top: 50%;
            margin: -150px 0 0 -300px;
            border: 1px solid #91A7E3;
            background-color: #fff;
            border-radius: 8px;
            display: none;
            overflow: hidden;
        }

        .btn2{
            width: 180px;
            height: 35px;
            background-color: #FFFFFF;
            border:#e7e7e7 1px solid;
            border-radius: 5px;
        }

        .btn2:hover{
            width: 180px;
            height: 35px;
            background-color: #FFFFFF;
            border:#17a9da 1px solid;
            border-radius: 5px;
            color: #17a9da;
        }

        .btn3{
            width: 180px;
            height: 35px;
            background-color: #17a9da;
            border:#17a9da 1px solid;
            border-radius: 5px;
            color: #FFFFFF;
        }

        .btn3:hover{
            width: 180px;
            height: 35px;
            background-color: #33b4de;
            border:#17a9da 1px solid;
            border-radius: 5px;
        }

        #hidebg {
            position: absolute;
            width: 100%;
            height: 100%;
            background: #000;
            opacity: 0.5;
            filter: alpha(opacity=50);
            display: none;
        }

        #unPutComment{
            width: 80px;
            height: 80px;
            border-radius: 8px;
            text-align: center;
            font-size: 20px;
            padding: 12px;
            background-color: #e5e9ef;
            border: #e5e9ef;
            color: #bcc0cc;
        }

        #putComment{
            width: 80px;
            height: 80px;
            border-radius: 8px;
            text-align: center;
            font-size: 20px;
            padding: 12px;
            background-color: #00a1d6;
            border: #00a1d6;
            color: #FFFFFF;
            display: none;
        }

        #putComment:hover{
            width: 80px;
            height: 80px;
            border-radius: 8px;
            text-align: center;
            font-size: 20px;
            padding: 12px;
            background-color: #00b5e5;
            border: #00b5e5;
            color: #FFFFFF;
        }
    </style>
</head>
<body>
    <!--header-->
    <jsp:include page="header.jsp"/>
    <!--header结束-->
    <%--pagebody--%>
    <div style="width: 1000px;margin-left: 125px;">
        <div align="center" style="margin: 10px"><label style="font-size: 300%;color: red;">${food.foodName}</label></div>
        <p align="center"><img src="<%=basePath%>/${food.foodImage}" alt="${food.foodName}" style="color: rgb(0, 0, 153); text-decoration-line: none;height: 200px;width: 400px"></p>
        <div>${food.foodContent}</div>
        <p style="margin: 2px; font-size: 14px; line-height: 25.2px; text-indent: 25px; font-family: 宋体; white-space: normal; background-color: rgb(255, 255, 255);">地址：${food.foodAddress}</p>
        <p style="margin: 2px; font-size: 14px; line-height: 25.2px; text-indent: 25px; font-family: 宋体; white-space: normal; background-color: rgb(255, 255, 255);">价格：${food.foodPrice}</p>
    </div>
    <hr style="width: 1000px;margin-left: 125px;height:1px;background: #e5e9ef;border: 0">
    <div style="margin-left: 125px;height: 40px;margin-top: 25px">
        <label style="font-size: 20px;color: #222222" id="count">0</label><label style="font-size: 20px;color: #222222">&nbsp;&nbsp;评论</label>
    </div>
    <hr style="width: 1000px;margin-left: 125px;height:1px;background: #ededed;border: 0">

    <div>
        <div style="margin-left: 125px;height: 100px;width: 100px;float:left;padding-top: 40px;text-align: center;">
            <img src="<%=basePath%>/images/greyhead.png" style="width: 50px;height: 50px;border-radius: 100%" id="img2">
        </div>
        <div style="float:left;width:520px;height: 100px;padding-top: 35px;">
            <textarea class="txt" placeholder="发一条友善的评论" style="display: none" id="commentArea"></textarea>
            <span style="width: 500px;height: 80px;background-color: #e5e9ef;border: #e5e9ef;border-radius: 8px;display: inline-block;line-height: 80px;text-align: center;" id="notComment">
                请先
                <button class="btn1" id="login" onclick="showLogin()">登录</button>
                后再发表评论哦！
            </span>
        </div>
        <div style="float:left;width:80px;height: 100px;padding-top: 35px;">
            <button id="unPutComment">发表评论</button>
            <button id="putComment" onclick="putComment()">发表评论</button>
        </div>
    </div>

    <div id="comment"></div>

    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.6.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/jquery.SuperSlide.2.1.js"></script>
    <script>
        $(function (){
                if(${normalUser != null}){
                    let img2 = document.getElementById("img2");
                    let commentArea = document.getElementById("commentArea");
                    let notComment = document.getElementById("notComment");
                    let unPutComment = document.getElementById("unPutComment");
                    let putComment = document.getElementById("putComment");
                    img2.src = "<%=basePath%>/${normalUser.headPro}";
                    commentArea.style.display = "";
                    notComment.style.display = "none";
                    unPutComment.style.display = "none";
                    putComment.style.display = "block";
                }
            },
            $.ajax({
                dataType:"json",
                url:"${pageContext.request.contextPath}/selectCommentByIdAndType",
                data:{"aboutName":'${food.foodName}',"type":2},
                type: "post",
                success:function (data) {
                    let comment = $("#comment")[0];
                    console.log(data);
                    if(data != null){
                        let count = $("#count");
                        count.html(data.length);
                        for(let i=0;i<data.length;i++){
                            let div = document.createElement("div");
                            div.innerHTML = "<hr style=\"width: 600px;margin-left: 225px;height: 1px;margin-top:10px;margin-bottom:12px;background: #ededed;border: 0\">"+
                                "<div style=\"margin-left:125px;height: 60px;width: 100px;float:left;text-align: center;padding-top:15px;\">"+
                                "    <img src=\"<%=basePath%>/"+data[i].user.headPro+"\" style=\"width: 50px;height: 50px;border-radius: 100%\">"+
                                "</div>"   +
                                "<div style=\"float: left;width: 600px;height: 80px;margin-top: 5px;\">"+
                                "   <span style=\"display:block;margin: 10px 0\">"+
                                "       <label style=\"color: #6d757a;font-family: 黑体,serif;font-size: 110%\">"+data[i].user.userName+"</label>"+
                                "   </span>"+
                                "   <span style=\"display: block;margin-top: 5px\">"+
                                "       <label style=\"font-family: 'Microsoft YaHei UI',serif;\">"+data[i].commentContent+"</label>"+
                                "   </span>"+
                                "   <span style=\"display: block;margin: 5px 0;\">"+
                                "       <span style=\"display: inline-block;float: left\"><label style=\"font-size: 8px;color:#99a2aa;\">"+data[i].adddate+"</label></span>"+
                                "       <span class=\"like-1\" style=\"margin-left: 20px;float: left\" onclick=\"good(this,"+data[i].commentId+")\"></span>"+
                                "       <span style=\"display: inline-block;color:#99a2aa;float: left\">"+data[i].goodCount+"</span>"+
                                "       <span class=\"dislike-1\" style=\"margin-left: 20px;float: left\" onclick=\"bad(this)\"></span>"+
                                "   </span>"+
                                "</div>";
                            comment.appendChild(div);
                        }
                    }
                    let div = document.createElement("div");
                    div.innerHTML = "<hr style=\"width: 600px;margin-left: 225px;height: 1px;margin-top:10px;margin-bottom:20px;background: #ededed;border: 0\">"+
                        "               <div style=\"margin-left:125px;height: 70px;width: 700px;padding-top:20px;\" align=\"center\">"+
                        "                   <label style=\"color: #99a2bd\">没有更多评论</label>"+
                        "               </div>"
                    comment.appendChild(div);
                }
            })
        )

        function good(obj,commentId) {
            console.log(obj);
            obj.classList.remove('like-1');
            obj.classList.add('like-2');
        }

        function bad(obj,commentId) {
            obj.classList.remove('dislike-1');
            obj.classList.add('dislike-2');
        }

        function getQueryString(name) {
            let reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
            let r = decodeURI(window.location.search).substr(1).match(reg);
            console.log(r);
            if(r!=null){
                return r[2];
            }else{
                return null;
            }
        }

        function putComment(){
            let commentContent = $("#commentArea").val();
            if(commentContent === ''){
                Qmsg.info("请输入评论内容");
            }else {
                let data = {"commentContent":commentContent,"userId":"${normalUser.userId}",
                    "aboutName":'${food.foodName}',"type":2};
                $.ajax({
                    dataType: "json",
                    url: "${pageContext.request.contextPath}/addComment",
                    data:data,
                    type:"post",
                    success:function (msg) {
                        console.log(msg);
                        if(msg === true){
                            window.location.reload();
                        }else {
                            Qmsg.error("发表评论失败");
                        }
                    }
                })
            }
        }

    </script>
</body>
</html>
