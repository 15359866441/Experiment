<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2022/01/06
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>check.jsp</title>
</head>
<body>
    <%
        String name = request.getParameter("uname");
        String pwd = request.getParameter("upwd");
        if(name.equals("zc")&&pwd.equals("abc")){
//            response.sendRedirect("success1.jsp");
            out.println("登录成功");
            request.getRequestDispatcher("success1.jsp").forward(request,response);
        }
        else {
            out.println("登录失败");
//            下面语句在控制台中输出
//            System.out.println("登录失败！");
        }
    %>
</body>
</html>
