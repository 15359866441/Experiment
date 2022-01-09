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
        <h1>书目添加</h1>
        <form action="addbookServlet">
            书目编号：&nbsp;<input type="text" name="identifier" placeholder="请输入名称，如K11"><br>
            书目名称：&nbsp;<input type="text" name="depiction"  placeholder="请输入名称"><br>
            商家名称：&nbsp;<input type="text" name="supplier" placeholder="请输入名称"><br>
            书目类别：&nbsp;<input type="text" name="kinds" placeholder="请选择类别" list="kinds"><br>
            <datalist id="kinds">
                <option value="英语">
                <option value="计算机">
                <option value="数学">
                <option value="法学">
            </datalist>
            售&#x3000;&#x3000;价：
            <input type="text" name="new_price" placeholder="请输入售价"><br>
            数&#x3000;&#x3000;量：
            <input type="number" name="quantity" placeholder="请输入数量"><br>
            书目简图：
            <input type="file" name="book_pic" style="border: none; font-size: 18px;"><br>
            发售日期：
            <input type="date" name="put_time" id="date"><br>
            <button type="submit">提交</button>
        </form>
    </main>
    <script>
        var time = new Date();

        /*格式化日，如果小于9，则补0*/
        var day = ("0" + time.getDate()).slice(-2);

        /*格式化月，如果小于9，则补0*/
        var month = ("0" + (time.getMonth() + 1)).slice(-2);

        /*拼接日期*/
        var today = time.getFullYear() + "-" + (month) + "-" + (day);

        document.getElementById("date").value = today;
    </script>
</body>

</html>