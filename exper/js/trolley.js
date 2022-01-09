function decide(){
    if(confirm("确定删除本条数据吗？")){
    return true;
}
    else
    return false;
}

    // 判断是否退出
function checkout(){
    layer.confirm('确认退出登陆吗？', {icon: 3, title: '网页提示'}, function (index) {
        window.location = "LogoutServlet";
        // 执行完之后关闭确认框
        layer.close(index);
    });
    // 此时的弹出框默认top：1558.32px偏大，因此弹出框弹出后无法看到，需手动进行更改
    $(".layui-layer").css({'top': '240px'});
}

function checkbuy(){
    var bol = confirm("确认结算吗？");
    if (!bol)
    return false;
    else return true;
}

function checkedEmpty() {
    var depiction = document.getElementById("suppliers").textContent;
    var empty = document.getElementById("empty");
    if(depiction != ""){
        empty.style.display = "none";
    }
}
window.onload=checkedEmpty;