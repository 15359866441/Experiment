function forbid(){
    var log = document.getElementById("log");
    var reg = document.getElementById("reg");
    var profile = document.getElementById("profile");
    var username = document.getElementById("username").innerHTML;
    if(username==""){
        profile.style.visibility="hidden";
    }
    else {
        log.style.visibility="hidden";
        reg.style.visibility="hidden";
    }
}

window.onload = function (){
    forbid();
    // checkprice();
}

function islog(){
    var username = document.getElementById("username").innerHTML;
    if (username==""){
        alert("请先登录");
        return false;
    }
}

function checkout(){
    layer.confirm('确认退出登陆吗？', {icon: 3, title: '网页提示'}, function (index) {
        window.location = "LogoutServlet";
        layer.close(index);
    });
    // 此时的弹出框默认top：1558.32px偏大，因此弹出框弹出后无法看到，需手动进行更改
    $(".layui-layer").css({'top': '240px'});

}