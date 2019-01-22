/**
 *
 * 修改gird 底部 分页按钮图标
 *
 * @param table
 */
function updatePagerIcons(table, page) {
    var replacement = {
        'ui-icon-seek-first': 'ace-icon fa fa-angle-double-left bigger-140',
        'ui-icon-seek-prev': 'ace-icon fa fa-angle-left bigger-140',
        'ui-icon-seek-next': 'ace-icon fa fa-angle-right bigger-140',
        'ui-icon-seek-end': 'ace-icon fa fa-angle-double-right bigger-140'
    };
    $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function () {
        var icon = $(this);
        var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

        if ($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
    });
    if (page != null) {
        $(page + "_left").css("width", '450px');
    } else {
        $("#grid_pager_left").css("width", '450px');
    }
}

/**
 * 初始化页面中日期选择问题
 */
function initView() {
    $('.date-picker').datepicker({
        autoclose: true, todayHighlight: true
    }).next().on(ace.click_event, function () {
        $(this).prev().focus();
    });
}


/**
 * 添加表格标题提示
 * @param table
 * @param val
 */
function addCaptionTips(table, val1) {
    var val = (val1 != null && val1 !== undefined) ? val1 : $(".ui-jqgrid-title").text();
    var titleTips = val + "<span class='title-tip'>提示：双击查看或勾选后点击查看</span>";
    $(table).jqGrid("setCaption", titleTips);
}

function toggleDiv($btn, $div) {
    $div.toggle(500, function () {
        if ($div.is(":hidden")) {
            $btn.text('显示搜索条件');
        } else {
            $btn.text('隐藏搜索条件');
        }
    });
}

String.prototype.trimLR = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
};
String.prototype.trimL = function () {
    return this.replace(/(^\s*)/g, "");
};
String.prototype.trimR = function () {
    return this.replace(/(\s*$)/g, "");
};
String.prototype.trimA = function () {
    return this.replace(/\s+/g, "");
};

function formatStr(str) {
    if (str != null && str != 'undefined' && str != '') {
        return str;
    } else {
        return "";
    }
}

// Date.prototype.Format = function (fmt) { //
//     var o = {
//         "M+": this.getMonth() + 1, //Month
//         "d+": this.getDate(), //Day
//         "h+": this.getHours(), //Hour
//         "m+": this.getMinutes(), //Minute
//         "s+": this.getSeconds(), //Second
//         "q+": Math.floor((this.getMonth() + 3) / 3), //Season
//         "S": this.getMilliseconds() //millesecond
//     };
//     if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() +
//
//         "").substr(4 - RegExp.$1.length));
//     for (var k in o)
//         if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1,
//
//             (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
//     return fmt;
// };
function isNotEmpty(obj) {
    if (obj != null && obj != 'undefined' && obj != '') {
        return true;
    } else {
        return false;
    }
};
function isNullObject(obj) {
    for (var p in obj) {
        if (obj.hasOwnProperty(p)) {
            return false;  //有自有属性或方法，返回false
        }
    }
    return true;  //没有自有属性或方法，返回true，该对象是空对象
}

/**
 * 获取数组中某个元素的下标
 * @param arr
 * @param obj
 * @returns {number}
 */
function getIndex(arr, obj) {
    var len = arr.length;
    for (var i = 0; i < len; i++) {
        if (arr[i] == obj) {
            return parseInt(i);
        }
    }
    return -1;
};

/**删除数组中的某一个对象
 * arr:数组
 * obj:需删除的对象
 */
function removeJsonFromArr(arr, obj, uk) {
    var length = arr.length;
    for (var i = 0; i < length; i++) {
        var ajs = arr[i];
        if (ajs[uk] == obj[uk]) {
            if (i == 0) {
                arr.shift(); //删除并返回数组的第一个元素
                return arr;
            } else if (i == length - 1) {
                arr.pop();  //删除并返回数组的最后一个元素
                return arr;
            } else {
                arr.splice(i, 1); //删除下标为i的元素
                return arr;
            }
        }
    }
}

/**删除数组中的某一个对象
 * arr:数组
 * obj:需删除的对象
 */
function removeObjById(arr, id, uk) {
    var length = arr.length;
    for (var i = 0; i < length; i++) {
        var ajs = arr[i];
        if (ajs[uk] == id) {
            if (i == 0) {
                arr.shift(); //删除并返回数组的第一个元素
                return arr;
            } else if (i == length - 1) {
                arr.pop();  //删除并返回数组的最后一个元素
                return arr;
            } else {
                arr.splice(i, 1); //删除下标为i的元素
                return arr;
            }
        }
    }
}


/**
 * 获取url 路径
 * @returns {string}
 */
function getPath() {
    //获取当前网址，如： http://localhost:8080/project-name/doc.jsp
    var curFullPath = window.document.location.href;
    //获取主机地址之后的目录，如： project-name/doc.jsp
    var pathName = window.document.location.pathname;
    var pos = curFullPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8080
    var localhostPath = curFullPath.substring(0, pos);
    //获取带"/"的项目名，如：/project-name
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    var path = localhostPath + projectName;
    return path;
}

/**
 * 设置iframe高度自适应内容
 * @param iframe
 */
function setIframeHeight(iframe) {
    if (iframe) {
        var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
        if (iframeWin.document.body) {
            iframe.height = (iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight);
        }
    }
};
/**
 * 药品搜索以及清空搜索内容
 */

function btnSearchDrug() {
    var path = getPath();
    var data = {
        dataStatus: '9',//只查询已审核的记录--%>
        groupName: $('#selGroupName').val().trimA(),
        drugNameCn: $('#selDrugNameCn').val().trimA(),
        mediName: $('#selMediName').val().trimA(),
        dosageForm: $('#selDosageForm').val().trimA(),
        convertPer: $('#selConvertPer').val().trimA(),
        drugSpec: $('#selDrugSpec').val().trimA(),
        approvalNumber: $('#selApprovalNumber').val().trimA(),
        packingSpecifications: $('#selPackingSpecifications').val().trimA()
    };

    $('#grid_table_drug').jqGrid('setGridParam', {
        url: path+'/drugInfo/queryDrugInfoPage.do',
        datatype: 'json',
        postData: data,
        page: 1
    }).trigger("reloadGrid"); //重新载入
}

function btnResetDrug() {
    $('#selGroupName').val("");
    $('#selDrugNameCn').val("");
    $('#selMediName').val("");
    $('#selApprovalNumber').val("");
    $('#selConvertPer').val("");
    $('#selPackingSpecifications').val("");
    $('#selDosageForm').val("");
    $('#selDrugSpec').val("");
}

/**
 * 1.根据json 数据填充form表单
 * 2.获取提交表单的数据
 *
 * 注：传入的form通过name属性进行数据获取和数据填充
 * @constructor
 */
FormHandler = function (form) {
    //自身的指针
    var me = this;

    me.fillForm = function (json) {
        var jsonObj = json;
        if (typeof json === 'string') {
            jsonObj = $.parseJSON(json);
        }
        for (var key in jsonObj) {//遍历json字符串
            var objType = jsonObjType(jsonObj[key]); //获取值类型
            var comps = $("[name=" + key + "]", form);//获取组件
            if (objType === "array") {//数组处理，一般都是数据库中多对多关系，比如：复选框等
                var obj1 = jsonObj[key];
                for (var oKey in obj1) {
                    var array = obj1[oKey];
                    for (var aKey in array) {
                        setCkb(aKey, array[aKey]);
                        break;
                    }
                }
            } else if (objType === "string") {//字符串处理，直接就是值类型
                // var str = jsonObj[key];
                // var date = new Date(str);
                // if (date.getDay()) { // 这种判断日期是本人懒，不想写代码了，大家慎用。
                //     comps.val(str);
                //     continue;
                // }
                if (comps.is("radio")) {// 如果组件是radio控件
                    $.each(comps, function (keyobj, value) {
                        if ($(value).attr("val") == jsonObj[key]) {
                            value.checked = true;
                        }
                    });
                    continue;
                } else if (comps.is("select")) {
                    var option = comps.find("option");
                    for (var i = 0; i < option.length; i++) {
                        var opVal = option.eq(i).val();//option中的值
                        if (opVal == jsonObj[key]) {
                            option.attr("selected", 'selected');
                            // alert(opVal+"---1---"+jsonObj[key])
                        }
                    }
                } else {
                    comps.val(jsonObj[key]);
                }
            } else if (objType === "object") {//对象处理，啥都不做，大多数情况下，会有 xxxId
                // 这样的字段作为外键表的id
            } else {//其他的直接赋值
                comps.val(jsonObj[key]);
            }
        }
    };

    me.fillForm2 = function (data) {
        return form.each(function () {
            var formElem, name;
            if (data == null) {
                this.reset();
                return;
            }
            for (var i = 0; i < this.length; i++) {
                formElem = this.elements[i];
                //checkbox的name可能是name[]数组形式
                name = (formElem.type == "checkbox") ? formElem.name.replace(/(.+)\[\]$/, "$1") : formElem.name;
                if (data[name] == undefined) continue;
                switch (formElem.type) {
                    case "checkbox":
                        if (data[name] == "") {
                            formElem.checked = false;
                        } else {
                            //数组查找元素
                            if (data[name].indexOf(formElem.value) > -1) {
                                formElem.checked = true;
                            } else {
                                formElem.checked = false;
                            }
                        }
                        break;
                    case "radio":
                        if (data[name] == "") {
                            formElem.checked = false;
                        } else if (formElem.value == data[name]) {
                            formElem.checked = true;
                        }
                        break;
                    case "button":
                        break;
                    default:
                        formElem.value = data[name];
                }
            }
        });
    };

    // 根据form表单的name属性获取值，因此name对应的数据key 必须唯一且固定
    me.submitForm = function () {
        var data = {};
        var arr = form.serializeArray();
        $.each(arr, function () {
            data[this.name] = this.value;
        });
        // alert(JSON.stringify(d));
        return data;
    };

    var setCkb = function (name, value) {
        // $("[name=" + name + "][value=" + value + "]").attr("checked", "checked");
        $("[name=" + name + "][val=" + value + "]").prop("checked", true);
    };

    var jsonObjType = function (obj) {
        if (typeof obj === "object") {
            var tStr = JSON.stringify(obj);
            if (tStr[0] == '{' && tStr[tStr.length - 1] == '}')
                return "class";
            if (tStr[0] == '[' && tStr[tStr.length - 1] == ']')
                return "array";
        }
        return typeof obj;
    };

};

/**
 * 对表格的工具按钮进行设置和事件监听
 *
 * model form 的弹出，
 * 新增数据，数据修改和查看
 * 数据的删除等；
 *
 *
 * @constructor
 */
GridBtn = function (g, mf, f) {
    var me = this;
    var path = getPath();
    var fh = new FormHandler(f);
    var al = new AlertTools();
    var key = 'id';
    var r_id = '';
    var is_new = true;

    var btnSubmit = $('#btn_submit');
    var btnCancel = $('#btn_cancel');

    me.add_url = '';
    me.del_url = '';
    me.update_url = '';
    me.view_url = '';
    me.grid_url = '';

    function setModalForm(is_readonly) {
        // var submit = btnSubmit;
        // var cancel = btnCancel;
        var btnCancelText = is_readonly ? '关闭' : '取消';
        if (is_readonly) {
            mf.find('input,textarea,select').attr('disabled', true);
            mf.find('select').addClass('sel-dis');
        } else {
            mf.find('input,textarea,select').attr('disabled', false);
            mf.find('select').removeClass('sel-dis');
        }
        // mf.find('input,textarea,select').attr('disabled', is_readonly);
        mf.on('hidden.bs.modal', function () {
            f[0].reset();
        });

        btnCancel.html('<i class="ace-icon fa fa-times"></i>' + btnCancelText + '');
        btnSubmit.css('display', is_readonly ? 'none' : 'inline-block');
        //backdrop: 'static',点击空白处关闭modal；keyboard: false,是否可拖动modal
        mf.modal({backdrop: 'static', keyboard: false, show: true});

        btnCancel.click(function () {//modal 取消事件
            f[0].reset();
            mf.modal('hide');
        });

        btnSubmit.off("click").on("click", (function () {//modal 提交事件
            //启用表单校验
            f.validate({
                ignore: ":hidden",//不验证的元素
                errorPlacement: function (er, el) {
                }
            });
            if (f.valid()) {
                $.ajax({
                    url: is_new ? me.add_url : me.update_url,
                    data: f.serialize(),
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        if (!data) {
                            data.type = false;
                            data.msg = "服务器数据获取失败！！"
                        }
                        if (data.type) {
                            f[0].reset();
                            mf.modal('hide');
                            g.trigger("reloadGrid");
                        }
                        al.show(data.type, data.msg);
                    },
                    error: function () {
                        al.show(false, "数据保存出错！！");
                    }
                });
            } else {
                al.show(false, "数据填写异常，请检查填写内容");
            }
        }));
    }

    me.setPath = function (add_url, del_url, update_url, view_url) {
        me.add_url = path + add_url;
        me.del_url = path + del_url;
        me.update_url = path + update_url;
        me.view_url = path + view_url;

    };
    me.setBtn = function (submitId, cancelId) {
        btnSubmit = submitId ? submitId : btnSubmit;
        btnCancel = cancelId ? cancelId : btnCancel;
    };
    me.add = function () {
        is_new = true;
        // f[0].reset();
        setModalForm(false);
    };
    me.delete = function (r_ids) {
        if (!r_ids) r_ids = g.jqGrid("getGridParam", "selarrrow");
        if (!r_ids) return;
        var cfm = confirm(" 您确定删除该数据？？？");
        if (cfm) {
            $.ajax({
                url: me.del_url,
                data: {ids: r_ids.toString()},
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (!data) {
                        data.type = false;
                        data.msg = "服务器数据获取失败！！"
                    }
                    al.show(data.type, data.msg);
                    g.trigger("reloadGrid");
                },
                error: function () {
                    al.show(false, "数据删除出错！！");
                }
            });
        }
    };
    me.update = function (r_id) {
        is_new = false;
        f[0].reset();
        if (!r_id) r_id = g.jqGrid("getGridParam", "selrow");
        if (!r_id) return;

        $.ajax({
            url: me.view_url,
            data: {id: r_id},
            type: "post",
            dataType: "json",
            success: function (data) {
                fh.fillForm(data);
                setModalForm(false);
            },
            error: function () {
                al.show(false, "数据查询出错！！");
            }
        });
    };
    me.view = function (r_id) {
        f[0].reset();
        if (!r_id) r_id = g.jqGrid("getGridParam", "selrow");
        if (!r_id) return;
        $.ajax({
            url: me.view_url,
            data: {id: r_id},
            type: "post",
            dataType: "json",
            success: function (data) {

                fh.fillForm(data);
                setModalForm(true);
            },
            error: function () {
                al.show(false, "数据查询出错！！");
            }
        });
    };

    me.search = function (data, url) {
        g.jqGrid('setGridParam', {
            url: path + url,//你的搜索程序地址
            datatype: 'json',
            postData: data, //发送数据
            page: 1
        }).trigger("reloadGrid"); //重新载入
    };
    me.reset = function (s) {
        $("#" + s + " :input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");
    }

};

/**
 * 弹出框限时显示
 *
 * @constructor
 */
AlertTools = function () {
    var me = this;

    function createDiv() {
        var _div = $('<div></div>');//创建一个父div
        _div.attr('id', 'msg');//给父div设置id
        _div.addClass('msg');//添加css样式
        _div.appendTo('body');//将父div添加到body中
    }

    me.show = function (success, msg, time) {
        var time = time ? time : 2000;
        var al = $('#msg');
        if (!(al.length < 0)) {
            createDiv();
        }
        if (msg == null || msg == "") {
            msg = "处理异常";
            success = false;
        }
        var _al = $('.msg').text(msg);
        if (success) {
            _al.addClass('msg-success').show().delay(time).fadeOut();
        } else {
            _al.addClass('msg-error').show().delay(time).fadeOut();
        }
    }
};

/**
 * 常用的时间工具
 * @constructor
 */
DateTools = function () {
    var me = this;

    /**
     * @param str 时间格式： 13:04:06
     * @returns {boolean}
     */
    me.isTime = function (str) {
        var a = str.match(/^(\d{1,2})(:)?(\d{1,2})\2(\d{1,2})$/);
        if (a == null || (a[1] > 24 || a[3] > 60 || a[4] > 60)) return false;
        return true;
    };
    /**
     * @param str 可以为2017-02-16，2017/02/16，2017.02.16
     * @returns {boolean} 返回该字符串是否是日期
     */
    me.isDate = function (str) {
        if (str.trim() == "") return false;
        str = str.replace(/\//g, "-").replace(/\./g, "-");
        var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
        if (r == null) return false;
        var d = new Date(r[1], r[3] - 1, r[4]);
        return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4]);
    };

    /**
     * @param str dateStr 可以为2017-02-16 12:12:12，2017/02/16 12:12:12，2017.02.16 12:12:12
     * @returns {boolean} 返回该字符串是否是日期时间格式
     */
    me.isDateTime = function strDateTime(str) {
        str = str.replace(/\//g, "-").replace(/\./g, "-");
        var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
        var r = str.match(reg);
        if (r == null) return false;
        var d = new Date(r[1], r[3] - 1, r[4], r[5], r[6], r[7]);
        return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4] && d.getHours() == r[5]
            && d.getMinutes() == r[6] && d.getSeconds() == r[7]);
    };

    /**
     * 日期解析，字符串转日期
     * @param str 可以为2017-02-16，2017/02/16，2017.02.16
     * @returns {Date} 返回对应的日期对象
     */
    me.parseDate = function (str) {
        var _BAR = "-", _SLASH = "/", _DOT = ".";
        var dateArr;
        if (str.indexOf(_BAR) > -1) {
            dateArr = str.split(_BAR);
        } else if (str.indexOf(_SLASH) > -1) {
            dateArr = str.split(_SLASH);
        } else {
            dateArr = str.split(_DOT);
        }
        return new Date(dateArr[0], dateArr[1] - 1, dateArr[2]);
    };

    /**
     * 将字符串解析成日期
     * @param str 输入的日期字符串，如'2014-09-13'
     * @param fmt 字符串格式，默认'yyyy-MM-dd'，支持如下：y、M、d、H、m、s、S，不支持w和q
     * @returns 解析后的Date类型日期
     */
    me.parseDateTime = function (str, fmt) {
        fmt = fmt || 'yyyy-MM-dd';
        var obj = {y: 0, M: 1, d: 0, H: 0, h: 0, m: 0, s: 0, S: 0};
        fmt.replace(/([^yMdHmsS]*?)(([yMdHmsS])\3*)([^yMdHmsS]*?)/g, function (m, $1, $2, $3, $4, idx, old) {
            str = str.replace(new RegExp($1 + '(\\d{' + $2.length + '})' + $4), function (_m, _$1) {
                obj[$3] = parseInt(_$1);
                return '';
            });
            return '';
        });
        obj.M--; // 月份是从0开始的，所以要减去1
        var date = new Date(obj.y, obj.M, obj.d, obj.H, obj.m, obj.s);
        if (obj.S !== 0) date.setMilliseconds(obj.S); // 如果设置了毫秒
        return date;
    };


    /**
     * 将日期格式化成指定格式的字符串
     * @param date 要格式化的日期，不传时默认当前时间，也可以是一个时间戳
     * @param fmt 目标字符串格式，支持的字符有：y,M,d,q,w,H,h,m,S，默认：yyyy-MM-dd HH:mm:ss
     * @returns 返回格式化后的日期字符串
     */
    me.formatDate = function (date, fmt) {
        date = date == undefined ? new Date() : date;
        date = typeof date == 'number' ? new Date(date) : date;
        fmt = fmt || 'yyyy-MM-dd HH:mm:ss';
        var obj = {
            'y': date.getFullYear(), // 年份，注意必须用getFullYear
            'M': date.getMonth() + 1, // 月份，注意是从0-11
            'd': date.getDate(), // 日期
            'q': Math.floor((date.getMonth() + 3) / 3), // 季度
            'w': date.getDay(), // 星期，注意是0-6
            'H': date.getHours(), // 24小时制
            'h': date.getHours() % 12 == 0 ? 12 : date.getHours() % 12, // 12小时制
            'm': date.getMinutes(), // 分钟
            's': date.getSeconds(), // 秒
            'S': date.getMilliseconds() // 毫秒
        };
        var week = ['天', '一', '二', '三', '四', '五', '六'];
        for (var i in obj) {
            fmt = fmt.replace(new RegExp(i + '+', 'g'), function (m) {
                var val = obj[i] + '';
                if (i == 'w') return (m.length > 2 ? '星期' : '周') + week[val];
                for (var j = 0, len = val.length; j < m.length - len; j++) val = '0' + val;
                return m.length == 1 ? val : val.substring(val.length - m.length);
            });
        }
        return fmt;
    };

    /**
     * 将一个日期格式化成友好格式，比如，1分钟以内的返回“刚刚”，
     * 当天的返回时分，当年的返回月日，否则，返回年月日
     * @param {Object} date
     */
    me.formatShortDate = function (date) {
        date = date || new Date();
        date = typeof date === 'number' ? new Date(date) : date;
        var now = new Date();
        if ((now.getTime() - date.getTime()) < 60 * 1000) return '刚刚'; // 1分钟以内视作“刚刚”
        var temp = this.formatDate(date, 'yyyy年M月d');
        if (temp == this.formatDate(now, 'yyyy年M月d')) return this.formatDate(date, 'HH:mm');
        if (date.getFullYear() == now.getFullYear()) return this.formatDate(date, 'M月d日');
        return temp;
    };
    /**
     * 将一段时长转换成友好格式，如：
     * 147->“2分27秒”
     * 1581->“26分21秒”
     * 15818->“4小时24分”
     * @param {Object} s
     */
    me.formatLongDate = function (s) {
        if (s < 60) return s + '秒';
        else if (s < 60 * 60) return (s - s % 60) / 60 + '分' + s % 60 + '秒';
        else if (s < 60 * 60 * 24) return (s - s % 3600) / 60 / 60 + '小时' + Math.round(s % 3600 / 60) + '分';
        return (s / 60 / 60 / 24).toFixed(1) + '天';
    };
    /**
     * 将时间转换成MM:SS形式
     */
    me.formatTimeToFriendly = function (second) {
        var m = Math.floor(second / 60);
        m = m < 10 ? ('0' + m) : m;
        var s = second % 60;
        s = s < 10 ? ('0' + s) : s;
        return m + ':' + s;
    };
    /**
     * 判断某一年是否是闰年
     * @param year 可以是一个date类型，也可以是一个int类型的年份，不传默认当前时间
     */
    me.isLeapYear = function (year) {
        if (year === undefined) year = new Date();
        if (year instanceof Date) year = year.getFullYear();
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    };
    /**
     * 获取某一年某一月的总天数，没有任何参数时获取当前月份的
     * 方式一：$.getMonthDays();
     * 方式二：$.getMonthDays(new Date());
     * 方式三：$.getMonthDays(2013, 12);
     */
    me.getMonthDays = function (date, month) {
        var y, m;
        if (date == undefined) date = new Date();
        if (date instanceof Date) {
            y = date.getFullYear();
            m = date.getMonth();
        }
        else if (typeof date == 'number') {
            y = date;
            m = month - 1;
        }
        var days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; // 非闰年的一年中每个月份的天数
        //如果是闰年并且是2月
        if (m == 1 && this.isLeapYear(y)) return days[m] + 1;
        return days[m];
    };
    /**
     * 计算两个日期之间的天数，用的是比较毫秒数的方法
     * 传进来的日期要么是Date类型，要么是yyyy-MM-dd格式的字符串日期
     * @param date1 日期一
     * @param date2 日期二
     */
    me.countDays = function (date1, date2) {
        var fmt = 'yyyy-MM-dd';
        // 将日期转换成字符串，转换的目的是去除“时、分、秒”
        if (date1 instanceof Date && date2 instanceof Date) {
            date1 = this.format(fmt, date1);
            date2 = this.format(fmt, date2);
        }
        if (typeof date1 === 'string' && typeof date2 === 'string') {
            date1 = this.parse(date1, fmt);
            date2 = this.parse(date2, fmt);
            return (date1.getTime() - date2.getTime()) / (1000 * 60 * 60 * 24);
        } else {
            console.error('参数格式无效！');
            return 0;
        }
    }

};

function Clock() {
    var date = new Date();
    this.year = date.getFullYear();
    this.month = date.getMonth() + 1;
    this.date = date.getDate();
    this.day = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")[date.getDay()];
    this.hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
    this.minute = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
    this.second = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

    this.toString = function () {
        // return this.year + "年" + this.month + "月" + this.date + "日 " + this.hour + ":" + this.minute + ":" + this.second;
        return this.year + "年" + this.month + "月" + this.date + "日 " + this.hour + ":"
            + this.minute + ":" + this.second + " " + this.day;
    };

    this.toSimpleDate = function () {
        return this.year + "-" + this.month + "-" + this.date;
    };

    this.toDetailDate = function () {
        return this.year + "-" + this.month + "-" + this.date + " " + this.hour + ":"
            + this.minute + ":" + this.second;
    };

    this.showDate = function (ele) {
        var clock = new Clock();
        ele.html(clock.toSimpleDate());
        // window.setTimeout(function () {
        //     clock.showDate(ele);
        // }, 1000);
    };
    this.showTime = function (ele) {
        var clock = new Clock();
        ele.html(clock.toDetailDate());
        window.setTimeout(function () {
            clock.showTime(ele);
        }, 1000);
    };
    this.showWeek = function (ele) {
        var clock = new Clock();
        ele.html(clock.toString());
        window.setTimeout(function () {
            clock.showWeek(ele);
        }, 1000);
    };
}

$(function () {
    var clock = new Clock();
    clock.showTime($("#i_clock"));

    $('#sidebar li a').click(function () {
        $('#sidebar li').removeClass('active');
        $(this).parent().addClass('active');
    })
});

function loadIframe(url) {
    $("#iframe_main").attr("src", url);
}