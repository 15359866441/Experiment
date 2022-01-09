<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/topframe.css">
    <script src="js/topframe.js"></script>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="layer/layer.js"></script>
</head>
<body>
<nav>
    <div>
        <img src="images/logo.png" alt="">
        <img src="images/backstage_pic.png" alt="">
    </div>
    <div class="time">
        <h3>&#x3000;系统当前日期</h3>
        <h3 id="current_date"></h3>
    </div>
    <div class="profile">
        <div class="pro_pic"><img src="images/用户.png" alt=""><span id="username">${username}</span></div>
        <div class="pro_set"><a href="">个人主页</a><a href="javascrip:;" onclick="checkout()">退出</a></div>
    </div>
</nav>
</body>
<script>
    // 判断是否退出
    function checkout(){
        if(confirm("确认退出登录吗？")){
            window.location = "LogoutServlet";
        }
    }
</script>
</html>
