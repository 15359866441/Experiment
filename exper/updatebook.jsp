<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加商品</title>
    <link rel="stylesheet" href="css/addgoods.css">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
</head>

<body>
<main>
    <h1>信息修改</h1>
    <form action="UpdabookServlet">
        书目编号：&nbsp;<input type="text" name="identifier" placeholder="请输入名称，如K11" value="<%=request.getParameter("identifier")%>"><br>
        书目名称：&nbsp;<input type="text" name="depiction"  placeholder="请输入名称" value="<%=request.getParameter("depiction")%>" ><br>
        商家名称：&nbsp;<input type="text" name="supplier" placeholder="请输入名称" value="<%=request.getParameter("supplier")%>"><br>
        书目类别：&nbsp;<input type="text" name="kinds" placeholder="请选择类别" list="kinds" value="<%=request.getParameter("kinds")%>"><br>
        <datalist id="kinds">
            <option value="英语">
            <option value="计算机">
            <option value="数学">
            <option value="法学">
        </datalist>
        售&#x3000;&#x3000;价：
        <input type="text" name="new_price" placeholder="请输入售价" value="<%=request.getParameter("new_price")%>"><br>
        数&#x3000;&#x3000;量：
        <input type="number" name="quantity" placeholder="请输入数量" value="<%=request.getParameter("quantity")%>"><br>
        书目简图：
        <input type="text" name="book_pic" style="border: none; font-size: 18px;" value="<%=request.getParameter("book_pic")%>"><br>
        发售日期：
        <input type="text" name="put_time" id="date" value="<%=request.getParameter("put_time")%>"><br>
        <button type="submit">提交修改</button>
    </form>
</main>
</body>

</html>