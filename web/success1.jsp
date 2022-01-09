<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2022/01/06
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>success1.jsp</title>
</head>
<body>
    登录成功！<br>
    欢迎你：
    <%
        String name = request.getParameter("uname");
        out.println(name);
    %>
</body>
</html>
