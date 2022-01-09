<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="DAO.Service_JavaBean.bookinfor_impl" %>
<%@ page import="DAO.data_JavaBean.bookinfor" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="layer/layer.js"></script>
    <link rel="stylesheet" href="css/showcommodity.css">
</head>
<body>
<%
    Integer userid = (Integer) session.getAttribute("userid");
    String supplier = String.valueOf(session.getAttribute("username"));
    bookinfor_impl book = new bookinfor_impl();
    String name = request.getParameter("name");
    String sql = null;
    if (name == null) {
        sql = "select * from bookinfor";
    }else {
        sql = "select * from bookinfor where depiction like '%" + name + "%'";
    }
//  需保证管理员能查看所有供应商的商品，各供应商只能查看自己提供的商品，且需保证某个供应商在查询时不能查询其他供应商的商品
    if (userid==1){
        if (name==null) {
            sql = "select * from bookinfor where supplier='" + supplier + "'";
        }
        else {
            sql = "select * from bookinfor where supplier='"+supplier+"' and depiction like '%" + name + "%'";
        }
    }
    List<bookinfor> lst = book.getboooks(sql);
    request.setAttribute("bookLst", lst);
%>
<div class="tips">
    <p>注：状态属性列中“0”表示等待审核，“1”代表已通过审核</p>
    <div class="nav_bottom">
        <form action="showcommodity.jsp">
            <input type="text" placeholder="搜索书本信息" name="name">
            <button type="submit">搜索</button>
        </form>
    </div>
</div>

<%--清除浮动--%>
<div style="clear:both"></div>

<table border="1" cellspacing="0" cellpadding="4" align="center">
    <tr>
        <th>书目简图</th>
        <th>编号</th>
        <th>状态</th>
        <th id="identifier">名称</th>
        <th>数量（件）</th>
        <th>类别</th>
        <th>月销（件）</th>
        <th>价格（元）</th>
        <th>上架日期</th>
        <th>供货商</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach items="${bookLst}" var="book">
        <tr>
            <td><img src="${book.book_pic}" alt=""></td>
            <td>${book.identifier}</td>
            <td>${book.status}</td>
            <td>${book.depiction}</td>
            <td>${book.quantity}</td>
            <td>${book.kinds}</td>
            <td>${book.mon_sell}</td>
            <td>${book.new_price}</td>
            <td>${book.put_time}</td>
            <td>${book.supplier}</td>
            <td><a href="DelbookServlet?identifier=${book.identifier}" class="delete" onclick="return decide()">删除</a></td>
            <td><a href="updatebook.jsp?identifier=${book.identifier}&depiction=${book.depiction}&supplier=${book.supplier}
            &kinds=${book.kinds}&new_price=${book.new_price}&quantity=${book.quantity}&book_pic=${book.book_pic}
            &put_time=${book.put_time}" class="update">修改</a></td>
        </tr>
    </c:forEach>
</table>
<script>
    function decide(){
        if(confirm("确定删除本条数据吗？")){
            return true;
        }
        else
            return false;
    }
</script>
</body>
</html>
