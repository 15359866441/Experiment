<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="DAO.Service_JavaBean.orders_impl" %>
<%@ page import="DAO.data_JavaBean.orders" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        td img {
            width: 90px;
            height: 100px;
        }

        #identifier {
            width: 550px;
        }

        tr {
            text-align: center;
        }

        td .delete {
            padding: 2px;
            text-decoration: none;
            color: white;
            display: inline-block;
            width: 40px;
            height: 25px;
            background-color: #FF5722;
        }

        .option {
            width: 90px;
        }

        tr:hover {
            background-color: rgb(243, 243, 243);
        }

        .nav_bottom {
            width: 1300px;
            margin: 0 auto;
            position: relative;
            /*border: 1px solid red;*/
        }

        .nav_bottom input {
            margin-left: 800px;
            width: 500px;
            height: 40px;
            margin-top: 1px;
            border-radius: 20px;
            outline: none;
            padding-left: 30px;
            color: gray;
            font-size: 18px;
            caret-color: blue;
            /* 取消原来输入框的边框，原变边框不便操作 */
            border: none;
            border: 2px solid red;
        }

        .nav_bottom button {
            position: absolute;
            right: 0;
            height: 42px;
            width: 80px;
            /*top: calc(50% - 21px);*/
            /* 左上、右上、右下、左下 */
            border-radius: 0 20px 20px 0;
            outline: none;
            border: none;
            background-color: #FF4400;
            color: cornsilk;
            font-size: 18px;
        }

        .nav_bottom button:hover {
            background-color: #e7541e;
        }

        .nav_bottom button:active {
            color: #ecbdac;
        }
    </style>
</head>
<body>

<%
    //    String username = String.valueOf(session.getAttribute("username"));
    orders_impl order = new orders_impl();
    String name = request.getParameter("name");
    String sql = null;
    if (name == null) {
        sql = "select orders.*,bookinfor.new_price,bookinfor.book_pic,bookinfor.depiction,userinfor.username from orders,bookinfor,userinfor where userinfor.username=orders.username and orders.identifier=bookinfor.identifier order by o_date desc";
    } else {
        sql = "select orders.*,bookinfor.new_price,bookinfor.book_pic,bookinfor.depiction from orders,bookinfor where orders.identifier=bookinfor.identifier and (orders.o_num like '%" + name + "%' or bookinfor.depiction like '%" + name + "%') order by o_date desc";
    }
    List<orders> lst = order.getorders(sql);
    request.setAttribute("orderLst", lst);
%>
<div class="nav_bottom">
    <form action="allorders.jsp">
        <input type="text" placeholder="输入订单号或书名搜索全部订单" name="name">
        <button type="submit">搜索</button>
    </form>
</div>


<table border="1" cellspacing="0" cellpadding="4" align="center">
    <tr>
        <th>订单号</th>
        <th>客户</th>
        <th id="identifier">书本名称</th>
        <th>书本编号</th>
        <th>简图</th>
        <th>数量（件）</th>
        <th>总价（元）</th>
        <th>日期</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${orderLst}" var="order">
        <tr>
            <td>${order.o_num}</td>
            <td>${order.username}</td>
            <td>${order.depiction}</td>
            <td>${order.identifier}</td>
            <td><img src="${order.book_pic}" alt=""></td>
            <td>${order.quantity}</td>
            <td>${order.order_price}</td>
            <td>${order.o_date}</td>
            <td class="option"><a href="allDelordServlet?o_num=${order.o_num}" class="delete" onclick="return decide()">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<script>
    function decide() {
        if (confirm("确定删除本条数据吗？")) {
            return true;
        } else
            return false;
    }
</script>
</body>
</html>
