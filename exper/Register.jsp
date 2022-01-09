<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>账号注册</title>
    <link rel="stylesheet" href="./css/Register.css">
    <link rel="shortcut icon" href="./images/logo.png" type="image/x-icon">
    <%--  引入注册数据的验证  --%>
    <script src="js/Register_v.js"></script>
    <%-- 引入layui样式 --%>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="layer/layer.js"></script>
</head>

<body>
<!-- 导航栏界面 -->
<nav>
    <img src="./images/logo.png" alt="">
    <div>二手书城</div>
</nav>
<!-- 主体界面 -->
<main>
    <h1>账号注册</h1>
    <p>已有账号，<a href="./LoginE.jsp">去登陆>></a></p>
    <form action="RegisterServlet">
        <input class="inp" type="text" name="username" id="userName" placeholder="请输入用户名" autofocus onkeyup="showHint(this.value)">
        <div id="showNameInfo"></div>
        <input class="inp" type="text" name="number" id="phone_num" placeholder="请输入手机号" onblur="checkphone()">
        <div id="phone_tip"></div>
        <input class="inp" type="text" name="sno" id="sno_num" placeholder="请输入学号" onblur="checksno()">
        <div id="sno_tip"></div>
        <input class="inp" type="password" name="pwd" id="pass" placeholder="请设置登陆密码" onkeyup="check()">
        <div id="remind1"></div>
        <input class="inp" type="password" name="password_ch" id="pass_ch" placeholder="请确认密码"  onkeyup="check()">
        <div id="remind2"></div>
        <select name="college" id="college" required>
            <!-- 此处的required和如下的value=""结合能设置下拉框的必选，单独required的没有作用，因为已有值”请选择学院” -->
            <option value="">请选择学院</option>
        </select>
        <select name="major" id="major" required>
            <option value="">请选择班级</option>
        </select>
        <button type="submit">注册</button>
    </form>
</main>
<footer>
    <!-- <div class="foot_line"></div> -->
    <p style="text-align: center;" class="padding-top">版权区</p>
</footer>

</body>

</html>