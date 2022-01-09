<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>账号登陆</title>
    <link rel="stylesheet" href="css/Login.css">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <%--  引入登录数据的验证 --%>
    <script src="js/Login_verify.js"></script>
    <%-- 引入layui样式 --%>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="layer/layer.js"></script>

</head>

<body>
    <!-- 导航栏界面 -->
    <nav>
        <img src="images/logo.png" alt="">
        <div>二手书城</div>
    </nav>
    <!-- 主体登陆界面 -->
    <main>
        <h1>账号登陆</h1>
        <!-- 默认method="get" -->
        <form action="LoginServlet">
            <input class="inp" type="text" name="username" placeholder="请输入手机号或用户名" autofocus>
            <input class="inp" type="password" name="pwd" placeholder="请输入密码">
            <button type="submit">登陆</button>
        </form>
        <p>还没有账号，<a href="Register.jsp">去注册>></a></p>
    </main>
    <footer>
        <!-- <div class="foot_line"></div> -->
        <p style="text-align: center;" class="padding-top">版权区</p>
    </footer>
</body>

</html>