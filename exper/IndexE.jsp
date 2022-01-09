<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.Service_JavaBean.bookinfor_impl" %>
<%@ page import="DAO.data_JavaBean.bookinfor" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>二手书城-首页</title>
  <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
  <!-- css部分 -->
  <link rel="stylesheet" href="layui/css/layui.css">
  <link href="css/show.css" rel="stylesheet" type="text/css">

  <!-- js部分 -->
  <script src="layui/layui.js" charset="utf-8"></script>
  <script src="js/jquery-3.6.0.min.js"></script>

  <%-- 导入猜你喜欢区域的js --%>
  <script src="js/IndexE.js"></script>
</head>

<body>
<div class="clear"></div>

<!-- 顶部区 -->
<nav>
  <div class="nav">
    <img src="images/logo.png" alt="">
    <div>
      <a href="" target="_blank">首页</a>
      <a href="commodity.jsp" target="_blank">商品</a>
      <a href="comment.jsp">广场</a>
      <a href="javascript:;" onclick="islog()">购物车</a>
      <a href="javascript:;" onclick="islog()">订单</a>
    </div>

  </div>
  <div class="nav_butt">
    <a href="LoginE.jsp" class="login">登录</a>
    <a href="Register.jsp" target="_blank" class="reg">注册</a>
  </div>
</nav>
<img src="images/banner.jpg" alt="" class="logo2">
<!-- 导航栏分类区 -->
<ul class="layui-nav layui-bg-blue">
  <li class="layui-nav-item">
    <a href="javascript:;">理科</a>
    <dl class="layui-nav-child">
      <dd><a href="">数学</a></dd>
      <dd><a href="">物理</a></dd>
      <dd><a href="">化学</a></dd>
      <dd><a href="">生物科学</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="javascript:;">工科</a>
    <dl class="layui-nav-child">
      <dd><a href="">计算机</a></dd>
      <dd><a href="">信息技术</a></dd>
      <dd><a href="">土建</a></dd>
      <dd><a href="">机械</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="javascript:;">农学</a>
    <dl class="layui-nav-child">
      <dd><a href="">环境生态</a></dd>
      <dd><a href="">水产</a></dd>
      <dd><a href="">其他</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="javascript:;">文科</a>
    <dl class="layui-nav-child">
      <dd><a href="">艺术</a></dd>
      <dd><a href="">外语</a></dd>
      <dd><a href="">法学</a></dd>
      <dd><a href="">文学</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="javascript:;">农学</a>
    <dl class="layui-nav-child">
      <dd><a href="">环境生态</a></dd>
      <dd><a href="">水产</a></dd>
      <dd><a href="">其他</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="javascript:;">其他</a>
    <dl class="layui-nav-child">
      <dd><a href="">其他1</a></dd>
      <dd><a href="">其他2</a></dd>
      <dd><a href="">其他3</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="javascript:;">其他</a>
    <dl class="layui-nav-child">
      <dd><a href="">其他1</a></dd>
      <dd><a href="">其他2</a></dd>
      <dd><a href="">其他3</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="javascript:;">其他</a>
    <dl class="layui-nav-child">
      <dd><a href="">其他1</a></dd>
      <dd><a href="">其他2</a></dd>
      <dd><a href="">其他3</a></dd>
    </dl>
  </li>
</ul>
<!--中间部分 start-->
<!-- 左侧畅销区 -->
<div class="main">
  <div class="Mainleft">
    <div class="lefttitle"><img src="./images/hot_sale.png" alt="" style="width: 30px;">&#x3000;畅销榜</div>
    <ul class="pic_list1">
      <li><a href="#"><img src="images/combook2.jpg" /></a>
        <p class="price1">￥14.70元</p>
      </li>
      <img src="./images/火焰1.png" alt="" class="fire">
    </ul>
    <ul class="pic_list1">
      <li><a href="#"><img src="images/combook4.jpg" /></a>
        <p class="price1">￥29.90元</p>
      </li>
      <img src="./images/火焰2.png" alt="" class="fire">
    </ul>
    <ul class="pic_list1">
      <li><a href="#"><img src="images/combook7.jpg" /></a>
        <p class="price1">￥24.90元</p>
      </li>
      <img src="./images/火焰3.png" alt="" class="fire">
    </ul>
  </div>
  <!-- 轮播图区 -->
  <div class="middle_lef">
    <div class="layui-carousel" id="test3" lay-filter="test4">
      <div carousel-item="">
        <div><a href=""><img src="./images/book1n.jpg" alt=""></a></div>
        <div><a href=""><img src="./images/book2.jpg" alt=""></a></div>
        <div><a href=""><img src="./images/book3.jpg" alt=""></a></div>
      </div>
    </div>
  </div>
  <!-- 推荐区 -->
  <div class="middle_rig">
    <div class="adver_top"><a href=""><img src="images/sale1n.jpg" alt=""></a></div>
    <div class="adver_bott"><a href=""><img src="images/sale2.jpg" alt=""></a></div>
  </div>
  <!-- 热搜区 -->
  <div class="right_nav">
    <div class="notice_title"><img src="./images/hot_sear.png" alt="" style="width: 30px;">&#x3000;搜索榜</div>
    <div class="hot_text">
      <p><a href="">NO.1 高等数学</a></p>
      <p><a href="">NO.2 大学物理B</a></p>
      <p><a href="">NO.3 C语言程序设计</a></p>
      <p></p><a href="">NO.4 离散数学</a></p>
      <p><a href="">NO.5 数据结构教程</a></p>
      <p><a href="">NO.6 计算机组成原理</a></p>
      <p><a href="">NO.7 数据库系统概论</a></p>
      <p><a href="">NO.8 算法设计与分析</a></p>
      <p><a href="">NO.9 算法设计与分析</a></p>
      <p><a href="">NO.10 算法设计与分析</a></p>
    </div>
  </div>
  <!-- 右侧选项卡区域 -->
  <div class="layui-tab">
    <ul class="layui-tab-title">
      <li class="layui-this">公告</li>
      <li>书本回收</li>
      <li>商家申请</li>
    </ul>
    <div class="layui-tab-content">
      <div class="layui-tab-item layui-show" style="font-size: 16px;">亲爱的用户：
        <br>
        &#x3000;为净化网站良好环境及提升浏览体验，我们将会对被举报的用户（内容）进行严格审查，并对违规用户作出严肃处理，
        同时您的宝贵建议也将是网站不断进步、完善的动力。
        <br><br>
        &#x3000; &#x3000; &#x3000; &#x3000;&#x3000; &#x3000; &#x3000; &#x3000;2021年4月2日
      </div>
      <div class="layui-tab-item">
        <div>请先预登记信息</div>
        <div>姓&#x3000;&#x3000;名：<input type="text" style="width: 60px;"></div>
        <div>联系方式：<input type="text" style="width: 100px;"></div>
        <div>回收书目：<input type="text" style="width: 100px;"></div>
        <div>数&#x3000;&#x3000;量：<input type="number" style="width: 30px;" value="1"></div>
        <div>备&#x3000;&#x3000;注：<textarea style="vertical-align: top;" name="" id="" cols="15" rows="2"></textarea>
        </div>
        <button type="submit" value="提交" style="display: block; margin: 8px auto 0;
           width: 55px; height: 25px;">
          提交</button>
      </div>
      <div class="layui-tab-item">预约购书区域</div>
    </div>
  </div>
</div>
<!--中间部分 end-->

<!-- 侧边栏 -->
<aside>
  <div class="aside_area">
    <div>
      <a href="javascript:;"><img src="images/客服.png" alt=""></a>
      <a href="javascript:;">客服</a>
    </div>
    <div>
      <a href="javascript:;"><img src="images/反馈.png" alt=""></a>
      <a href="javascript:;">反馈</a>
    </div>
    <div>
      <a href="javascript:;"><img src="images/举报.png" alt=""></a>
      <a href="javascript:;">举报</a>
    </div>
    <div>
      <a href="javascript:;" title="回到顶部"><img id="gotoTop" style="display: none;" src="images/回到顶部3.png" alt=""></a>
    </div>
  </div>
</aside>

<!-- 服务区 -->
<!-- 清除浮动 -->
<div class="clear"></div>
<div class="other">
  <div class="block"></div>
  <h2>热卖好物</h2>
</div>

<div class="hot_sell">

  <%
    bookinfor_impl book = new bookinfor_impl();
    String name = request.getParameter("name");
    String sql = null;
    sql = "select * from bookinfor order by mon_sell desc limit 10";
    List<bookinfor> lst = book.getboooks(sql);
    request.setAttribute("bookLst", lst);
  %>

  <c:forEach items="${bookLst}" var="book">
    <%-- 内层边框--%>
    <div class="card">
      <!-- 内层边框 -->
      <div class="card_box">
        <a href="showdetail.jsp?depiction=${book.depiction}&book_pic=${book.book_pic}
&new_price=${book.new_price}&quantity=${book.quantity}&identifier=${book.identifier}" ><img src="${book.book_pic}" alt=""></a>
        <a href="showdetail.jsp?depiction=${book.depiction}&book_pic=${book.book_pic}
&new_price=${book.new_price}&quantity=${book.quantity}&identifier=${book.identifier}" class="desc">${book.depiction}</a>
        <div class="new_price">￥${book.new_price}</div>
        <div class="old_price"><del>￥${book.old_price}</del></div>
        <div class="mon_sell">月销&nbsp;${book.mon_sell}</div>
      </div>
    </div>
  </c:forEach>

</div>
<%--<input type="text" value="${book.depiction}">--%>
<!-- 猜你喜欢 -->
<div class="other">
  <div class="block" style="background-color: rgb(15, 218, 167);"></div>
  <h2 style="color:  rgb(15, 218, 167);;">猜你喜欢</h2>
</div>
<!-- 通过引入js实现随机切换 -->
<div class="gue_like" id="gue_like"></div>

<div class="other">
  <div class="block" style="background-color: red;"></div>
  <h2 style="color: red;">合作加盟</h2>
</div>
<div class="cooperate">
  <img src="./images/process.png" alt="" style="width: 100%;">
  <div class="phone_area">
    <img class="phone" src="./images/座机.png" alt="">
    <p>服务咨询：0582-1234567</p>
  </div>
</div>
<div class="other">
  <div class="block" style="background-color: #13227A;"></div>
  <h2 style="color: #13227A;">服务保障</h2>
</div>

<div class="serve">
  <div class="card">
    <img src="images/正版授权.png" alt="" style="margin: 16px 35px;">
    <p class="title" sty>正版承诺</p>
    <p class="trans" style="padding-top: 18px;">书本来源均为正规合法渠道，坚决抵制盗版</p>
  </div>
  <div class="card2">
    <img src="images/价格.png" alt="">
    <p class="title">物廉价优</p>
    <p class="trans">价格商定，线上议价，物品优廉</p>
  </div>
  <div class="card">
    <img src="images/送货.png" alt="">
    <p class="title">即买即送</p>
    <p class="trans">免运费，线下直送，货到付款</p>
  </div>
  <div class="card">
    <img src="images/种类.png" alt="" style="width: 130px; margin: 25px 45px;">
    <p class="title">货源充足</p>
    <p class="trans">种类涵盖各类学科，资源多，种类齐</p>
  </div>
  <div class="card">
    <img src="images/交易.png" alt="" style="width: 130px; margin: 24px 45px;">
    <p class="title" style="margin-top: 7px;">安全交易</p>
    <p class="trans">拒绝诈骗，财产安全有保障</p>
  </div>
</div>
<!--底部 start-->
<div class="clear"></div>
<div class="footer">
  <div class="foot_line"></div>
  <p align="center" class="padding-top">版权区</p>
  <div class="clear"></div>
</div>
<!--底部 end-->

<script>
  // 菜单栏动画
  layui.use('element', function () {
    var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
    //监听导航点击
    element.on('nav(demo)', function (elem) {
      //console.log(elem)
      layer.msg(elem.text());
    });
  });
  // 图片轮播
  layui.use(['carousel', 'form'], function () {
    var carousel = layui.carousel
            , form = layui.form;

    //常规轮播
    carousel.render({
      elem: '#test1'
      , arrow: 'always'
    });
    var ins3 = carousel.render({
      elem: '#test3'
      , width: '535px'
      , height: '540px'
      , interval: 2500
    });
    carousel.on('change(test4)', function (res) {
      console.log(res)
    });
    var $ = layui.$, active = {
      set: function (othis) {
        var THIS = 'layui-bg-normal'
                , key = othis.data('key')
                , options = {};

        othis.css('background-color', '#5FB878').siblings().removeAttr('style');
        options[key] = othis.data('value');
        ins3.reload(options);
      }
    };
    $('.demoTest .layui-btn').on('click', function () {
      var othis = $(this), type = othis.data('type');
      active[type] ? active[type].call(this, othis) : '';
    });
  });
  //选项卡
  layui.use('element', function () {
    var element = layui.element;
  });

  // 回到顶部按钮
  $(window).scroll(function () {
    if ($(window).scrollTop() > 760) {
      // 淡入（时长）
      $('#gotoTop').fadeIn(500);
    }
    // 淡出（时长）
    else { $('#gotoTop').fadeOut(500); }
  })
  // 点击按钮，使得页面返回顶部
  $("#gotoTop").click(function () {
    // { scrollTop: 0 }规定产生动画效果的 CSS 样式和值
    $('body,html').animate({ scrollTop: 0 }, 1000);
  });

  $(function(){
    if(window.history && window.history.pushState){
      $(window).on("popstate", function(){
        window.history.pushState("forward", null, "#");
        window.history.forward(1);
      });
    }
    window.history.pushState("forward", null, "#"); //在IE中必须得有这两行
    window.history.forward(1);
  });

</script>
</body>

</html>