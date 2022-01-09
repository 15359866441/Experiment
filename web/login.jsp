<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2022/01/06
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>index.jsp</title>
</head>
<body>
<%-- 用户登录界面 --%>
<div align="center" style="background-color: lawngreen">
  <%-- 当点击登陆的时候，以表单的形式提交信息，启动LoginServlet --%>
  <h1 align="center">用户登陆</h1>
  <form action="LoginServlet" method="post"><%--   登录界面以表格的形式展现    --%>
    <table>
      <tr>
        <td>用户名：</td>
        <td><input type="text" name="username" placeholder="请输入用户名"></td>
      </tr>
      <tr>
        <td>密码：</td>
        <td><input type="text" name="pwd" placeholder="请输入用密码"></td>
      </tr>
      <tr>
        <%-- 合并表格两列 --%>
        <td colspan="2">
          <input type="submit" value="登陆" style="margin-left: 50px;margin-top: 5px">
          &nbsp;
          <input type="button" value="注册" style="margin-left: 55px;margin-top:5px">
        </td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
