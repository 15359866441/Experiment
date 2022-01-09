<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="DAO.Service_JavaBean.bookinfor_impl" %>
<%@ page import="DAO.data_JavaBean.bookinfor" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    td img{
      width: 80px;
    }
    tr{
      text-align: center;
    }
    td .pass{
      padding: 2px;
      text-decoration: none;
      color: white;
      display: inline-block;
      width: 40px;
      height: 25px;
      background-color: #009688;
    }
    td .repulse{
      padding: 2px;
      text-decoration: none;
      color: white;
      display: inline-block;
      width: 42px;
      height: 25px;
      background-color: red;
    }
    table #identifier{
      width: 530px;
    }
    tr:hover{
      background-color: rgb(243, 243, 243);
    }
  </style>
</head>
<body>
<%
  Integer userid = (Integer) session.getAttribute("userid");
  String supplier = String.valueOf(session.getAttribute("username"));
  bookinfor_impl book = new bookinfor_impl();
  String name = request.getParameter("name");
  String sql = null;
  if (name == null) {
    sql = "select * from bookinfor where status=0";
  }else {
    sql = "select * from bookinfor where status=0 and depiction like '%" + name + "%'";
  }
  List<bookinfor> lst = book.getboooks(sql);
  request.setAttribute("bookLst", lst);
%>
<table border="1" cellspacing="0" cellpadding="4" align="center" id="mytable">
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
      <td>${book.old_price}</td>
      <td>${book.put_time}</td>
      <td>${book.supplier}</td>
      <td><a href="PassServlet?identifier=${book.identifier}" class="pass">通过</a></td>
      <td><a href="RepulseServlet?identifier=${book.identifier}" class="repulse">打回</a></td>
    </tr>
  </c:forEach>
</table>
<h1 style="text-align: center" id="empty">暂无待审核的商品</h1>
<script>
<%-- 检查表格是否为空，若为空则将表格隐藏，隐藏表格是不能对整个表格进行隐藏，只能以行为单位进行隐藏 --%>
  function checkempty(){
    var empty = document.getElementById("empty");
    var mytable = document.getElementById("mytable");
    var tablerow = mytable.rows[1];
    if (tablerow==null){
     mytable.rows[0].style.display="none";
    }
    else
      empty.style.display="none";

  }
  window.onload=checkempty;
</script>

</body>
</html>
