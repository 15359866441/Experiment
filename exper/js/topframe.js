function date() {
    // 创建日期对象
    var time = new Date();

    /*格式化日，如果小于9，则补0*/
    var day = ("0" + time.getDate()).slice(-2);

    /*格式化月，如果小于9，则补0*/
    var month = ("0" + (time.getMonth() + 1)).slice(-2);

    var weeks = new Array(" 星期日", " 星期一", " 星期二", " 星期三", " 星期四", " 星期五", " 星期六");
    var weekday = time.getDay();

    /*拼接日期*/
    var today = time.getFullYear() + "-" + month + "-" + day + weeks[weekday];

    document.getElementById("current_date").innerHTML = today;
}
window.onload = date;
