<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>二手书城-后台管理</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
</head>
<frameset rows="60,*">
    <!-- 相对宽度的表示 -->
    <frameset frameborder="0">
        <!-- name为框架指定一个名称 -->
        <frame name="topframe" src="topframe.jsp" noresize="noresize" scrolling="no" frameborder="no">
    </frameset>
    <!-- 绝对值的表示 -->
    <frameset cols="200,*"  frameborder="0" scrolling="no">
        <frame name="leftframe" src="leftframe.jsp" noresize="noresize">
        <frame name="mainframe" src="showcommodity.jsp" noresize="noresize">
    </frameset>
</frameset>
<script>

</script>
<noframes>
    <body>
    该浏览器不支持框架集！
    </body>
</noframes>
</html>
