 var autoTextarea = function (elem, extra, maxHeight) {
        extra = extra || 0;
        var isFirefox = !!document.getBoxObjectFor || 'mozInnerScreenX' in window,
            isOpera = !!window.opera && !!window.opera.toString().indexOf('Opera'),
            addEvent = function (type, callback) {
                elem.addEventListener ?
                    elem.addEventListener(type, callback, false) :
                    elem.attachEvent('on' + type, callback);
            },
            getStyle = elem.currentStyle ? function (name) {
                var val = elem.currentStyle[name];

                if (name === 'height' && val.search(/px/i) !== 1) {
                    var rect = elem.getBoundingClientRect();
                    return rect.bottom - rect.top -
                        parseFloat(getStyle('paddingTop')) -
                        parseFloat(getStyle('paddingBottom')) + 'px';
                };

                return val;
            } : function (name) {
                return getComputedStyle(elem, null)[name];
            },
            minHeight = parseFloat(getStyle('height'));

        elem.style.resize = 'none';

        var change = function () {
            var scrollTop, height,
                padding = 0,
                style = elem.style;

            if (elem._length === elem.value.length) return;
            elem._length = elem.value.length;

            if (!isFirefox && !isOpera) {
                padding = parseInt(getStyle('paddingTop')) + parseInt(getStyle('paddingBottom'));
            };
            scrollTop = document.body.scrollTop || document.documentElement.scrollTop;

            elem.style.height = minHeight + 'px';
            if (elem.scrollHeight > minHeight) {
                if (maxHeight && elem.scrollHeight > maxHeight) {
                    height = maxHeight - padding;
                    style.overflowY = 'auto';
                } else {
                    height = elem.scrollHeight - padding;
                    style.overflowY = 'hidden';
                };
                style.height = height + extra + 'px';
                scrollTop += parseInt(style.height) - elem.currHeight;
                document.body.scrollTop = scrollTop;
                document.documentElement.scrollTop = scrollTop;
                elem.currHeight = parseInt(style.height);
            };
        };

        addEvent('propertychange', change);
        addEvent('input', change);
        addEvent('focus', change);
        change();
    }


function send_dynamic() {
    var username = document.getElementById("name").innerHTML;
    var text = document.getElementById("textarea1").value;
    if (username==""){
        layer.msg('??????????????????????????????', {
            icon: 2,
            time: 1200
        });
        $(".layui-layer").css({'top':'250px'});
        return false;
    }
    if (text==""){
        layer.msg('??????????????????', {
            icon: 2,
            time: 1200
        });
        $(".layui-layer").css({'top':'250px'});
        return false;
    }
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function(){
        //???????????????
        console.log("readyState??????????????????:"+xhr.readyState+",   status???"+xhr.status);
        if(xhr.readyState==4 && xhr.status==200){
            var data = xhr.responseText;
            if (data==1){
                // alert("???????????????");
                // window.location="comment.jsp";
                layer.msg('????????????', {
                    icon: 1,
                    time: 1500
                },function(){
                    window.location="comment.jsp";
                });
                $(".layui-layer").css({'top':'250px'});

            }
            else{
                alert("??????????????????????????????");
                window.location="comment.jsp";
            }
        }
    }

    var name = document.getElementById("name").innerHTML;
    var content = document.getElementById("textarea1").value;
    var profile_pic = document.getElementById("profile_pic").innerHTML;
    var searcht = /??????|??????|??????/;
    var result = content.search(searcht);
    if(result!=-1){
        alert("????????????????????????????????????");
        return false;
    }
    // alert(quantity+", "+order_price+", "+username+", "+identifier);
    var param = "addartServlet?name="+name+"&content="+content+"&profile_pic="+profile_pic;
    console.log("param??????"+param);

    // ?????????????????????
    xhr.open("get",param,true);
    xhr.send();
}

// ??????????????????
function checkout(){
    layer.confirm('????????????????????????', {icon: 3, title: '????????????'}, function (index) {
        window.location = "LogoutServlet";
        //??????????????????????????????href??????????????????????????????
        // document.getElementById("checkout").href="LogoutServlet";

        // ??????????????????????????????
        layer.close(index);
    });
    // ????????????????????????top???1558.32px?????????????????????????????????????????????????????????????????????
    $(".layui-layer").css({'top': '240px'});
}

