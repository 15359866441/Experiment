<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2022/01/06
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* 无宽不居中 */
        #result {
            width: 150px;
            height: 50px;
            border: 1px solid gray;
            text-align: center;
            margin: 0 auto;
        }
    </style>
</head>

<body>

<table align="center">
    <tr>
        <td>体重：</td>
        <td><input type="text" class="weight"></td>
    </tr>
    <tr>
        <td>身高：</td>
        <td><input type="text" class="height"></td>
    </tr>
    <tr>
        <td>操作：</td>
        <td><input type="submit" value="提交" onclick="doajax()"></td>
    </tr>
    <tr>
        <td>结果如下：</td>
    </tr>
</table>

<div id="result">哈哈哈</div>

<script>
    function doajax(){
        // 1.创建异步对象
        var xhr = new XMLHttpRequest();

        // 2.绑定事件
        xhr.onreadystatechange = function(){
            //检查属性值
            console.log("readyState（请求状态）:"+xhr.readyState+",   status："+xhr.status);
            if(xhr.readyState==4 && xhr.status==200){
                var data = xhr.responseText;
                // alert("data="+data);
                document.getElementById("result").innerHTML=data;
            }
        }
        var weight = document.getElementsByClassName("weight")[0].value;
        var heignt = document.getElementsByClassName("height")[0].value;
        var param = "BMIServlet?weight="+weight+"&height="+heignt;
        console.log("param值："+param);

        // 初始化请求参数
        xhr.open("get",param,true);
        xhr.send();
    }
</script>
</body>

</html>
