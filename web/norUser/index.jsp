<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>

        .isa{
            font-size: 16px;
            color: #000000;
        }

        isa:hover{
            color: #0f8f38;
        }

        .isul {
            width: 100%;
            height: 100%;
            list-style: none;
            justify-content: space-around;
            align-items: center;
            box-sizing: border-box;
        }

        .isli {
            position: relative;
            padding: 20px;
            box-sizing: border-box;
            width: 280px;
            height: 50px;
        }

        .isli::after {
            content: "";
            width: 2px;
            height: 0;
            background: #0f8f38;
            position: absolute;
            left: 0;
            top: 50%;
            transition: all 0.5s;
        }

        .isli:hover::after {
            top: 10%;
            height: 80%;
        }

        .isa2{
            font-size: 14px;
            color: #6d757a;
        }

        .isul2 {
            margin-top: 10px;
            margin-left: 10px;
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            list-style: none;
        }

        .isli2 {
            position: relative;
            padding: 10px;
            box-sizing: border-box;
            width: 80px;
            height: 50px;
            display: inline;
        }


        .isli2::after {
            content: "";
            width: 0;
            height: 2px;
            background: #0f8f38;
            position: absolute;
            left: 50%;
            top: 100%;
            transition: all 0.5s;

        }

        .isli2:hover::after {
            left: 10%;
            width: 80%;
        }

        .btn1{
            height: 40px;
            width: 180px;
            line-height: 40px;
            background-color: #1d953f;
            color: #FFFFFF;
            border-radius: 5px;
            border: 1px solid #1d953f
        }

        .btn1:hover{
            height: 40px;
            width: 180px;
            line-height: 40px;
            background-color: #1d9561;
            color: #FFFFFF;
            border-radius: 5px;
            border: 1px solid #1d9561
        }

        .btn4{
            height: 40px;
            width: 180px;
            line-height: 40px;
            background-color: #ededed;
            border-radius: 5px;
            border: 1px solid #ebf3ee;
        }

        .btn4:hover{
            height: 40px;
            width: 180px;
            line-height: 40px;
            background-color: #f1f6f8;
            border-radius: 5px;
            border: 1px solid #f1f6f8;
        }

        .in{
            height: 30px;
            width: 230px;
            border:#e5e9ef 1px solid ;
            padding: 10px;
            outline: #00a1d6 none;
            border-radius: 5px;
        }
        .in:hover{
            border:#8694a7 1px solid ;
        }
        .in:focus{
            border:#00a1d6 1px solid ;
        }

        input[type="radio"]{
            vertical-align:middle;
            margin-bottom:2px;
            *margin-bottom:2px;
            margin-left: 10px;
        }

    </style>

</head>
<body>
<!--header-->
<jsp:include page="../template/header.jsp"/>
<!--header结束-->
    <div style="width: 100%;height: 800px;background-color: #ebf3ee">
        <div style="margin-left: 150px;">
            <div style="margin-top: 20px;float: left;width: 260px;height:400px;">
                <div style="width: 260px;height: 240px;background-color: #FFFFFF;border: 1px solid #FFFFFF;border-radius: 8px">
                    <div style="width: 260px;height: 100px;padding-top: 15px;text-align: center"><img src="" style="width: 60px;height: 55px;margin-top: 20px" id="headPic">
                        <div style="width: 260px;height: 40px;text-align: center"><label style="font-size: 120%;line-height: 40px" id="name"></label></div>
                    </div>
                    <div style="width: 260px;height: 100px;text-align: center;margin-top: 10px">
                        <button class="btn1" onclick="showDetail()">个人资料</button>
                        <button style="margin: 10px 0;" class="btn4" onclick="userExit();">退出登录</button>
                    </div>
                </div>
                <div style="width: 100%;height: 200px;background-color: #FFFFFF;border: 1px solid #FFFFFF;border-radius: 8px;margin-top: 10px;">
                    <ul class="isul">
                        <li class="isli"><a class="isa"> 我的消息</a></li>
                        <li class="isli" onclick="myComment()"><a class="isa"> 我的评论</a></li>
                        <li class="isli" onclick="showDetail()"><a class="isa"> 个人资料</a></li>
                        <li class="isli"><a class="isa"> 其他</a></li>
                    </ul>
                </div>
            </div>

            <div style="float:left;width: 700px;height:700px;margin-top: 20px;margin-left: 20px;background-color: #FFFFFF;border: 1px solid #FFFFFF;border-radius: 8px;">
                <div style="width: 100%;height: 22px;">
                    <ul class="isul2">
                        <li class="isli2"><a class="isa2"> 我的消息</a></li>
                        <li class="isli2" onclick="myComment()"><a class="isa2"> 我的评论</a></li>
                        <li class="isli2" onclick="showDetail()"><a class="isa2"> 个人资料</a></li>
                        <li class="isli2"><a class="isa2"> 其他</a></li>
                    </ul>
                    <hr style="height: 1px;width: 700px;border: 0;background-color: #e5e9ef">
                </div>

                <div id="advisor" style="display: none"></div>

                <div style="width: 700px;height: 600px;" id="detail">
                    <form action="${pageContext.request.contextPath}/admin/updateUser" enctype="multipart/form-data" method="post">
                        <input type="text" name="userId" id="userId" value="${normalUser.userId}" hidden/>
                        <div style="width: 700px;height: 90px;padding-top: 10px;text-align:center;margin-top: 10px">
                            <div class="clearfix">
                                <img id="img" src="<%=basePath%>/${normalUser.headPro}" height="80px" width="80px" alt="${normalUser.userName}" style="border: #00a0e9 1px solid;border-radius: 100%">
                            </div>
                            <div class="clearfix" style="margin-top: 10px">
                                <label class="btn3" style="margin-left: 262px;padding: 5px 20px" for="multipartFile">更换头像</label>
                                <input type="file" name="multipartFile" id="multipartFile" style="opacity: 0;"/>
                            </div>
                        </div>
                        <hr style="height: 1px;width: 660px;border: 0;background-color: #e5e9ef;margin-top: 40px;margin-left: 20px">
                        <div style="width: 700px;height: 30px;padding-top: 10px;margin-top: 20px">
                            <span style="display: block;margin-left: 80px"><label style="font-size: 14px;margin-right: 20px;font-weight: normal">用户名:</label><input type="text" value="${normalUser.userName}" class="in" name="userName" ></span>
                        </div>
                        <div style="width: 700px;height: 30px;padding-top: 10px;margin-top: 20px">
                            <span style="display: block;margin-left: 95px"><label style="font-size: 14px;margin-right: 20px;font-weight: normal">密码:</label><input type="text" value="${normalUser.password}" class="in" name="password"></span>
                        </div>
                        <div style="width: 700px;height: 30px;padding-top: 10px;margin-top: 20px">
                            <span style="display: block;margin-left: 95px"><label style="font-size: 14px;margin-right: 20px;font-weight: normal">邮箱:</label><input type="email" value="${normalUser.email}" class="in" name="email"></span>
                        </div>
                        <div style="width: 700px;height: 30px;padding-top: 10px;margin-top: 20px">
                            <span style="display: block;margin-left: 95px">
                                <label style="font-size: 14px;margin-right: 20px;font-weight: normal">性别:</label>
                                <label for="nan">男</label><input type="radio"  id="nan" name="sex" value="1" ${(1 eq normalUser.sex)?"checked":"" }>
                                <label for="nv" style="margin-left: 20px">女</label><input type="radio" id="nv" name="sex" value="2" ${(2 eq normalUser.sex)?"checked":"" }>
                            </span>
                        </div>
                        <hr style="height: 1px;width: 660px;border: 0;background-color: #e5e9ef;margin-top: 40px;margin-left: 20px">
                        <div style="width: 700px;height: 30px;padding-top: 10px;margin-top: 20px;text-align: center">
                            <button class="btn3" style="margin-top: 10px;width: 100px;height: 40px" type="submit">保存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<!--footer开始-->
<jsp:include page="../template/footer.jsp"/>
<!--footer 结束-->
<script>
    $(
        function (){
        if(${normalUser != null}){
            let name = document.getElementById("name");
            let headPro = document.getElementById("headPic");
            let img = document.getElementById("img");
            name.innerHTML = '${normalUser.userName}';
            headPro.src = "<%=basePath%>/${normalUser.headPro}";
            img.src = "<%=basePath%>/${normalUser.headPro}";
        }

        $("#multipartFile").change(function (){
            let fileObj = $("#multipartFile")[0].files[0];
            let imgName = fileObj.name;
            let reader = new FileReader();
            reader.readAsDataURL(fileObj);
            console.log(imgName);
            $("#imgName").html(imgName);
            reader.onload = function (){
                $("#img").attr("src",reader.result);
            }
        })

        if(window.history.replaceState){
            window.history.replaceState(null, null, "${pageContext.request.contextPath}/norUser/index.jsp")
        }
    });

    function userExit(){
        window.location.href = "${pageContext.request.contextPath}/admin/exit";
    }

    function myComment(){
        let detail = document.getElementById("detail");
        let advisor = document.getElementById("advisor");
        $.ajax({
            dataType:"json",
            url:"${pageContext.request.contextPath}/commentList",
            data:{"userId":'${normalUser.userId}'},
            type:"post",
            success:function (data) {
                advisor.innerHTML = "";
                console.log(data);
                if(data !== null){
                    for(let i=0;i<data.length;i++){
                        let div = document.createElement("div");
                        div.innerHTML = "<div style=\"width: 700px;height: 50px;padding-top: 10px;margin-top: 10px;\">"+
                        "                  <label style=\"font-size: 14px;font-weight: unset;margin-left: 20px;color: #333333\">"+data[i].aboutName+"</label>"+
                        "                   <label style=\"font-size: 12px;font-weight: lighter;margin-left: 15px;color:#9F9F9F;\">"+data[i].adddate+"</label>"+
                        "                   <div style=\"margin-top: 10px\">"+
                        "                   <label style=\"margin-left: 40px;color: #9a9a9a;font-size: 13px\">"+data[i].commentContent+"</label>" +
                        "                   </div></div>"+
                        "<hr style=\"height: 1px;width: 700px;border: 0;background-color: #e5e9ef\">";
                        advisor.appendChild(div);
                    }
                }else {
                    advisor.innerHTML = "<div style=\"width: 700px;height: 100px;padding-top: 10px;margin-top: 10px;text-align: center\">"+
                        "               <label style=\"margin-left: 40px;color: #9a9a9a;font-size: 13px\">暂未发表任何评论</label></div>";
                }
                detail.style.display = "none";
                advisor.style.display = "";
            }
        })
    }

    function showDetail(){
        let detail = document.getElementById("detail");
        let advisor = document.getElementById("advisor");
        advisor.style.display = "none";
        detail.style.display = "";
    }



</script>
</body>
</html>
