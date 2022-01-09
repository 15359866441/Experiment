<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品详情</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="css/showdetail.css">
    <script type="text/javascript" src="js/showdetail.js"></script>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="layer/layer.js"></script>
</head>
<body>

<%--此处的div标签用于获取请求域中的书本编号--%>
<div id="identifier" style="display: none"><%=request.getParameter("identifier")%></div>

<%--此处的div标签用于取值传递给js判断当前登录用户的身份--%>
<div id="sno" style="display: none">${sno}</div>

<%--此处的div标签用于查看当前是否有用户登录，若没有用户登录则不能购买和添加购物车--%>
<div id="username1" style="display: none">${username}</div>


<!-- 导航栏部分 -->
<nav>
    <div class="nav_top">
        <ul class="profile" id="profile">
            <li>
                <span id="username">${username}</span>
            </li>
            <li class="profile-select">
                <div class="triangle">
                    <div class="profile-sub-list">
                        <ul>
                            <li>
                                <a href="#">个人主页</a>
                            </li>
                            <li>
                                <a href="javascript:;" onclick="checkout()">退出登录</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
        <div class="nav_box">
            <a href="LoginE.jsp" id="log">登录</a>
            <a href="Register.jsp" id="reg">免费注册</a>
            <a href="IndexEsuper.jsp">首页</a>
            <a href="comment.jsp">广场</a>
            <a href="trolley.jsp">购物车</a>
            <a href="orders.jsp">订单</a>
        </div>
    </div>

    <div class="nav_bottom">
        <img src="images/logo.png" alt="">
        <img src="images/nav_text.png" alt="">
        <form action="commodity.jsp">
            <input type="text" placeholder="搜索书目" class="sear_input" name="name">
            <button type="submit" name="search">搜索</button>
        </form>
    </div>
</nav>

<!-- 主体部分 -->
<div class="center_con clearfix">
    <div class="main_menu fl"><img src="<%=request.getParameter("book_pic")%>"  id="book_pic"></div>
    <div class="goods_detail_list fr">
        <h3 id="depiction"><%=request.getParameter("depiction")%></h3>
        <br>
        <div class="prize_bar">
            <div class="show_prize fl">￥<em id="item_price"><%=request.getParameter("new_price")%></em></div>
        </div><br />
        <div class="goods_num clearfix">
            <div class="num_name fl">数量：</div>
            <div class="num_change">
                <table>
                    <tr>
                        <td>
                            <input type="button" value="-" onclick=subNum();>
                            <input type="text" value="1" id="num">
                            <input type="button" value="+" onclick=addNum();>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="margin-top: 20px">库存：<span id="sum"><%=request.getParameter("quantity")%></span></div>
        <div class="total">总价：<span id="sumPrice" style="font-size: 20px; color: red"><%=request.getParameter("new_price")%></span><span>元</span></div>

        <div class="operate_btn">
            <a href="javascript:;" class="add_car" onclick="addtrolley()">加入购物车</a>
            <a href="javascript:;" class="tobuy" onclick="addorder()">立即购买</a>
        </div>
    </div>
</div>
<script>

    function checkout(){
        layer.confirm('确认退出登陆吗？', {icon: 3, title: '网页提示'}, function (index) {
            window.location = "LogoutServlet";
            layer.close(index);
        });
        // 此时的弹出框默认top：1558.32px偏大，因此弹出框弹出后无法看到，需手动进行更改
        $(".layui-layer").css({'top': '240px'});

    }

    function addorder(){
        var username1 = document.getElementById("username1").innerHTML;
        if (username1==""){
            // alert("请先登陆");
            layer.msg('您还未登陆，请先登陆', {
                icon: 2,
                time: 1500
            });
            $(".layui-layer").css({'top':'250px'});
            return false;
        }
        var quantity = document.getElementById("num").value;
        var order_price = document.getElementById("sumPrice").innerHTML;
        var username = document.getElementById("username").innerHTML;
        var identifier = document.getElementById("identifier").innerHTML;
        var depiction= document.getElementById("depiction").innerHTML;
        var param = "addordServlet?username="+username+"&identifier="+identifier+"&quantity="+quantity+"&order_price="+order_price;
        var bol = confirm("订单确认->客户姓名："+username+"， 书名："+depiction+"， 数量："+quantity+"， 价格："+order_price);
        if (!bol)
            return false;

        var xhr = new XMLHttpRequest();

        // 2.绑定事件
        xhr.onreadystatechange = function(){
            //检查属性值
            console.log("readyState（请求状态）:"+xhr.readyState+",   status："+xhr.status);
            if(xhr.readyState==4 && xhr.status==200){
                var data = xhr.responseText;
                if (data==1){
                    // alert("购买成功！");
                    // window.location="orders.jsp";
                    layer.msg('购买成功，正在跳转至订单界面', {
                        icon: 1,
                        time: 1500
                    },function(){
                        window.location="orders.jsp";
                    });
                    $(".layui-layer").css({'top':'250px'});
                }
                else{
                    layer.msg('购买失败，请重新选择', {
                        icon: 5,
                        time: 1500
                    },function(){
                        window.location="showdetail.jsp";
                    });
                    $(".layui-layer").css({'top':'250px'});
                }
            }
        }
        // 初始化请求参数
        xhr.open("get",param,true);
        xhr.send();
    }

    function addtrolley(){
        var username = document.getElementById("username").innerHTML;
        if (username==""){
            layer.msg('您还未登陆，请先登陆', {
                icon: 2,
                time: 1200
            });
            $(".layui-layer").css({'top':'250px'});
            return false;
        }

        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            console.log("readyState（请求状态）:"+xhr.readyState+",   status："+xhr.status);
            if(xhr.readyState==4 && xhr.status==200){
                var data = xhr.responseText;
                if (data==1){
                    // alert("添加成功！");
                    // window.location="trolley.jsp";
                    layer.msg('添加购物车成功', {
                        icon: 1,
                        time: 2000
                    });
                    $(".layui-layer").css({'top':'250px'});
                }
                else{
                    layer.msg('添加购物车失败，请重新选择', {
                        icon: 5,
                        time: 1500
                    },function(){
                        window.location="showdetail.jsp";
                    });
                    $(".layui-layer").css({'top':'250px'});
                }
            }
        }
        //取加入购物车的书本的编号，将编号传递到购物车页面
        var identifier = document.getElementById("identifier").innerHTML;

        var sno = document.getElementById("sno").innerHTML;
        var item_price = document.getElementById("item_price").innerHTML
        var book_pic = document.getElementById("book_pic").src;
        var depiction= document.getElementById("depiction").innerHTML;
        var bookNum = document.getElementById("num").value;


        // alert(quantity+", "+order_price+", "+username+", "+identifier);
        var param = "addtroServlet?sno="+sno+"&item_price="+item_price+"&book_pic="+book_pic+
            "&depiction="+depiction+"&bookNum="+bookNum+"&identifier="+identifier;
        console.log("param值："+param);

        // 初始化请求参数
        xhr.open("get",param,true);
        xhr.send();
    }

</script>
</body>
</html>
