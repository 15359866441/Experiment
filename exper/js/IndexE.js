// 使用json的方式创建一个对象实例，其中含有三个属性，不含方法
var JSONData = {
    srcPath: "images/",
    data: [{ href: "#", src: "book2.jpg", price: 12.80, quantity:9 },
        { href: "#", src: "book2.jpg", price: 8.00, quantity:2 },
        { href: "#", src: "book3.jpg", price: 7.50, quantity:4 },
        { href: "#", src: "book1n.jpg", price: 16.90, quantity:10 },
        { href: "#", src: "combook1.jpg", price: 22.50, quantity:5 },
        { href: "#", src: "combook2.jpg", price: 18.99, quantity:8 },
        { href: "#", src: "combook3.jpg", price: 16.20, quantity:3 },
        { href: "#", src: "combook4.jpg", price: 12.30,quantity:9 },]
};
//指定窗口加载完毕时，调用的函数
window.onload = showHotAdvise;

//设置定时器，定时更新热门推荐信息
window.setInterval("showHotAdvise()", 2500);

//显示热门推荐信息
function showHotAdvise() {
    var adviseContent='';
    var turnShow = getRandomNum(6, 0, 8);
    for (var i = 0; i < turnShow.length; i++) {
        var index = turnShow[i];
        adviseContent = adviseContent + '<div class="gue_like_card"><a href="' + JSONData.data[index].href
            + '"><img src="' + JSONData.srcPath + JSONData.data[index].src
            + '"/></a><p class="gue_like_price">￥'
            + JSONData.data[index].price + '</p><p class="sell">月销'+JSONData.data[index].quantity+'</p></div>';
    }
    document.getElementsByClassName("gue_like")[0].innerHTML = adviseContent;
}
//返回num个不重复的随机数,范围在minNum~maxNum之间
function getRandomNum(num, minNum, maxNum) {
    // 数组对象
    var array = new Array();
    for (var i = 0; i < num; i++) {
        do {
            // 对数字进行下取整
            var randomNum = Math.floor(Math.random() * maxNum + minNum);
            if (!checkNum(array, randomNum)) {
                array.push(randomNum);
                break;
            }
        } while (true);
    }
    return array;
}
// 该函数确保返回的随机数数组中不含有重复的数字
function checkNum(array, num) {
    for (var i = 0; i < array.length; i++) {
        if (array[i] == num) {
            return true;
        }
    }
    return false;
}

//
function islog(){

    layer.confirm('您还未登陆，请先登陆',{btn: ['去登录','再看看']}, function (index) {
        window.location = "LoginE.jsp";
        // 执行完之后关闭确认框
        layer.close(index);
    });
    // 此时的弹出框默认top：1558.32px偏大，因此弹出框弹出后无法看到，需手动进行更改
    $(".layui-layer").css({'top': '240px'});
}