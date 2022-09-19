<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="footer">
        <p><a href="${pageContext.request.contextPath}/showSlideshow">首页</a> | <a href="${pageContext.request.contextPath}/selectHistoryById?id=3">历史</a> | <a href="${pageContext.request.contextPath}/showSceneryList">风景</a> | <a href="${pageContext.request.contextPath}/foodListByType?types=2">美食</a> | <a href="${pageContext.request.contextPath}/selectNewsByNewsTypes?newsTypes=1">动态</a> | <a href="<%=basePath%>/template/leave.jsp">留言</a> | <a href="<%=basePath%>/template/connection.jsp">联系我们</a></p>
        <p>Copyright &copy; 2015－2016 All Rights Reserved 版权所有 XXXXXXXXXXXXXXXXXX</p>
        <p>地址：XXXXXXXXXXXXXXXXXX  来源:<a href="http://down.admin5.com/" target="_blank">A5源码</a> </p>
    </div>
</body>
</html>
