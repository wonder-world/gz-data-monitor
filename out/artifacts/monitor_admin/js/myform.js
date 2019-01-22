/**
 * 主要是针对form表单所做的一些处理
 */
ModalForm = function () {
    //自身的指针
    var me = this;
    // //公有变量
    // me.test = "myTest";
    // // 公有方法
    // me.retrieve = function() {
    //     processDisplayData();
    // };
    // //私有变量
    // var ajaxId = "introducerService";
    // //私有方法
    // function processDisplayData() {}

    me.fillModalForm = function ($form, json) {
        var jsonObj = json;
        if (typeof json === 'string') {
            jsonObj = $.parseJSON(json);
        }
        for (var key in jsonObj) { // 遍历json字符串
            var objtype = jsonObjType(jsonObj[key]); // 获取值类型
            if (objtype === "array") { // 如果是数组，一般都是数据库中多对多关系
                var obj1 = jsonObj[key];
                for (var arraykey in obj1) {
                    // alert(arraykey + jsonObj[arraykey]);
                    var arrayobj = obj1[arraykey];
                    for (var smallkey in arrayobj) {
                        setCkb(key, arrayobj[smallkey]);
                        break;
                    }
                }
            } else if (objtype === "object") { // 如果是对象，啥都不错，大多数情况下，会有 xxxId
                // 这样的字段作为外键表的id

            } else if (objtype === "string") { // 如果是字符串
                var str = jsonObj[key];
                var date = new Date(str);
                if (date.getDay()) { // 这种判断日期是本人懒，不想写代码了，大家慎用。
                    $("[name=" + key + "]", $form).val(str);
                    continue;
                }

                var tagobjs = $("[name=" + key + "]", $form);
                if ($(tagobjs[0]).attr("type") == "radio") {// 如果是radio控件
                    $.each(tagobjs, function (keyobj, value) {
                        if ($(value).attr("val") == jsonObj[key]) {
                            value.checked = true;
                        }
                    });
                    continue;
                }
                $("[name=" + key + "]", $form).val(jsonObj[key]);
            } else { // 其他的直接赋值
                $("[name=" + key + "]", $form).val(jsonObj[key]);
            }
        }
    };

    var setCkb = function (name, value) {
        // alert(name + " " + value);
        // $("[name=" + name + "][value=" + value + "]").attr("checked", "checked");
        // 不知为何找不到具体标签;
        $("[name=" + name + "][val=" + value + "]").attr("checked", "checked");
    };

    var fillckb = function (name, json) {
        var jsonObj = json;
        if (typeof json === 'string') {
            jsonObj = $.parseJSON(json);
        }
        var str = jsonObj[name];
        if (typeof str === "string") {
            var array = str.split(",");
            $.each(array, function (key, value) {
                setCkb(name, value);
            });
        }
    };

    var jsonObjType = function (obj) {
        if (typeof obj === "object") {
            var teststr = JSON.stringify(obj);
            if (teststr[0] == '{' && teststr[teststr.length - 1] == '}')
                return "class";
            if (teststr[0] == '[' && teststr[teststr.length - 1] == ']')
                return "array";
        }
        return typeof obj;
    };

};









function SetGridBtn(g_tb, g_mf, fm, arr, key) {
    this.g_tb = g_tb;
    this.g_mf = g_mf;
    this.fm = fm;
    this.arr = arr;
    this.key = key ? key : 'id';

    this.setModalForm = function (is_readonly) {
        var btnCancelText = is_readonly ? '关闭' : '取消';
        this.fm.find('input,textarea,select').attr('disabled', is_readonly);
        $('#btn_cancel').html('<i class="ace-icon fa fa-times"></i>' + btnCancelText + '');
        $('#btn_submit').css('display', is_readonly ? 'none' : 'inline-block');
        this.g_mf.modal({backdrop: 'static', keyboard: false, show: true});
    };
}

SetGridBtn.prototype.openAdding = function () {
    this.fm[0].reset();
    this.setModalForm(false);
};
SetGridBtn.prototype.openDeleting = function (r_id) {
    if (!r_id) r_id = this.g_tb.jqGrid("getGridParam", "selrow");
    alert(r_id);
};
SetGridBtn.prototype.openUpdating = function (r_id) {
    if (!r_id) r_id = this.g_tb.jqGrid("getGridParam", "selrow");
    for (var i = 0; i < this.arr.length; i++) {
        var data = this.arr[i];
        if (data[this.key] == r_id) {
            var mf = new ModalForm();
            mf.fillModalForm(this.fm, data);
            this.setModalForm(false);
        }
    }
};
SetGridBtn.prototype.openLooking = function (r_id) {
    if (!r_id) r_id = this.g_tb.jqGrid("getGridParam", "selrow");
    for (var i = 0; i < this.arr.length; i++) {
        var data = this.arr[i];
        if (data[this.key] == r_id) {
            var mf = new ModalForm();
            mf.fillModalForm(this.fm, data);
            this.setModalForm(true);
        }
    }
};

SetGridBtn.prototype.lookForm = function (g_tb, g_mf, r_id, fm, arr, key) {
    if (!r_id) r_id = g_tb.jqGrid("getGridParam", "selrow");
    for (var i = 0; i < arr.length; i++) {
        var data = arr[i];
        if (data[key] == r_id) {
            var mf = new ModalForm();
            mf.fillModalForm(fm, data);
            fm.find('input,textarea,select').attr('disabled', true);
            $('#btn_cancel').html('<i class="ace-icon fa fa-times"></i>关闭');
            $('#btn_submit').css('display', 'none');
            g_mf.modal({backdrop: 'static', keyboard: false, show: true});
        }
    }
};

function showClock(i, is_week) {
    var myArray = new Array(7);
    var TD = new Date();
    myArray[0] = "星期日";
    myArray[1] = "星期一";
    myArray[2] = "星期二";
    myArray[3] = "星期三";
    myArray[4] = "星期四";
    myArray[5] = "星期五";
    myArray[6] = "星期六";
    var weekday = TD.getDay();
    var h = TD.getHours();
    var m = TD.getMinutes();
    var s = TD.getSeconds();
    var hstr = h;
    var mstr = m;
    var istr = s;
    if (h < 10) {
        hstr = "0" + h;
    }
    if (m < 10) {
        mstr = "0" + m;
    }
    if (s < 10) {
        istr = "0" + s;
    }
    if (is_week) i.html(new Date().toLocaleDateString() + " " + hstr + ":" + mstr + ":" + istr + " " + myArray[weekday]);
    i.html(new Date().toLocaleDateString() + " " + hstr + ":" + mstr + ":" + istr);
    setTimeout(showClock(i, is_week), 1000);
}

//////////////////////////////////////////////////////////////////////
//显示系统当前时间处理 第二种方法：
//////////////////////////////////////////////////////////////////////
// function Clock() {
//     var date = new Date();
//     this.year = date.getFullYear();
//     this.month = date.getMonth() + 1;
//     this.date = date.getDate();
//     this.day = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")[date.getDay()];
//     this.hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
//     this.minute = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
//     this.second = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
//
//     this.toString = function () {
//         // return this.year + "年" + this.month + "月" + this.date + "日 " + this.hour + ":" + this.minute + ":" + this.second;
//         return this.year + "年" + this.month + "月" + this.date + "日 " + this.hour + ":"
//             + this.minute + ":" + this.second + " " + this.day;
//     };
//
//     this.toSimpleDate = function () {
//         return this.year + "-" + this.month + "-" + this.date;
//     };
//
//     this.toDetailDate = function () {
//         return this.year + "-" + this.month + "-" + this.date + " " + this.hour + ":"
//             + this.minute + ":" + this.second;
//     };
//
//     this.showDate = function (ele) {
//         var clock = new Clock();
//         ele.html(clock.toSimpleDate());
//         // window.setTimeout(function () {
//         //     clock.showDate(ele);
//         // }, 1000);
//     };
//     this.showTime = function (ele) {
//         var clock = new Clock();
//         ele.html(clock.toDetailDate());
//         window.setTimeout(function () {
//             clock.showTime(ele);
//         }, 1000);
//     };
//     this.showWeek = function (ele) {
//         var clock = new Clock();
//         ele.html(clock.toString());
//         window.setTimeout(function () {
//             clock.showWeek(ele);
//         }, 1000);
//     };
// }
//
// $(function () {
//     var clock = new Clock();
//     clock.showTime($("#i_clock"));
//
//
// });
//
// function setIframe(url) {
//     $("#iframe_main").attr("src", url);
// }

//
// var openDialog4Adding = function () {
//     $form_ykgl[0].reset();
//     setModalForm(false);
// };
//
// var openDialog4Updating = function (rowid) {
//     if (!rowid) rowid = $grid_table.jqGrid("getGridParam", "selrow");
//     //alert(rowid);
//     for (var i = 0; i < grid_data.length; i++) {
//         var data = grid_data[i];
//         if (data.id == rowid) {
//             var mf = new ModalForm();
//             mf.fillModalForm($form_ykgl, data);
//             setModalForm(false);
//         }
//     }
// };
//
// var openDialog4Looking = function (rowid) {
//     if (!rowid) rowid = $grid_table.jqGrid("getGridParam", "selrow");
//     for (var i = 0; i < grid_data.length; i++) {
//         var data = grid_data[i];
//         if (data.id == rowid) {
//             var mf = new ModalForm();
//             mf.fillModalForm($form_ykgl, data);
//             setModalForm(true);
//         }
//     }
// };
//
// var openDialog4Deleting = function (rowid) {
//     if (!rowid) rowid = $grid_table.jqGrid("getGridParam", "selrow");
//     //alert(rowid);
// };
//
// var setModalForm = function (is_readonly) {
//     var btnCancelText = is_readonly ? '关闭' : '取消';
//     $form_ykgl.find('input,textarea,select').attr('disabled', is_readonly);
//     $('#btn_cancel').html('<i class="ace-icon fa fa-times"></i>' + btnCancelText + '');
//     $('#btn_submit').css('display', is_readonly ? 'none' : 'inline-block');
//     $modal_form.modal({backdrop: 'static', keyboard: false, show: true});
// };