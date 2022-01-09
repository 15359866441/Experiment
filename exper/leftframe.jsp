<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <style>
        .layui-nav{
            background-color: #8493d8 !important;
        }


        .layui-bg-black {
            background-color: #8493d8 !important;

        }
        a{
            font-size: 18px !important;
        }
        .layui-nav-item a:hover{
            background-color:#5371c4 !important;
        }
    </style>
</head>
<body>

<%--此处的div标签用于取值传递给js判断当前登录用户的身份--%>
<div id="judge" style="display: none">${userid}</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item"><a href="IndexEsuper.jsp" target="_blank">返回首页</a></li>
            <li class="layui-nav-item layui-nav-itemed manager">
                <a class="" href="javascript:;">商品管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="showcommodity.jsp" class="layui-this" target="mainframe">商品信息</a></dd>
                    <dd><a href="waitcheck.jsp" target="mainframe">待审核商品</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item manager">
                <a href="javascript:;">帖子管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">帖子信息</a></dd>
                    <dd><a href="javascript:;">待审核</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item manager"><a href="javascript:;">预约购书</a></li>
            <li class="layui-nav-item manager"><a href="allorders.jsp" target="mainframe">订单管理</a></li>
            <li class="layui-nav-item manager"><a href="javascript:;">反馈建议</a></li>
            <li class="layui-nav-item manager"><a href="javascript:;">商家申请</a></li>
            <li class="layui-nav-item supplier layui-this"><a href="showcommodity.jsp" target="mainframe">我的商品</a></li>
            <li class="layui-nav-item supplier"><a href="addgoods.jsp;" target="mainframe">发布商品</a></li>
        </ul>
    </div>
</div>
<script>
    function userjudge(){
        var id = document.getElementById("judge").innerHTML;
        var manager = document.getElementsByClassName("manager");
        var supplier = document.getElementsByClassName("supplier");
        if (id==1){
            for(var i in manager){
                manager[i].style.display="none";
            }
        }
        else if(id==0){
            for(var i in supplier){
                supplier[i].style.display="none";
            }
        }
    }
    window.onload=userjudge;
    //JS
    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element
            , layer = layui.layer
            , util = layui.util
            , $ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function (othis) {
                layer.msg('展开左侧菜单的操作', { icon: 0 });
            }
            , menuRight: function () {
                layer.open({
                    type: 1
                    , content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    , area: ['260px', '100%']
                    , offset: 'rt' //右上角
                    , anim: 5
                    , shadeClose: true
                });
            }
        });
    });
</script>
</body>
</html>
