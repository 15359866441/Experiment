// 以下函数仅在输入的过程中对用户进行提示，并不阻碍提交
// 控制密码长度和密码的确认
function check() {
    var pas1, pas2;
    pas1 = document.getElementById("pass").value;
    pas2 = document.getElementById("pass_ch").value;
    if(pas1.length>=6&&(/\d/.test(pas1)&&/[a-z]/i.test(pas1))){
        document.getElementById("remind1").innerHTML="";
    }
    else if(pas1.length < 6||!(/\d/.test(pas1)&&/[a-z]/i.test(pas1))) {
        // 当密码长度小于6位时提示
        // .innerHTML表示设置标签（remind1）内的HTML内容
        document.getElementById("remind1").innerHTML = "<font color='red'>提示：密码由字母和数字组成且长度不少于6个字符</font>";
    }

    if(pas1!=pas2 && pas2.length!=0) {
        document.getElementById("remind2").innerHTML = "<font color='red'>提示：密码输入不一致</font>";
    }
    else{
        document.getElementById("remind2").innerHTML = "";
    }
}
// 验证电话号码
function checkphone(){
    var phone_num = document.getElementById("phone_num").value;
    if(!(/1[3|4|5|8][0-9]{9}/.test(phone_num))&&phone_num.length!=0){
        document.getElementById("phone_tip").innerHTML = "<font color='red' >提示：手机号格式错误</font>";
    }
    else{
        document.getElementById("phone_tip").innerHTML = "";
    }
}
// 验证学号
function checksno(){
    var sno_num = document.getElementById("sno_num").value;
    if(!(/2019[0-9]{3}/.test(sno_num))&&sno_num.length!=0){
        document.getElementById("sno_tip").innerHTML = "<font color='red'>提示：学号格式需为2019XXX</font>";
    }
    else{
        document.getElementById("sno_tip").innerHTML = "";
    }
}


// 以下函数会阻碍表单中不合法数据的提交
function checkUserName(){
    var userName=document.getElementById("userName");
    if(userName.value=="")	{
        // alert("请输入用户名！");
        layer.msg('请输入用户名！', {
            icon: 5,
            time: 1200
        });
        $('.layui-layer').css({'top':'300px'});
        userName.focus();
        return false;
    }
    else{
        return true;
    }
}

function Checknumber(){
    var phone_num = document.getElementById("phone_num");
    var sno_num = document.getElementById("sno_num");
    if(phone_num.value==""){
        layer.msg('请输入手机号！', {
            icon: 5,
            time: 1200
        });
        $(".layui-layer").css({'top':'300px'});
        phone_num.focus();
        return false;
    }
    else if(!(/1[3|4|5|8][0-9]{9}/.test(phone_num.value))){
        layer.msg('手机号格式错误，请检查输入！', {
            icon: 5,
            time: 1200
        });
        $(".layui-layer").css({'top':'300px'});
        phone_num.focus();
        return false;
    }
    else if(sno_num.value==""){
        layer.msg('请输入学号！', {
            icon: 5,
            time: 1200
        });
        $(".layui-layer").css({'top':'300px'});
        sno_num.focus();
        return false;
    }
    else if(!(/2019[0-9]{3}/.test(sno_num.value))){
        layer.msg('学号格式错误，请检查输入！', {
            icon: 5,
            time: 1200
        });
        $(".layui-layer").css({'top':'300px'});
        sno_num.focus();
        return false;
    }
    else return true;
}

//验证密码和确认密码是否有效
function checkPassword(){
    var userPwd=document.getElementById("pass");
    var userRePwd=document.getElementById("pass_ch");
    if(userPwd.value==""){
        layer.msg('请设置登录密码！', {
            icon: 5,
            time: 1200
        });
        $(".layui-layer").css({'top':'300px'});
        userPwd.focus();
        return false;
    }
    else if(userPwd.value.length<6||userPwd.value.length>12){
        layer.msg('密码长度为6-12位，请检查输入！', {
            icon: 5,
            time: 1200
        });
        $(".layui-layer").css({'top':'300px'});
        userPwd.focus();
        return false;
    }else if(userPwd.value!=userRePwd.value){
        layer.msg('密码输入不一致！', {
            icon: 5,
            time: 1200
        });
        $(".layui-layer").css({'top':'300px'});
        userRePwd.focus();
        return false;
    }
    // 密码由字母、数字和符号的两种以上组合
    // 三种组合：数字和字母、数字和符号、字母和符号
    // 匹配字母时忽略大小写
    if(/\d/.test(userPwd.value)&&/[a-z]/i.test(userPwd.value))
    {
        return true;
    }else{
        layer.msg('密码须为字母和数字的组合！', {
            icon: 5,
            time: 1200
        });
        $(".layui-layer").css({'top':'300px'});
        userRePwd.focus();
        return false;
    }
}

//表单提交时，触发该函数
function checkForm(){
    return checkUserName()&&Checknumber()&&checkPassword();
}

// 窗口加载完毕时，完成事件绑定
window.onload = function () {
    //为表单绑定表单提交事件处理函数
    var myform=document.forms[0];
    myform.onsubmit=checkForm;
    initCollege();
    college.onchange = collegeChange;
};

//实现浏览器与服务器的局部信息交换，从而实现用户名的注册提示
function showHint(str) {
    //1.创建异步对象
    var xmlhttp = new XMLHttpRequest();

    //2.绑定事件
    xmlhttp.onreadystatechange = function(){
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
            // 若响应成功将文本框内容传入
            document.getElementById("showNameInfo").innerHTML = xmlhttp.responseText;
        }
    }

    //3.初始化参数
    xmlhttp.open("GET","checkUserServlet?username="+str,true);

    //发送请求
    xmlhttp.send();
}

//下拉选择框的级联选择
var colleges=["计算机工程学院", "财经学院","师范学院"];
var majors =[["智能科学与技术", "软件工程","计算机科学与技术","网络工程"],["财政学", "金融学","国际经济与贸易","经济学"],
    ["教育学","心理学","学前教育","教育技术"]];
//此处的两个变量不涉及到在网页中的直接输出，因此可不必赋初值（空值（‘’））
var college,major;
//初始化省份下拉列表
function initCollege(){
    //获取表单中的省、市、区元素
    college=document.getElementById("college");
    major=document.getElementById("major");
    college.options.length=1;
    for(var i=0; i<colleges.length; i++){
        var option=new Option(colleges[i],colleges[i]);
        college.options.add(option);
    }
}

//选择省份时触发
function collegeChange(){
    //对城市下拉列表进行初始化，使其拥有初始的一个元素（请选择XXX）
    major.options.length=1;
    // selectedIndex 属性可设置或返回下拉列表中被选选项的索引号
    if(college.selectedIndex==0){
        return;
    }
    //注意：选项的下标是从1开始(第0个设置为提醒（如请选择XXX）)的，数组的下标是从0开始的
    var pIndex=college.selectedIndex;
    for(var i=0; i<majors[pIndex-1].length; i++){
        // 选择与一级对应的二级选择
        var optionValue=majors[pIndex-1][i];
        // Option()构造函数接受两个参数：文本(text)和值(value);第二个参数可选
        var option=new Option(optionValue,optionValue);
        major.options.add(option);
    }
}