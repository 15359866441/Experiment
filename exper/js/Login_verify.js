function check(){
    var userName = document.getElementsByClassName("inp")[0];
    var pwd = document.getElementsByClassName("inp")[1];
    if(userName.value==""){
        // alert("请输入用户名或手机号！");
        layer.msg('请输入用户名或手机号！', {
            icon: 0,
            time: 1200
        });
        $('.layui-layer').css({'top':'282px'});
        userName.focus();
        return false;
    }
    else if(pwd.value==""){
        layer.msg('请输入密码！', {
            icon: 0,
            time: 1200
        });
        $('.layui-layer').css({'top':'282px'});
        pwd.focus();
        return false;
    }
    else return true;
}

// 窗口加载完毕时，完成事件绑定
window.onload = function () {
	//为表单绑定表单提交事件处理函数
	var myform=document.forms[0];
	myform.onsubmit=check;
};