<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="DAO.Service_JavaBean.bookinfor_impl" %>
<%@ page import="DAO.data_JavaBean.bookinfor" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>二手书城-商品</title>
    <link rel="stylesheet" href="css/commodity.css">
    <script src="js/commodity.js"></script>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="layer/layer.js"></script>
</head>

<body>
    <nav>
        <div class="nav_top">
            <div class="nav_top">
                <ul class="profile" id="profile">
                    <li>
                        <span id="username">${username}</span>
                    </li>
                    <li class="profile-select">
                        <div class="triangle">
                            <div class="profile-sub-list">
                                <ul>
                                    <li>
                                        <a href="#">个人主页</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;" onclick="checkout()">退出登录</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            <div class="nav_box">
                <a href="LoginE.jsp" id="log">登陆</a>
                <a href="Register.jsp" id="reg">免费注册</a>
                <a href="IndexEsuper.jsp">首页</a>
                <a href="comment.jsp">广场</a>
                <a href="trolley.jsp" onclick="return islog()">购物车</a>
                <a href="orders.jsp" onclick="return islog()">订单</a>

            </div>
        </div>
        <div class="nav_bottom">
            <img src="images/logo.png" alt="">
            <img src="images/nav_text.png" alt="">
            <form action="commodity.jsp">
                <input type="text" placeholder="搜索书目" name="name">
                <button type="submit">搜索</button>
            </form>
        </div>
    </nav>
    <div class="ban">
        <img src="images/ban.png" alt="">
    </div>
    <main>
        <%-- 最新区域  --%>
        <div class="new_title">全部商品</div>
        <section class="new_box">
            <%
                String pointname = request.getParameter("pointname");
                bookinfor_impl book = new bookinfor_impl();
                String name = request.getParameter("name");
                String sql = null;
                if (name == null && pointname==null) {
                    sql = "select * from bookinfor where quantity>0 and status=1";
                } else if(name == null && pointname!=null){
                    sql = "select * from bookinfor where kinds='"+pointname+"' and quantity>0 and status=1";
                }
//                else if (name!=null && pointname!=null){
//                    sql = "select * from bookinfor where quantity>0 and status=1 and depiction like '%" + name + "%' and kinds='"+pointname+"'";
//                }
//              最后一种情况是name不为空，pointname为空
                else {
                    sql = "select * from bookinfor where quantity>0 and status=1 and depiction like '%" + name + "%'";
                }
                List<bookinfor> lst = book.getboooks(sql);
                request.setAttribute("bookLst", lst);
            %>

            <c:forEach items="${bookLst}" var="book">
                <%-- 内层边框 --%>
                <div class="card">
                    <!-- 内层变框 -->
                    <div class="card_box">
                        <a href="showdetail.jsp?depiction=${book.depiction}&book_pic=${book.book_pic}
&new_price=${book.new_price}&quantity=${book.quantity}&identifier=${book.identifier}" ><img src="${book.book_pic}" alt=""></a>
                        <a href="showdetail.jsp?depiction=${book.depiction}&book_pic=${book.book_pic}
&new_price=${book.new_price}&quantity=${book.quantity}&identifier=${book.identifier}" class="desc">${book.depiction}</a>
                        <div class="new_price">￥${book.new_price}</div>
                        <div class="old_price"><del>￥${book.old_price}</del></div>
                        <div class="mon_sell">月销&nbsp;${book.mon_sell}</div>
                    </div>
                </div>
            </c:forEach>
        </section>

    </main>
</body>

</html>