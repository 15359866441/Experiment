//数量变化
function addNum(){
    var sum = document.getElementById("sum").innerHTML;
    if(document.getElementById("num").value>sum-1){
        alert("您的购买数量已达上限！");
        return false;
    }
    else{

        var newAddNum = document.getElementById("num").value=parseInt(document.getElementById("num").value)+1;
        sumAddPrice(newAddNum);
    }
}
function subNum(){
    if(document.getElementById("num").value<2){
        alert("商品数量不能小于1件！");
        return false;
    }
    else{
        var newSubNum = document.getElementById("num").value=document.getElementById("num").value-1;
        sumSubPrice(newSubNum);
    }
}
//总价格计算
function sumAddPrice(newAddNum){
    var item_price = document.getElementById("item_price").innerHTML;
    // alert("添加数量时初始价格："+item_price);
    document.getElementById("sumPrice").innerHTML=item_price*newAddNum;
    var total=document.getElementById("sumPrice").innerHTML;
    toDecimal2(total);
}
function sumSubPrice(newSubNum){
    var item_price = document.getElementById("item_price").innerHTML;
    document.getElementById("sumPrice").innerHTML=item_price*newSubNum;
    var total=document.getElementById("sumPrice").innerHTML;
    toDecimal2(total);
}
//总价格保留两位小数
function toDecimal2(total) {
    var f = parseFloat(total);
    var f = Math.round(total*100)/100;
    var s = f.toString();
    var rs = s.indexOf('.');
    if (rs < 0) {
        rs = s.length;
        s += '.';
    }
    while (s.length <= rs + 2) {
        s += '0';
    }
    document.getElementById("sumPrice").innerHTML=s;
}


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
window.onload=forbid;