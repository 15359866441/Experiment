<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="DAO.Service_JavaBean.orders_impl" %>
<%@ page import="DAO.data_JavaBean.orders" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>二手书城-订单</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <script src="js/jquery-3.6.0.min.js"></script>
  <script src="layer/layer.js"></script>
  <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
  <link href="css/orders.css" rel="stylesheet">
</head>
<body>
<%--顶部区start--%>
<nav>
  <div class="nav">
    <img src="images/logo.png" alt="">
    <div>
      <a href="IndexEsuper.jsp">首页</a>
      <a href="commodity.jsp">商品</a>
      <a href="comment.jsp">市场</a>
      <a href="trolley.jsp">购物车</a>
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
  <%--订单搜索框start--%>
  <div class="nav_bottom">
    <form action="orders.jsp">
      <input type="text" placeholder="输入商品标题或订单号进行搜索" name="name">
      <button type="submit">订单搜索</button>
    </form>
  </div>
  <%--订单搜索框end--%>

  <%--商品搜索框start--%>
  <div class="search_goods">
    <form action="commodity.jsp">
      <input type="text" placeholder="输入商品" name="name">
      <button type="submit"><img style="height: 30px; width: 30px; position: absolute; top: 0px; right: 0px" src="images/搜索.png"></button>
    </form>
  </div>
  <%--商品搜索框end--%>
</nav>
<%--顶部区end--%>

<%--订单区域start--%>
<main>
  <%
    Integer userid = (Integer) session.getAttribute("userid");
    String username = String.valueOf(session.getAttribute("username"));
    orders_impl order = new orders_impl();
    String name = request.getParameter("name");
    String sql = null;
      if (name == null) {
        sql = "select orders.*,bookinfor.new_price,bookinfor.book_pic,bookinfor.depiction,userinfor.username from orders,bookinfor,userinfor where orders.username=userinfor.username and userinfor.username like '%" + username + "%' and orders.identifier=bookinfor.identifier order by o_date desc";
      } else {
        sql = "select orders.*,bookinfor.new_price,bookinfor.book_pic,bookinfor.depiction from orders,bookinfor where orders.identifier=bookinfor.identifier and (orders.o_num like '%" + name + "%' or bookinfor.depiction like '%" + name + "%') order by o_date desc";
      }
      List<orders> lst = order.getorders(sql);
      request.setAttribute("orderLst", lst);

  %>
  <%--左部导航--%>
  <div class="left_nav">
    <h4 style="font-weight: 500">全部功能</h4>
    <h5 style="font-weight: 400">已买到的宝贝</h5>
    <h5 style="font-weight: 400">我的发票</h5>
    <h5 style="font-weight: 400">退款维权</h5>
  </div>
  <div class="order">
    <div class="top">
      <div style="width: 480px">商品</div>
      <div style="width: 170px">单价</div>
      <div style="width: 170px">数量</div>
      <div style="width: 170px">付款</div>
    </div>

    <h1 style="text-align: center" id="empty">您暂无订单！</h1>

    <c:forEach items="${orderLst}" var="order">
      <div class="card">
        <div class="top">
          &nbsp;&nbsp;&nbsp;${order.o_date}&nbsp;&nbsp;&nbsp;订单号：${order.o_num}
          <a href="DelorderServlet?o_num=${order.o_num}" class="delete" onclick="return decide()"><img style="margin-top:6px; margin-right: 10px; width: 30px; height: 30px; display: inline; float: right;" src="images/删除.png" title="删除此订单"></a>
        </div>
        <img src="${order.book_pic}">
        <div class="depiction">
          <p id="depiction">${order.depiction}</p>
        </div>
        <div class="price">
          <p>￥${order.new_price}</p>
        </div>
        <div class="quantity">
          <p>${order.quantity}</p>
        </div>
        <div class="order_price">
          <p>￥${order.order_price}</p>
        </div>
      </div>
    </c:forEach>
  </div>
</main>
<%--订单区域end--%>
<script>

  function decide(){
    if(confirm("确定删除本条数据吗？")){
      return true;
    }
    else
      return false;
  }

  function checkedEmpty() {
    var depiction = document.getElementById("depiction").innerHTML;
    var empty = document.getElementById("empty");
    if(depiction != ""){
      empty.style.display = "none";
    }
  }
  window.onload=checkedEmpty;

  // 判断是否退出
  function checkout(){
    layer.confirm('确认退出登陆吗？', {icon: 3, title: '网页提示'}, function (index) {
      window.location = "LogoutServlet";
      // 执行完之后关闭确认框
      layer.close(index);
    });
    // 此时的弹出框默认top：1558.32px偏大，因此弹出框弹出后无法看到，需手动进行更改
    $(".layui-layer").css({'top': '240px'});

  }

</script>
</body>
</html>
