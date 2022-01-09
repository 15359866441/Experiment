<%@ page import="DAO.Service_JavaBean.articles_impl" %>
<%@ page import="DAO.data_JavaBean.articles" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>二手书城-广场</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <link href="css/comment.css" rel="stylesheet" >
    <script src="js/comment.js"></script>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="layer/layer.js"></script>

</head>
<body>
<div id="name" style="display: none">${username}</div>
<div id="profile_pic" style="display: none">${profile_pic}</div>
<%--顶部区域start--%>
<nav>
    <div class="nav">
        <img src="images/logo.png" alt="">
        <div>
            <a href="IndexEsuper.jsp" target="_blank">首页</a>
            <a href="commodity.jsp" target="_blank">商品</a>
            <a href="trolley.jsp">购物车</a>
            <a href="orders.jsp">订单</a>
            <a href="LoginE.jsp" id="log">登录</a>
            <a href="Register.jsp" id="reg">注册</a>
        </div>
    </div>

    <ul class="profile" id="profile">
        <li>
            <p id="username">${username}</p>
        </li>
        <li class="profile-select">
            <a class="profile-list" href="#"><img src="${profile_pic}" alt=""></a>
            <div class="triangle">
                <div class="profile-sub-list">
                    <ul>
                        <li>
                            <a href="javascript:;">个人主页</a>
                        </li>
                        <li>
                            <%--此处href设置为javascript:;否则用户判断是否退出时选择取消后会刷新一遍网页--%>
                            <a href="javascript:;" onclick="checkout()" id="checkout">退出登录</a>
                        </li>
                    </ul>
                </div>
            </div>
        </li>
    </ul>

</nav>
<%--顶部区域end--%>

<%--帖子搜索框start--%>
<div class="search_dynamic">
    <form action="comment.jsp">
        <input style="outline: 0;caret-color: red;" type="text" placeholder="输入动态关键词" name="content">
        <button type="submit">搜</button>
    </form>
</div>
<%--帖子搜索框end--%>

<%--动态发表区start--%>
<div id="comment" class="send_message">
    <div class="inside">
        <textarea style="margin-top: 30px" id="textarea1" class="textarea1" placeholder="有什么新鲜事想分享给大家？"></textarea>
        <button type="button" onclick="send_dynamic()">发送</button>
    </div>
</div>
<%--动态发表区end--%>

<%--动态区start--%>
<%
    articles_impl article = new articles_impl();
    String content = request.getParameter("content");
    String sql = null;
    if (content == null) {
        sql = "select * from articles order by c_time desc";
    } else {
        sql = "select * from articles where content like '%" + content + "%' order by c_time desc";
    }
    List<articles> lst = article.getarticles(sql);
    request.setAttribute("articleLst", lst);
%>

<h1 style="text-align: center" id="empty">暂无动态！</h1>

<script>
    function checkedEmpty() {
        var content = document.getElementById("textarea2").value;
        var empty = document.getElementById("empty");
        if(content != ""){
            empty.style.display = "none";
        }
    }
    window.onload= function (){
        checkedEmpty();
        checkuser();
    }

    function checkuser(){

        var username = document.getElementById("name").innerHTML;
        var profile = document.getElementById("profile");
        var log = document.getElementById("log");
        var reg = document.getElementById("reg");
        // alert("username的值："+username);
        if (username==""){
            profile.style.display="none";
        }
        else{
            log.style.display="none";
            reg.style.display="none";
        }
    }
</script>

<div id="container">
    <c:forEach items="${articleLst}" var="article">
        <div id="content1">
            <div class="list">
                <ul >
                    <li>
                        <div class="other-user">
                            <img src="${article.profile_pic}" class="other-head">
                            <p class="other-name">${article.name}</p><br /><br />
                            <p class="other-name">${article.c_time}</p>
                            <textarea  id="textarea2" class="textarea2" readonly>${article.content}</textarea>
                            <script>
                                var text = document.getElementById("textarea2");
                                autoTextarea(text);// 调用
                            </script>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </c:forEach>
</div>
<%--动态区end--%>
</body>
</html>
