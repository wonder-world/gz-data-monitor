<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2018/7/23  下午2:42
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="../../include/head.jsp" %>

<div class="main-content-inner">
    <div class="search-grid" id="search_grid">
        <span>配送单编号</span><input type="text" name="outNo" id="outNo"/>
        <span>配送时间</span>
        <div class="input-group input-group-date">
            <input style="width: 150px" class="date-picker" type="text" data-date-format="yyyy-mm-dd"
                   name="outDate" id="outDate"/>
            <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
        </div>
        <span>医疗机构名称</span><input type="text" name="medicalId"/>
        <button id="btn_search" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-search"></i>搜索</button>
        <button id="btn_reset" class="btn btn-sm btn-purple"><i class="ace-icon fa fa-reply"></i>重置</button>
    </div>

    <table class="grid-scl-bottom" id="grid_table"></table>
    <div id="grid_pager"></div>


    <%@ include file="../../include/fotter.jsp" %>
</div>

<div id="modal_form" class="modal" style="z-index: 1090" tabindex="-1">
    <div class="modal-dialog" style="width:70%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">药物配送信息查看</h4>
            </div>

            <div class="modal-body overflow-scroll" style="max-height: 450px">
                <form id="form_main" role="form">
                    <div class="table">
                        <table class="table">
                                <fieldset >
                            <legend>配送单信息</legend>
                            <tr>
                                <td>配送单编号:</td>
                                <td><input name="outNo"/></td>
                                <td>配送时间:</td>
                                <td><input name="outDate" class="form-control date-picker" type="text"
                                           data-date-format="yyyy-mm-dd"/></td>
                                <td>医疗机构名称:</td>
                                <td><input name="medicalName"/></td>
                            </tr>

                            <tr>
                                <td>订单明细编号:</td>
                                <td><input name="orderDetailId"/></td>
                                <td>配送数量:</td>
                                <td><input name="outNumber"/></td>
                                <td>确认收货数量:</td>
                                <td><input name="confirmationNumber"/></td>
                            </tr>
                            <tr>
                                <td>批次号:</td>
                                <td><input name="batchNo"/></td>
                                <td>收货批次号:</td>
                                <td><input name="accBatchNo"/></td>
                                <td>实际确认时间:</td>
                                <td><input name="factDtime" class="form-control date-picker" type="text"
                                           data-date-format="yyyy-mm-dd"/></td>
                            </tr>

                            <tr>
                                <td>配送企业:</td>
                                <td><input name="dispatchName"/></td>
                                <td>订单数量:</td>
                                <td><input name="orderNumber"/></td>
                                <td>成交价格:</td>
                                <td><input name="matchPrice"/></td>
                            </tr>

                                </fieldset>
                        </table>
                        <br>
                            <table class="table" >
                                <fieldset>
                                <legend>药品信息</legend>
                                    <tr>
                                        <td>药品id</td>
                                        <td><input type="text" name="id"  ></td>
                                        <td>药品基药属性</td>
                                        <td><input name="nedrugtype"  ></td>
                                        <td>产品名</td>
                                        <td><input type="text" name="mediName"  ></td>
                                    </tr>
                                    <tr>
                                        <td>产品英文名:</td>
                                        <td><input name="mediNameEn"  ></td>
                                        <td>商品名</td>
                                        <td><input type="text" name="comName"  ></td>
                                        <td>剂型</td>
                                        <td><input type="text" name="dosageForm"  ></td>
                                    </tr>
                                    <tr>
                                        <td>制剂规格</td>
                                        <td><input type="text" name="drugSpec"  ></td>
                                        <td>批准文号</td>
                                        <td><input type="text" name="approvalNumber"  ></td>
                                        <td>药品通用名</td>
                                        <td><input type="text" name="genericName"  ></td>
                                    </tr>
                                    <tr>
                                        <td>生产厂商简称</td>
                                        <td><input type="text" name="manufacturerAbbr"  ></td>
                                        <td>生产厂商全称</td>
                                        <td><input type="text" name="manufacturer"  ></td>
                                        <td>生产厂商曾用名</td>
                                        <td><input type="text" name="manufacturerOld"  ></td>
                                    </tr>
                                    <tr>
                                        <td>包装单位:</td>
                                        <td><input name="packagingUnit"  ></td>
                                        <td>最小使用单位:</td>
                                        <td><input name="minUseUnit"  ></td>
                                        <td>类型:</td>
                                        <td><input name="type"  ></td>
                                    </tr>
                                    <tr>
                                        <td>包装规格:</td>
                                        <td><input name="packingSpecifications"  ></td>
                                        <td>规格属性:</td>
                                        <td><input name="speTypeName"  ></td>
                                        <td>包装数量:</td>
                                        <td><input name="packagesNumber"  ></td>
                                    </tr>
                                    <tr>
                                        <td>包装材质:</td>
                                        <td><input name="packagingMaterial"  ></td>
                                        <td>包装方式:</td>
                                        <td><input name="packagingMethod"  ></td>
                                        <td>系统名:</td>
                                        <td><input name="sysName"  ></td>
                                    </tr>
                                    <tr>
                                        <td>产品编码</td>
                                        <td><input type="text" name="code"  ></td>
                                        <td>异名</td>
                                        <td><input type="text" name="alias"  ></td>
                                        <td>处方</td>
                                        <td><input type="text" name="descript"  ></td>
                                    </tr>
                                    <tr>
                                        <td>包装转换比</td>
                                        <td><input type="text" name="convertPer"  ></td>
                                        <td>审核状态</td>
                                        <td><input type="text" name="dataStatus"  ></td>
                                        <td>审核备注</td>
                                        <td><input type="text" name="statusRemark"  ></td>
                                    </tr>
                                </fieldset>
                            </table>
                    </div>
                </form>
            </div>
        </div>

        <div class="modal-footer">
            <button id="btn_cancel" class="btn btn-sm btn-grey"><i class="ace-icon fa fa-times"></i>取消</button>
            <button id="btn_submit" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-check"></i>保存</button>
        </div>
    </div>

</div>
<!-- 模态框详细信息 （Modal） -->
<div id="modal_form_order_detail" class="modal " tabindex="-1" role="dialog" style="display:none">
    <div class="modal-dialog " style="width: 70%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="blue bigger">药物配送监管信息--订单详细信息</h4>
            </div>
            <div class="modal-body" style="max-height: 550px;overflow-x: auto">

                        <table class="grid-scl-bottom" id="grid_table2"></table>
                        <div id="grid_pager2"></div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    var option = {
        caption: "药物配送监管信息列表",
        url: '<%=path%>/drugOutStorage/getdrugOutStoragePage.do',
        datatype: "json",
        height: 360,
        width:1500,
        mtype: "post",
        autowidth: true,
        rownumbers: true,
        multiselect: false,//显示行选择cb
        multiboxonly: true,//单选行
        shrinkToFit: true,//横向滑动
        colModel: [
            {name: 'id', index: 'id', width: 160, label: "id", editable: true, hidden: true},
            {name: 'outNo', index: 'outNo', label: '配送单编号', width: 100, sortable: true, editable: true},
            {name: 'outDate', index: 'outDate', label: '配送时间', width: 150, sortable: true, editable: true},
            {name: 'medicalId', index: 'medicalId', label: '医疗机构名称', width: 100, sortable: true, editable: true},
            {
                name: ' ', index: ' ', align: 'center', width: 120, editable: true,
                formatter: function (v, i, r) {
                    return "<div class='hidden-sm hidden-xs action-buttons'><a  onclick='lookingFrom(\"" + r.id + "\")' " +
                        "class='blue'title='查看订单详细' >查看订单详细</a></div>";
                },
            }
        ],
        loadComplete: function () {
            updatePagerIcons(this);
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

    var option2 = {
        // caption: "药物到货监管信息列表",
        postData: [],
        url: '<%=path%>/drugOutStorage/getDrugOutStorageDetailList.do',
        datatype: "json",
        height: 360,
        mtype: "post",
        autowidth: true,
        rownumbers: true,
        multiselect: false,//显示行选择cb
        multiboxonly: true,//单选行
        shrinkToFit: false,//横向滑动
        colModel: [
            {
                name: ' ', index: ' ', align: 'center', width: 120, editable: true,
                formatter: function (v, i, r) {
                    return "<div class='hidden-sm hidden-xs action-buttons'><a  onclick='toGb2View(\"" + r.id + "\")' " +
                        "class='blue'title='查看详情' >查看详情</a></div>";
                },
            },
            {name: 'id', index: 'id', width: 160, label: "订单详情ID", editable: true, hidden: true},
            {name: 'comName', index: 'comName', label: '商品名', width: 100, sortable: true, editable: true},
            {name: 'nedrugtype', index: 'nedrugtype', label: '药品基药属性', width: 100, sortable: true, editable: true},
            {name: 'mediName', index: 'mediName', label: '产品名', width: 100, sortable: true, editable: true},
            {name: 'dosageForm', index: 'dosageForm', label: '剂型', width: 100, sortable: true, editable: true},
            {name: 'manufacturerAbbr', index: 'manufacturerAbbr', label: '生产厂商简称', width: 100, sortable: true, editable: true},
            {name: 'type', index: 'type', label: '类型', width: 100, sortable: true, editable: true},
            {name: 'outNumber', index: 'outNumber', label: '配送数量', width: 150, sortable: true, editable: true},
            {name: 'medicalId', index: 'medicalId', label: '医疗机构名称', width: 200, sortable: true, editable: true},
            {name: 'factDtime', index: 'factDtime', label: '实际确认时间', width: 200, sortable: true, editable: false},
            {name: 'dispatchName', index: 'dispatchName', label: '配送企业名', width: 220, sortable: true, editable: false},

        ],
        loadComplete: function () {
            updatePagerIcons(this);
        },
        ondblClickRow: function () {
            var rowId = $('#grid_table2').jqGrid('getGridParam', 'selrow')
            var rowData = $("#grid_table2").jqGrid('getRowData', rowId);
            gb2.view(rowData.id);
        },
        rowNum: 10,
        rowList: [10, 20, 30],
        pager: '#grid_pager2',
        sortname: 'id',
        viewrecords: true,
        sortorder: "desc",
        loadtext: "处理中,请稍后...",
        emptyrecords: "无数据",//空记录时的提示信息
        pgtext: '第 {0} 页 - 共 {1} 页',//页数显示格式
        recordtext: "第 {0} - {1} 条，共 {2} 条"//显示记录数的格式
    };

    function toGb2View(id){
        gb2.view(id);
    }
    $(function () {
        pageInit();
        /**
         * init second gird
         **/
        $grid_table2.jqGrid(option2);
        addCaptionTips($grid_table);
    })

    var $modal_form = $('#modal_form');
    var $form_main = $('#form_main');
    var $grid_table = $("#grid_table");
    var $grid_table2 = $("#grid_table2");
    var $grid_pager = $('#grid_pager');
    var $grid_pager2 = $('#grid_pager2');
    var gb = new GridBtn($grid_table, $modal_form, $form_main);
    var gb2 = new GridBtn($grid_table2, $modal_form, $form_main);
    var view2_url = '/drugOutStorage/getDrugOutStorageSingleDetailList.do';
    var grid_url = '/drugOutStorage/getdrugOutStoragePage.do';
    gb2.setPath('', '', '', view2_url);


    $('#btn_reset').on("click", function () {
        gb.reset('search_grid');
    });
    /**
     * init first grid
     */
    function pageInit() {
        var clock = new Clock();
        clock.showTime($("#i_clock"));

        $grid_table.jqGrid(option);
        $grid_table.jqGrid('navGrid', "#grid_pager", {
            edit: false,
            edittext: '编辑',
            editicon: 'ace-icon fa fa-pencil blue',
            add: false,
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
            view: false,
            viewtext: '查看详情',
            viewicon: 'ace-icon fa fa-search-plus grey',
            position: 'left',
            addfunc: function () {
                gb.add();
            },
            editfunc: function () {
                gb.update();
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
    }

    function lookingFrom(id) {

        $grid_table2.jqGrid('clearGridData');
        $grid_table2.jqGrid('setGridParam', {
            postData: {"id": id}
        }).trigger('reloadGrid');
        $grid_table2.jqGrid('navGrid', "#grid_pager2", {
            edit: false,
            edittext: '编辑',
            editicon: 'ace-icon fa fa-pencil blue',
            add: false,
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
            view: false,
            viewtext: '查看详情',
            viewicon: 'ace-icon fa fa-search-plus grey',
            position: 'left',
            alertwidth: 300,
            alertcap: '<span style="color: orange">操作出错</span>',
            alerttext: '<div style="color: red;text-align: center;font-size:large">请选择需要操作的数据行！</div>'
        });
        $('#modal_form_order_detail').modal('show');
    }

    $('.date-picker').datepicker({
        autoclose: true, todayHighlight: true
    }).next().on(ace.click_event, function () {
        $(this).prev().focus();
    });

    $('#btn_search').off("click").on("click", function () {
        var data = {
            outNo: $('#outNo').val().trimA(),
            outDate: $('#outDate').val(),
        };
        gb.search(data, grid_url);
    });
</script>