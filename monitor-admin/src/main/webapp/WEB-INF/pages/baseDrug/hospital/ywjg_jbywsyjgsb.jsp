<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2018/7/20
  Time: 下午2:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/head.jsp" %>

<div class="main-content-inner">
    <div class="search-grid" id="search_grid">
        <span>产品名</span><input type="text" name="mediName" id="mediName"/>
        <span>商品名</span><input type="text"  id="comName"/>
        <span>批准文号</span><input type="text"  id="approvalNumber"/>
        <span>生产厂商</span><input type="text"  id="manufacturer"/>
        <span>医疗机构名称</span><input type="text" name="medicalId" id="medicalId"/>
        <button id="btn_search" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-search"></i>搜索</button>
        <button id="btn_reset" class="btn btn-sm btn-purple"><i class="ace-icon fa fa-reply"></i>重置</button>
    </div>

    <table id="grid_table"></table>
    <div id="grid_pager"></div>

    <%@ include file="../../include/fotter.jsp" %>
</div>

<div id="modal_form" class="modal" tabindex="-1">
    <div class="modal-dialog" style="width:80%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="blue bigger">基本药物使用监管上报信息</h4>
            </div>
            <div class="modal-body overflow-scroll" style="max-height: 450px">
                <form id="form_main" class="form-horizontal" role="form">
                    <table class="table">

                        <tr>
                            <input name="id" hidden/>
                            <input name="drugId" id="drugId" value="" hidden/>
                            <td>医疗机构名称</td>
                            <td><input type="text" name="medicalId"/></td>
                            <td>产品名</td>
                            <td><input type="text" name="mediName"/></td>
                            <td>产品英文名</td>
                            <td><input type="text" name="mediNameEn"/></td>
                        </tr>
                        <tr>

                            <td>商品名</td>
                            <td><input type="text" name="comName"/></td>
                            <td>剂型</td>
                            <td><input type="text" name="dosageForm"/></td>
                            <td>制剂规格</td>
                            <td><input type="text" name="drugSpec"/></td>
                        </tr>
                        <tr>

                            <td>批准文号</td>
                            <td><input type="text" name="approvalNumber"/></td>
                            <td>药品通用名</td>
                            <td><input type="text" name="genericName"/></td>
                            <td>生产厂商简称</td>
                            <td><input type="text" name="manufacturerAbbr"/></td>
                        </tr>

                        <tr>

                            <td>生产厂商全称</td>
                            <td><input type="text" name="manufacturer"/></td>
                            <td>生产厂商曾用名</td>
                            <td><input type="text" name="manufacturerOld"/></td>
                            <td>包装单位</td>
                            <td><input type="text" name="packagingUnit"/></td>
                        </tr>

                        <tr>

                            <td>最小使用单位</td>
                            <td><input type="text" name="minUseUnit"/></td>
                            <td>包装规格</td>
                            <td><input type="text" name="packingSpecifications"/></td>
                            <td>规格属性</td>
                            <td><input type="text" name="speTypeName"/></td>
                        </tr>
                        <tr>

                            <td>包装数量</td>
                            <td><input type="text" name="packagesNumber"/></td>
                            <td>包装材质</td>
                            <td><input type="text" name="packagingMaterial"/></td>
                            <td>包装方式</td>
                            <td><input type="text" name="packagingMethod"/></td>
                        </tr>

                        <tr>

                            <td>系统名</td>
                            <td><input type="text" name="sysName"/></td>
                            <td>产品编码</td>
                            <td><input type="text" name="code"/></td>
                            <td>异名</td>
                            <td><input type="text" name="alias"/></td>
                        </tr>

                        <tr>

                            <td>处方</td>
                            <td><input type="text" name="descript"/></td>
                            <td>包装转换比</td>
                            <td><input type="text" name="convertPer"/></td>
                            <td>销售价格<span style="color: red">*</span></td>
                            <td><input type="text" name="sellingPrice" id="sellingPrice" placeholder="请填写销售价格"/></td>
                        </tr>
                        <tr>
                            <td>用量<span style="color: red">*</span></td>
                            <td><input type="text" name="amountOfUse" id="amountOfUse" placeholder="请填写用量"/></td>
                            <td colspan="4"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <div class="modal-footer" id="modalFooter">
            <button id="btn_cancel" class="btn btn-sm btn-grey"><i class="ace-icon fa fa-times"></i>取消</button>
            <button id="btn_submit" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-check"></i>保存</button>
        </div>
    </div>
</div>

<div id="modal_select_drug" class="modal" style="z-index: 1080;">
    <div class="modal-dialog" style="width:98%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">选择药物
                    <span class="title-tip">（单击行来选择或取消选择药物）</span>
                </h4>
            </div>
            <div class="modal-body overflow-scroll" style="height:500px">
                <div class="panel-group">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseDrug">
                                    药物基本信息<span>（点击展开或隐藏）</span>
                                </a>
                                <a id="btnCond2" style="float: right"
                                        onclick="toggleDiv($('#btnCond2'),$('#condition2'))">隐藏搜索条件
                                </a>
                            </h4>
                        </div>
                        <div id="collapseDrug" class="panel-collapse collapse in">
                            <div class="panel-body mb-paddingb-10">
                                <div class="search-grid">
                                    <div id="condition2">
                                        <div>
                                            <span>目录分组名:</span><input type="text" id="selGroupName"/>
                                            <span>药物名称:</span><input type="text" id="selDrugNameCn"/>
                                            <span>产品名:</span><input style="width: 160px" type="text" id="selMediName"/>
                                            <span>批准文号:</span><input type="text" id="selApprovalNumber"/>
                                        </div>
                                        <div style="margin-top: 10px">
                                            <span>包装转换比:</span><input type="text" id="selConvertPer"/>
                                            <span>包装规格:</span><input type="text" id="selPackingSpecifications"/>
                                            <span>剂型:</span><input style="width: 115px" type="text" id="selDosageForm"/>
                                            <span>制剂规格:</span><input style="width: 130px" type="text" id="selDrugSpec"/>
                                            <button id="btn_search_drug" class="btn btn-sm btn-primary" onclick="btnSearchDrug()">
                                                <i class="ace-icon fa fa-search"></i>搜索
                                            </button>
                                            <button id="btn_reset_drug" class="btn btn-sm btn-purple" onclick="btnResetDrug()">
                                                <i class="ace-icon fa fa-reply"></i>重置
                                            </button>
                                        </div>
                                    </div>

                                </div>
                <table id="grid_table_drug"></table>
                            </div>
                        </div>
                    </div>
                </div>
                <form id="form_add" role="form">
                    <div class="alert alert-info" id="alt_msg" style="display: none">
                        <button class="close" data-dismiss="alert">
                            <i class="ace-icon fa fa-times"></i>
                        </button>

                        <i class="ace-icon fa fa-hand-o-right"></i>
                        <span></span>
                    </div>
                    <div class="panel-box">
                        <p class="subtitle">以下为当前已选择的药品列表信息</p>
                        <table class="table" id="selectEdDrugTable">
                            <thead>
                            <tr>
                                <th style="display:none;">ID</th>
                                <th>医疗机构名称</th>
                                <th>产品名</th>
                                <th>剂型</th>
                                <th>批准文号</th>
                                <th>生产厂商简称</th>
                                <th>销售价格</th>
                                <th>用量</th>

                            </tr>
                            </thead>
                            <tbody id="tbody_add">

                            </tbody>
                        </table>
                    </div>
                    </form>
                </div>
            </div>

        <div class="modal-footer">
            <button id="btn_cancel_drug" class="btn btn-sm btn-grey">
                <i class="ace-icon fa fa-times"></i>取消
            </button>
            <button id="btn_submit_drug" class="btn btn-sm btn-primary">
                <i class="ace-icon fa fa-check"></i>保存
            </button>
        </div>
    </div>
</div>
<script type="text/javascript">
    //销售价格以及用法用量 正则验证
    function blurPriceAndUse(e) {
        //获取当前的input的value值
        var inputVal = e.value;
        var regex = "^(\\d{0,6}\\.\\d{0,4})$";
        var zsRegex = "^([0-9]\\d{0,5})$";
        if ((inputVal.match(regex) || inputVal.match(zsRegex))) {
            e.style.borderColor = "green";
        } else {
            al.show(false, "请输入正确的数据")
            e.style.borderColor = "red";
        }
    }

    //创建一个新的数组，存取刚刚添加的数据id
    var AddArr = [];
    var al = new AlertTools();
    /**
     * 删除数组中的某个元素
     * @type {Array}
     */
    //获取元素的下标
    Array.prototype.getArrayIndex = function (val) {
        for (var i = 0; i < this.length; i++) {
            if (this[i] == (val))
                return i;
        }
        return -1;
    }
    //删除该数组
    Array.prototype.removeArray = function (val) {
        var index = this.getArrayIndex(val);
        if (index > -1) {
            this.splice(index, 1);
        }
    };

    //删除当前行
    function deleteThisInfo(e, id) {
        if (window.confirm("确定删除此数据吗")) {
            AddArr.removeArray(id);
            $(e).parent().parent().remove();
            al.show(true, "数据删除成功！！");
        } else {
            return false;
        }
    }

    //获取table中tr的长度
    var FIRST_TB_LENGTH = $("#selectEdDrugTable").find("#tbody_add").children().length;
    //设置一个变量，接收table的长度
    var FIRST_FLAG = true;
    var trLength = 0;

    //获取表中选中的id
    function addSelectDrug(ids, status) {
        if (status) {
            //如果是第一次进来，则为table中tr的原长度，否则为其本身
            trLength = FIRST_FLAG ? FIRST_TB_LENGTH : trLength;
            FIRST_FLAG = false;
            var ids = ids;
            if (ids.length != "") {
                var flag = true;
                //判断新数组中，是否有重复的id
                if (AddArr.length > 0) {
                    for (var a = 0; a < AddArr.length; a++) {
                        if (ids == AddArr[a]) {
                            flag = false;
                            $.get("<%=path%>/drugInfo/getDrugInfoNameById.do?id=" + ids, function (result) {
                                al.show(false, result + "已在添加药品中,请重新选择");
                            })
                            break;
                        }
                    }
                }
                if (flag) {
                    $.get("<%=path%>/drugInfo/getDrugInfoMationById.do?id=" + ids, function (result) {
                        var html = '';
                        html += '<tr id="TR' + result.id + '"><td style="display: none"><input name="drugList[' + trLength + '].id" value=""/><input name="drugList[' + trLength + '].drugId" value="' + result.id + '"/><input name="drugList[' + trLength + '].mediNameEn" value="' + result.mediNameEn + '"/>' +
                            '<input name="drugList[' + trLength + '].comName" value="' + result.comName + '"/>' +
                            '<input name="drugList[' + trLength + '].drugSpec" value="' + result.drugSpec + '"/>' +
                            '<input name="drugList[' + trLength + '].genericName" value="' + result.genericName + '"/>' +
                            '<input name="drugList[' + trLength + '].manufacturer" value="' + result.manufacturer + '"/>' +
                            '<input name="drugList[' + trLength + '].manufacturerOld" value="' + result.manufacturerOld + '"/>' +
                            '<input name="drugList[' + trLength + '].packagingUnit" value="' + result.packagingUnit + '"/>' +
                            '<input name="drugList[' + trLength + '].minUseUnit" value="' + result.minUseUnit + '"/>' +
                            '<input name="drugList[' + trLength + '].packingSpecifications" value="' + result.packingSpecifications + '"/>' +
                            '<input name="drugList[' + trLength + '].speTypeName" value="' + result.speTypeName + '"/>' +
                            '<input name="drugList[' + trLength + '].packagesNumber" value="' + result.packagesNumber + '"/>' +
                            '<input name="drugList[' + trLength + '].packagingMaterial" value="' + result.packagingMaterial + '"/>' +
                            '<input name="drugList[' + trLength + '].packagingMethod" value="' + result.packagingMethod + '"/>' +
                            '<input name="drugList[' + trLength + '].sysName" value="' + result.sysName + '"/>' +
                            '<input name="drugList[' + trLength + '].code" value="' + result.code + '"/>' +
                            '<input name="drugList[' + trLength + '].alias" value="' + result.alias + '"/>' +
                            '<input name="drugList[' + trLength + '].descript" value="' + result.descript + '"/>' +
                            '<input name="drugList[' + trLength + '].alias" value="' + result.alias + '"/>' +
                            '<input name="drugList[' + trLength + '].convertPer" value="' + result.convertPer + '"/>' +
                            '</td>';
                        html += '<td><input name="drugList[' + trLength + '].medicalId" value="' + result.medicalId + '" readonly/></td>';
                        html += '<td><input name="drugList[' + trLength + '].mediName" value="' + result.mediName + '"readonly/></td>';
                        html += '<td><input name="drugList[' + trLength + '].dosageForm" value="' + result.dosageForm + '"readonly/></td>';
                        html += '<td><input name="drugList[' + trLength + '].approvalNumber" value="' + result.approvalNumber + '"readonly/></td>';
                        html += '<td><input name="drugList[' + trLength + '].manufacturerAbbr" value="' + result.manufacturerAbbr + '"readonly/></td>';
                        html += '<td><input name="drugList[' + trLength + '].sellingPrice" id="drugList[' + trLength + '].sellingPrice" value="" placeholder="请填写销售价格"  onblur="blurPriceAndUse(this)" required="required"/></td>';
                        html += '<td><input name="drugList[' + trLength + '].amountOfUse" value="" placeholder="请填写用量" onblur="blurPriceAndUse(this)" required="required"/></td>';
                        html += '</tr>';
                        //html += '<td><input type="button" value="删除" onclick="deleteThisInfo(this,\'' + result.id + '\')"/></td></tr>';

                        var trs = $("#selectEdDrugTable").find("#tbody_add").find("tr");
                        if (trs.length == 0) {
                            $("#selectEdDrugTable").find("#tbody_add").html(html);
                        } else {
                            $("#selectEdDrugTable").find("#tbody_add").find("tr:last").after(html);
                        }
                        AddArr.push(result.id);
                        trLength++;
                    })
                }
            }
        } else {
            AddArr.removeArray(ids);
            $("#TR" + ids + "").remove();
        }
    }

    var option = {
        caption: "基本药物使用监管上报",
        url: '<%=path%>/drugUseMonitor/getDrugUseMonitorPage.do',
        datatype: "json",
        height: 360,
        mtype: "post",
        autowidth: true,
        rownumbers: true,
        multiselect: false,//显示行选择cb
        multiboxonly: true,//单选行
        shrinkToFit: true,//横向滑动
        colModel: [
            {name: 'id', index: 'id', hidden: true},
            {name: 'medicalId', index: 'medicalId', label: '医疗机构名称', width: 120, sortable: true},
            {name: 'mediName', index: 'mediName', label: '产品名', width: 150, sortable: true},
            {name: 'manufacturer', index: 'manufacturer', label: "生产厂商", width: 200, sortable: true},
            {name: 'approvalNumber', index: 'approvalNumber', label: "批准文号", width: 200, sortable: true},
            {name: 'sellingPrice', index: 'sellingPrice', label: "销售价格", width: 100, sortable: true},
            {name: 'amountOfUse', index: 'amountOfUse', label: "用量", width: 100, sortable: true},
            {name: 'drugSpec', index: 'drugSpec', label: "制剂规格", width: 100, sortable: true},
            {name: 'packagingUnit', index: 'packagingUnit', label: "包装单位", width: 100, sortable: true},
            {name: 'minUseUnit', index: 'minUseUnit', label: "最小使用单位", width: 140, sortable: true},
        ],
        loadComplete: function () {
            updatePagerIcons(this);
        },
        ondblClickRow: function () {
            gb.view();
        },
        rowNum: 10,
        rowList: [10, 20, 30],
        pager: '#grid_pager',
        sortname: 'id',
        viewrecords: true,
        sortorder: "desc",
        loadtext: "处理中,请稍后...",
        emptyrecords: "无数据",//空记录时的提示信息
        pgtext: '第 {0} 页 - 共 {1} 页',//页数显示格式
        recordtext: "第 {0} - {1} 条，共 {2} 条"//显示记录数的格式
    };

    $(function () {
        pageInit();
        btnSearchDrug();
        btnResetDrug();
        $('#btn_search_drug').off("click").on("click", function () {
            var data = {
                mediName: $('#selMediName').val().trimA(),
                approvalNumber: $('#selApprovalNumber').val().trimA(),
                dataStatus: '9',//只查询已审核的记录
            };
            $('#grid_table_drug').jqGrid('setGridParam', {
                url: '<%=path%>/drugInfo/queryDrugInfoPage.do',//你的搜索程序地址
                datatype: 'json',
                postData: data, //发送数据
                page: 1
            }).trigger("reloadGrid"); //重新载入
        });


        $('#btn_reset_drug').on("click", function () {
            $('#selMediName').val("");
            $('#selApprovalNumber').val("");
        });

        $('#btn_submit_drug').off("click").on("click", function () {
            if (window.confirm('确定添加该数据吗？')) {
                var al = new AlertTools();
                $.ajax({
                    type: 'POST',
                    url: '<%=path%>/drugUseMonitor/addDrugUseMonitor.do',
                    data: $("#form_add").serialize(),
                    dataType: 'json',
                    success: function (result) {
                        if (!result) {
                            result.type = false;
                            result.msg = "数据保存失败！！"
                        }
                        AddArr = [];
                        pageInit();
                        $("#tbody_add").html("");
                        $('#modal_select_drug').modal('hide');
                        al.show(result.type, result.msg);
                    },
                    error: function () {
                        al.show(false, "数据保存出错！！");
                    }
                });
            }
            else {
                return false;
            }
        });

        $('#btn_cancel_drug').on("click", function () {
            $("#tbody_add").html("");
            $('#modal_select_drug').modal('hide');
        });
    })

    var $modal_form = $('#modal_form');
    var $form_main = $('#form_main');
    var $grid_table = $("#grid_table");
    var gb;
    var add_url = '/drugUseMonitor/addDrugUseMonitor.do';
    var del_url = '/drugUseMonitor/deleteDrugUseMonitor.do';
    var update_url = '/drugUseMonitor/updateDrugUseMonitor.do';
    var view_url = '/drugUseMonitor/getDrugUseMonitorSingleDetail.do';
    var grid_url = '/drugUseMonitor/getDrugUseMonitorPage.do';

    function pageInit() {

        $grid_table.jqGrid(option).trigger("reloadGrid");
        $grid_table.jqGrid('navGrid', "#grid_pager", {
            edit: false,
            edittext: '编辑',
            editicon: 'ace-icon fa fa-pencil blue',
            add: true,
            addtext: '添加',
            addicon: 'ace-icon fa fa-plus-circle purple',
            del: false,
            deltext: '删除',
            delicon: 'ace-icon fa fa-trash-o red',
            search: false,
            searchtext: '搜索',
            searchicon: 'ace-icon fa fa-search orange',
            refresh: true,
            refreshtext: '刷新',
            refreshicon: 'ace-icon fa fa-refresh green',
            view: true,
            viewtext: '查看',
            viewicon: 'ace-icon fa fa-search-plus grey',
            position: 'left',
            addfunc: function () {
                selectDrug();
            },
            editfunc: function () {
                $form_main.find("input").attr("readonly", true);
                gb.update();
                $form_main.find("#sellingPrice").attr("readonly", false);
                $form_main.find("#amountOfUse").attr("readonly", false);
                $form_main.find("#modalFooter").html(' <button id="btn_cancel_edit" class="btn btn-sm btn-grey" onclick="btn_cancel()"><i class="ace-icon fa fa-times"></i>取消</button>\n' +
                    '<button id="btn_submit_edit" class="btn btn-sm btn-primary" onclick="btn_submit_edit()"><i class="ace-icon fa fa-check"></i>保存</button>');
            },
            viewfunc: function () {
                gb.view();
            },
            delfunc: function () {
                gb.delete();
            },
            alertwidth: 300,
            alertcap: '<span style="color: orange">操作出错</span>',
            alerttext: '<div style="color: red;text-align: center;font-size:large">请选择需要操作的数据行！</div>'
        });

        gb = new GridBtn($grid_table, $modal_form, $form_main);
        gb.setPath(add_url, del_url, update_url, view_url);
        addCaptionTips($grid_table);
    }

    function btn_submit_edit() {
        var al = new AlertTools();
        //启用表单校验
        $form_main.validate({
            ignore: ":hidden",//不验证的元素
            errorPlacement: function (er, el) {
            }
        });
        if ($form_main.valid()) {
            $.ajax({
                url: '<%=path%>' + update_url,
                data: $form_main.serialize(),
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (!data) {
                        data.type = false;
                        data.msg = "服务器数据获取失败！！"
                    }
                    $form_main[0].reset();
                    $modal_form.modal('hide');
                    $grid_table.trigger("reloadGrid");
                    al.show(data.type, data.msg);
                },
                error: function () {
                    al.show(false, "数据保存出错！！");
                }
            });
        } else {
            al.show(false, "数据填写异常，请检查填写内容");
        }
    }

    function btn_cancel() {
        $modal_form.modal('hide');
    }

    $('#btn_search').off("click").on("click", function () {
        var data = {
            mediName: $('#mediName').val().trimA(),
            comName: $('#comName').val().trimA(),
            approvalNumber: $('#approvalNumber').val().trimA(),
            manufacturer: $('#manufacturer').val().trimA(),
            medicalId: $('#medicalId').val().trimA()
        };
        gb.search(data, grid_url);
    });

    $('#btn_reset').on("click", function () {
        gb.reset('search_grid');
    });

    function selectDrug() {
        var grid = $('#grid_table_drug');
        grid.jqGrid({
            url: '<%=path%>/drugInfo/queryDrugInfoPage.do',
            datatype: "json",
            postData: {dataStatus: '9'},
            height: 200,
            mtype: "post",
            autowidth: false,
            rownumbers: true,
            multiselect: true,//显示行选择cb
            multiboxonly: false,//单选行
            shrinkToFit: false,//横向滑动
            colModel: [
                {name: 'id', index: 'id', hidden: true},
                {name: 'mediName', index: 'mediName', label: '药品名', width: 150, sortable: false},
                {name: 'genericName', index: 'genericName', label: '通用名', width: 150, sortable: false},
                {name: 'approvalNumber', index: 'approvalNumber', label: '批准文号', width: 180, sortable: false},
                {name: 'code', index: 'code', label: '产品编码', width: 320, sortable: false},
                {name: 'dosageForm', index: 'dosageForm', label: '剂型', width: 100, sortable: false},
                {name: 'drugSpec', index: 'drugSpec', label: '制剂规格', width: 100, sortable: false},
                {name: 'manufacturerAbbr', index: 'manufacturerAbbr', label: '生产厂商简称', width: 160, sortable: false},
                {
                    name: 'manufacturer',
                    index: 'manufacturer',
                    label: '生产厂商简称',
                    width: 160,
                    sortable: false,
                    hidden: true
                },
            ],
            loadComplete: function () {
                updatePagerIcons(this);
            },
            onSelectRow: function (rid, status) {
                addSelectDrug(rid, status);
            },
            rowNum: 200,
            sortname: 'id',
            sortorder: "desc",
            loadtext: "处理中,请稍后...",
        }).trigger("reloadGrid");
        $('#modal_select_drug').modal('show');
        var title = "药物信息   " + "<span class='title-tip' style='color: red'>提示：单击选择或取消药品</span>";
        //$("#grid_table_drug").jqGrid("setCaption", title);
    }

    $('body').on('mousemove','.date-picker',function(){
        $(this).datepicker();
    })
</script>