<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.data_JavaBean.trolley" %>
<%@ page import="DAO.Service_JavaBean.trolley_impl" %>
<%@ page import="DAO.data_JavaBean.trolley" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>购物车</title>

    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <!-- css部分 -->
    <link rel="stylesheet" href="layui/css/layui.css">
    <link href="css/showsuper.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/trolley.css">
    <!-- js部分 -->
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/IndexEsuper.js"></script>
    <script src="layer/layer.js"></script>
    <script src="layui/layui.js" charset="utf-8"></script>
    <script src="js/trolley.js" charset="UTF-8"></script>
</head>
<body>
<div class="clear"></div>

<%--此处的div标签用于获取请求域中的书本编号--%>


<!-- 顶部区 -->
<nav>
    <div class="nav">
        <img src="images/logo.png" alt="">
        <div>
            <a href="IndexEsuper.jsp">首页</a>
            <a href="commodity.jsp">商品</a>
            <a href="comment.jsp">广场</a>
            <a href="trolley.jsp" id="buycar">购物车</a>
            <a href="orders.jsp">订单</a>
        </div>
    </div>

    <ul class="profile">
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
<img src="images/banner.jpg" alt="" class="logo2">
<!-- 已选商品区-->
<div class="trolley" >
    <div class="trolleyHead">
        <div class="bookInfo">
            <div>商品信息</div>
        </div>
        <div class="bookPrice">
            <div>单价</div>
        </div>
        <div class="bookNum">
            <div>数量</div>
        </div>
        <div class="bookOperation">
            <div>操作</div>
        </div>
    </div>

    <%
        trolley_impl trolley = new trolley_impl();
        String sno = String.valueOf(session.getAttribute("sno"));
        String name = request.getParameter("name");
        String sql;
        if(name==null){
            sql="select * from trolleyinfor where sno="+sno;
        }else{
            sql="select * from trolleyinfor where depiction like '%" + name +"%'";
        }
        List<trolley> lst = trolley.getTrolley(sql);
        request.setAttribute("trolleyList",lst);
    %>
    <h1 id="empty" style="margin-top: 70px">购物车空空如也</h1>
    <c:forEach items="${trolleyList}" var="trolley">

        <div class="supplier" id="suppliers">

            <div class="supplierBooks" >
                <div class="supplierBookImage">
                    <img src="${trolley.book_pic}" alt="">
                </div>
                <div class="supplierBookDescription">
                        ${trolley.depiction}
                </div>
                <div class="supplierBookPrice">
                    ￥<sapn>${trolley.sum_price}</sapn>

                </div>
                <div class="supplierBookNum">
                        ${trolley.bookNum}
                </div>
                <div class="bookDelete">
                    <a href="DeltroServlet?sno=${trolley.sno}&depiction=${trolley.depiction}"
                       class="del" onclick="return decide()">删除</a>
                    <a class="tobuy" href="troTobuyServlet?username=${username}&identifier=${trolley.identifier}&quantity=${trolley.bookNum}&order_price=${trolley.sum_price}&sno=${trolley.sno}&depiction=${trolley.depiction}"
                    onclick="return checkbuy()">结算</a>
                </div>
            </div>
        </div>
    </c:forEach>

</div>
</body>
</html>

