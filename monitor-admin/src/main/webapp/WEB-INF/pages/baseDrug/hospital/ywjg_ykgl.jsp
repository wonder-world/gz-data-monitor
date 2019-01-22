<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2018/7/20
  Time: 上午10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/head.jsp" %>

<div class="main-content-inner">
    <div class="search-grid" id="searchGrid" style="min-height: 40px">
        <div id="condition">
            <div>
                <span>药库名称</span><input type="text" id="warehouseName"/>
                <span>药库编号</span><input type="text" id="warehouseCode"/>
                <span>出入库类型</span>
                <select style="width: 97px" id="sdType">
                    <option value="">全部</option>
                    <option value="1" selected>进库</option>
                    <option value="2">出库</option>
                </select>
                <span>医疗机构</span><input type="text" id="medicalId"/>
                <span>配送单编号</span><input type="text" id="outNo"/>
            </div>
            <div style="margin-top: 10px">
                <span>药物名称</span><input type="text" id="drugNameCn"/>
                <span>批准文号</span><input type="text" id="approvalNumber"/>
                <span>订单明细号</span><input type="text" id="orderDetailNo"/>
                <span>订单编号</span><input type="text" id="orderNo"/>
                <span>药物分组名</span><input type="text" id="groupName"/>
                <div style="float: right">
                    <button id="btn_search_detail" class="btn btn-sm btn-primary">
                        <i class="ace-icon fa fa-search"></i>搜索
                    </button>
                    <button id="btn_reset_detail" class="btn btn-sm btn-purple">
                        <i class="ace-icon fa fa-reply"></i>重置
                    </button>
                </div>
            </div>
        </div>
        <button id="btnCond" class="btn btn-sm btn-default btn-condition-box"
                onclick="toggleDiv($('#btnCond'),$('#condition'))">隐藏搜索条件
        </button>
    </div>

    <table id="grid_detail"></table>
    <div id="pager_detail"></div>

    <%@include file="../../include/fotter.jsp" %>
</div>

<div id="modal_main" class="modal">
    <div class="modal-dialog" style="width:80%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">药库管理信息</h4>
            </div>

            <div class="modal-body overflow-scroll">

                <div class="panel-group">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                                    药库主信息<span>（点击展开或隐藏）</span>
                                </a>
                            </h4>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse">
                            <div class="panel-body mb-padding-0">
                                <div class="search-grid">
                                    <span>药库编号</span><input type="text" id="whCode"/>
                                    <span>药库名称</span><input type="text" id="whName"/>
                                    <button id="btn_search_main" class="btn btn-sm btn-primary">
                                        <i class="ace-icon fa fa-search"></i>搜索
                                    </button>
                                </div>
                                <table id="grid_main"></table>
                            </div>
                        </div>
                    </div>
                </div>


                <form id="form_main" role="form">
                    <input name="id" hidden/>
                    <table class="table">
                        <tr>
                            <td>医疗机构ID:</td>
                            <td><input name="medicalId"/></td>
                            <td>药库编号:</td>
                            <td><input name="warehouseCode" required/></td>
                            <td>药库名:</td>
                            <td><input name="warehouseName" required/></td>
                        </tr>
                    </table>
                </form>

            </div>
        </div>

        <div class="modal-footer">
            <button id="btn_reset_main" class="btn btn-sm btn-purple ">
                <i class="ace-icon fa fa-refresh"></i>重置表单
            </button>
            <button id="btn_cancel_main" class="btn btn-sm btn-grey">
                <i class="ace-icon fa fa-times"></i>取消编辑
            </button>
            <button id="btn_submit_main" class="btn btn-sm btn-primary">
                <i class="ace-icon fa fa-check"></i>保存已编辑或新增的药库
            </button>
        </div>
    </div>
</div>

<div id="modal_detail" class="modal">
    <div class="modal-dialog" style="width:90%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">药库管理信息</h4>
            </div>

            <div class="modal-body overflow-scroll">
                <form id="form_base" role="form">
                    <table class="table">
                        <tr>
                            <td class="subtitle" colspan="6">药物药库的基本信息</td>
                        </tr>
                        <tr>
                            <td>医疗机构ID:</td>
                            <td><input name="medicalId"/></td>
                            <td>药库编号:</td>
                            <td><input name="warehouseCode"/></td>
                            <td>药库名:</td>
                            <td><input name="warehouseName"/></td>
                        </tr>
                        <tr>
                            <td>配送单编号:</td>
                            <td><input name="outNo"/></td>
                            <td>配送数量:</td>
                            <td><input name="outNumber"/></td>
                            <td>确认收货数量:</td>
                            <td><input name="confirmationNumber"/></td>
                        </tr>
                        <tr>
                            <td>订单号</td>
                            <td><input name="orderNo"></td>
                            <td>订单明细编号</td>
                            <td><input name="orderDetailNo"></td>
                            <td>订单数量</td>
                            <td><input name="orderNumber"></td>
                        </tr>
                        <tr>
                            <td>目录分组名:</td>
                            <td colspan="3"><input name="groupName"/></td>
                            <td>药物名称:</td>
                            <td><input name="drugNameCn"/></td>
                        </tr>
                        <tr>
                            <td>产品名</td>
                            <td><input name="mediName"/></td>
                            <td>批准文号</td>
                            <td><input name="approvalNumber"/></td>
                            <td>剂型</td>
                            <td><input name="dosageForm"/></td>
                        </tr>
                    </table>
                </form>

                <form id="form_detail" role="form">
                    <table class="table">
                        <input name="id" hidden/>
                        <input name="warehouseId" hidden/>
                        <input name="outStorageId" hidden/>
                        <input name="orderId" hidden/>
                        <input name="drugId" hidden/>
                        <tr>
                            <td>类型:</td>
                            <td>
                                <select style="width: 150px" id="dtype" name="type">
                                    <option value="1">进库</option>
                                    <option value="2">出库</option>
                                </select>
                            </td>
                            <td>变动数量:</td>
                            <td colspan="2"><input name="changeNumber"/></td>
                            <td>历史入库量:</td>
                            <td><input id="inStorage" readonly/></td>
                        </tr>
                    </table>
                </form>

                <div class="panel-group">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseDrug">
                                    药物其他所属信息<span>（点击展开或隐藏）</span>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseDrug" class="panel-collapse collapse">
                            <div class="panel-body mb-padding-0">
                                <form id="form_other" role="form">
                                    <table class="table">
                                        <tr>
                                            <td class="subtitle" colspan="6">药物所属配送信息</td>
                                        </tr>
                                        <tr>
                                            <td>配送单编号:</td>
                                            <td><input name="outNo"/></td>
                                            <td>医疗机构:</td>
                                            <td><input name="medicalId"/></td>
                                            <td>配送时间:</td>
                                            <td><input name="outDate"/></td>
                                        </tr>
                                        <tr>
                                            <td>配送数量:</td>
                                            <td><input name="outNumber"/></td>
                                            <td>确认收货数量:</td>
                                            <td><input name="confirmationNumber"/></td>
                                            <td>实际确认时间:</td>
                                            <td><input name="factDtime" class="form-control date-picker"
                                                       data-date-format="yyyy-mm-dd"/></td>
                                        </tr>
                                        <tr>
                                            <td>批次号:</td>
                                            <td><input name="batchNo"/></td>
                                            <td>收货批次号:</td>
                                            <td colspan="3"><input name="accBatchNo"/></td>
                                        </tr>
                                        <tr>
                                            <td class="subtitle" colspan="6">药物所属订单信息</td>
                                        </tr>
                                        <tr>
                                            <td>订单号</td>
                                            <td><input name="orderNumber"></td>
                                            <td>订单备注</td>
                                            <td><input name="orderRemark"></td>
                                        </tr>
                                        <tr>
                                            <td>产商名</td>
                                            <td><input name="membersale"></td>
                                            <td>企业编码</td>
                                            <td><input name="productCode"></td>
                                            <td>包材</td>
                                            <td><input name="drugPackage"></td>
                                        </tr>
                                        <tr>
                                            <td>剂型</td>
                                            <td><input name="dosageFormName"></td>
                                            <td>产地</td>
                                            <td><input name="proArea"></td>
                                            <td>配送企业名</td>
                                            <td><input name="dispatchName"></td>
                                        </tr>
                                        <tr>
                                            <td>订单明细编号</td>
                                            <td><input name="orderDetailNo"></td>
                                            <td>订单数量</td>
                                            <td><input name="orderNumber"></td>
                                            <td>成交价格</td>
                                            <td><input name="matchPrice"></td>
                                        </tr>
                                        <tr>
                                            <td class="subtitle" colspan="6">药物信息</td>
                                        </tr>
                                        <tr>
                                            <td>目录分组名:</td>
                                            <td colspan="3"><input name="groupName"/></td>
                                            <td>药交备注:</td>
                                            <td><input name="remark"/></td>
                                        </tr>
                                        <tr>
                                            <td>目录分组依据</td>
                                            <td colspan="3"><input name="groupSource"/></td>
                                            <td>分类</td>
                                            <td><input name="drugType"/></td>
                                        </tr>
                                        <tr>
                                            <td>产品名</td>
                                            <td><input name="mediName"/></td>
                                            <td>产品英文名:</td>
                                            <td><input name="mediNameEn"/></td>
                                            <td>药物基药属性:(基药、国药):</td>
                                            <td>
                                                <select class="sel-dis" name="nedrugtype">
                                                    <option value="1">基药</option>
                                                    <option value="2">国药</option>
                                                </select>
                                                <%--<input name="nedrugtype"/>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>商品名</td>
                                            <td><input name="comName"/></td>
                                            <td>药物通用名</td>
                                            <td><input name="genericName"/></td>
                                            <td>系统名:</td>
                                            <td><input name="sysName"/></td>
                                        </tr>
                                        <tr>
                                            <td>批准文号</td>
                                            <td><input name="approvalNumber"/></td>
                                            <td>产品编码</td>
                                            <td><input name="code"/></td>
                                            <td>最小使用单位:</td>
                                            <td><input name="minUseUnit"/></td>
                                        </tr>
                                        <tr>
                                            <td>剂型</td>
                                            <td><input name="dosageForm"/></td>
                                            <td>制剂规格</td>
                                            <td><input name="drugSpec"/></td>
                                            <td>规格属性:</td>
                                            <td><input name="speTypeName"/></td>
                                        </tr>
                                        <tr>
                                            <td>包装单位:</td>
                                            <td><input name="packagingUnit"/></td>
                                            <td>包装规格:</td>
                                            <td><input name="packingSpecifications"/></td>
                                            <td>包装数量:</td>
                                            <td><input name="packagesNumber"/></td>
                                        </tr>
                                        <tr>
                                            <td>包装材质:</td>
                                            <td><input name="packagingMaterial"/></td>
                                            <td>包装方式:</td>
                                            <td><input name="packagingMethod"/></td>
                                            <td>包装转换比</td>
                                            <td><input name="convertPer"/></td>
                                        </tr>
                                        <tr>
                                            <td>生产厂商简称</td>
                                            <td><input name="manufacturerAbbr"/></td>
                                            <td>生产厂商全称</td>
                                            <td><input name="manufacturer"/></td>
                                            <td>生产厂商曾用名</td>
                                            <td><input name="manufacturerOld"/></td>
                                        </tr>
                                        <tr>
                                            <td>异名</td>
                                            <td><input name="alias"/></td>
                                            <td>处方</td>
                                            <td colspan="3"><input name="descript"/></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button id="btn_cancel_detail" class="btn btn-sm btn-grey"><i class="ace-icon fa fa-times"></i>取消</button>
            <button id="btn_submit_detail" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-check"></i>保存
            </button>
        </div>
    </div>
</div>

<div id="modal_add_detail" class="modal">
    <div class="modal-dialog" style="width:98%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">药库管理信息</h4>
            </div>


            <div class="modal-body overflow-scroll" style="padding: 0">
                <div style="float: left;width: 260px;display:block;border-right: 1px solid #cccccc">
                    <div class="search-grid">
                        <span>药库编号:</span><input style="width: 100px" type="text" id="selWhCode"/>
                        <button id="btn_search_warehouse" class="btn btn-sm btn-primary">
                            <i class="ace-icon fa fa-search"></i>搜索
                        </button>
                    </div>
                    <table id="grid_main2"></table>
                </div>
                <div style="margin-left:265px;display:block;">
                    <div class="panel-group">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4 class="panel-title" style="position: relative;">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                                        以下为当前药库的详细信息列表[注：此处历史数据只做查看对比使用]
                                        <span>（点击展开或隐藏明细列表）</span>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse in">
                                <form id="form_sel_warehouse" role="form">
                                    <div class="alert alert-info" id="alt_msg" style="display: none">
                                        <button class="close" data-dismiss="alert">
                                            <i class="ace-icon fa fa-times"></i>
                                        </button>

                                        <i class="ace-icon fa fa-hand-o-right"></i>
                                        <span></span>
                                    </div>
                                    <div class="panel-box">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th style="min-width: 40px">行号</th>
                                                <th style="min-width: 80px">进出库类型</th>
                                                <th>变动数量</th>
                                                <th>订单数量</th>
                                                <th>确认数量</th>
                                                <th>历史入库量</th>
                                                <th>药物名称</th>
                                                <th>配送单号</th>
                                                <th>订单明细号</th>
                                                <th style="min-width: 40px">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody id="tbodyList"/>
                                        </table>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="panel-group">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4 class="panel-title" style="position: relative;">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                                        配送信息
                                        <span class="title-tip">[注:单击行来选择或取消选择药物所属配送信息]</span>
                                        <span>（点击展开或隐藏列表）</span>
                                    </a>
                                    <a id="btnCond2" style="float: right;"
                                       onclick="toggleDiv($('#btnCond2'),$('#condition2'))">显示搜索条件
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse in">
                                <div class="panel-body mb-paddingb-10" style="display: inline-grid;">
                                    <div class="search-grid">
                                        <div id="condition2" style="display: none">
                                            <div>
                                                <span>配送单号</span><input type="text" id="selOutNo"/>
                                                <span>订单明细号</span><input type="text" id="selOrderDetailNo"/>
                                                <span>订单号</span><input type="text" id="selOrderNo"/>
                                                <span>药物名称</span><input style="width: 88px" type="text"
                                                                        id="selDrugNameCn"/>
                                                <button id="btn_reset_out" class="btn btn-sm btn-purple">
                                                    <i class="ace-icon fa fa-reply"></i>重置
                                                </button>
                                            </div>
                                            <div style="margin-top: 10px">
                                                <span>批准文号</span><input type="text" id="selApprovalNumber"/>
                                                <span>目录分组名</span><input type="text" id="selGroupName"/>
                                                <span>产品名</span><input type="text" id="selMediName"/>
                                                <span>剂型</span><input style="width: 113px" type="text"
                                                                      id="selDosageForm"/>
                                                <button id="btn_search_out" class="btn btn-sm btn-primary">
                                                    <i class="ace-icon fa fa-search"></i>搜索
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <table id="grid_out"></table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button id="btn_cancel_sel_out" class="btn btn-sm btn-grey">
                <i class="ace-icon fa fa-times"></i>取消已选择
            </button>
            <button id="btn_submit_sel_out" class="btn btn-sm btn-primary">
                <i class="ace-icon fa fa-check"></i>保存已选择
            </button>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(function () {
        initView();
        initDetailView();
        addCaptionTips($gridDetail);
    });

    var $gridMain = $("#grid_main");
    var $modalMain = $('#modal_main');
    var $formMain = $('#form_main');
    var addMainUrl = '/drugWarehouse/addDrugWarehouse.do';
    var delMainUrl = '/drugWarehouse/deleteDrugWarehouse.do';
    var updateMainUrl = '/drugWarehouse/updateDrugWarehouse.do';
    var getMainUrl = '/drugWarehouse/getDrugWarehouse.do';
    var queryMainUrl = '/drugWarehouse/queryDrugWarehousePage.do';
    var queryHistoryUrl = '/drugWarehouse/queryDrugWarehouseDetailHistory.do';
    var gb_main;

    var $gridOut = $("#grid_out");
    var $gridMain2 = $("#grid_main2");
    var $formMain2 = $('#form_main2');
    var warehouse = {};
    var dgJs = {};
    var dgLsAll = [];
    var dgLsNew = [];

    var $gridDetail = $("#grid_detail");
    var $modalDetail = $('#modal_detail');
    var $formDetail = $('#form_detail');
    var pagerDetail = "#pager_detail";
    var addDetailUrl = '/drugWarehouse/addDrugWarehouseDetail.do';
    var delDetailUrl = '/drugWarehouse/deleteDrugWarehouseDetail.do';
    var updateDetailUrl = '/drugWarehouse/updateDrugWarehouseDetail.do';
    var getDetailUrl = '/drugWarehouse/getDrugWarehouseDetail.do';
    var queryDetailUrl = '/drugWarehouse/queryDrugWarehouseDetailPage.do';
    var gb_detail;

    var alt = new AlertTools();

    var confirmationNumber = 0;
    var inStorage = 0;
    var outStorage = 0;
    var warehouseId = '';
    var outStorageId = '';
    var orderId = '';

    function initDetailView() {
        $gridDetail.jqGrid({
            caption: "药库信息",
            url: '<%=path%>' + queryDetailUrl,
            datatype: "json",
            height: 350,
            mtype: "post",
            autowidth: true,
            rownumbers: true,
            rownumWidth: 70,
            multiselect: true,//显示行选择cb
            multiboxonly: true,//单选行
            shrinkToFit: false,//横向滑动
            colModel: [
                {name: 'id', index: 'id', hidden: true},
                {name: 'warehouseId', index: 'warehouseId', hidden: true},
                {name: 'drugId', index: 'drugId', hidden: true},
                {name: 'orderId', index: 'orderId', hidden: true},
                {name: 'outStorageId', index: 'outStorageId', hidden: true},
                {
                    name: '', label: '<span color:blue>行操作</span>', width: 80,
                    formatter: function (v, i, r) {
                        return '<div class="hidden-sm hidden-xs action-buttons">' +
                            '<a class="blue" onclick="showDetailModal(1,\'' + r.id + '\')">编辑详情</a></div>'
                    }
                },
                {name: 'medicalId', index: 'medicalId', label: '医疗机构', width: 100, sortable: false},
                {name: 'warehouseCode', index: 'warehouseCode', label: '药库编号', width: 150, sortable: false},
                {name: 'warehouseName', index: 'warehouseName', label: '药库名', width: 150, sortable: false},
                {
                    name: 'type', index: 'type', label: '类型', width: 80, sortable: false,
                    formatter: function (v, o, r) {
                        if (v == 1) {
                            v = '<span style="color:green">进库</span>'
                        } else if (v == 2) {
                            v = '<span style="color: #1171d0 ">出库</span>'
                        } else {
                            v = '<span style="color: #ff5809">v</span>'
                        }
                        return v;
                    }
                },
                {name: 'changeNumber', index: 'changeNumber', label: '变动数量', width: 100, sortable: false},
                {name: 'groupName', index: 'groupName', label: '目录分组名', width: 250, sortable: false},
                {name: 'drugNameCn', index: 'drugNameCn', label: '药物名称', width: 200, sortable: false},
                {name: 'mediName', index: 'mediName', label: '产品名', width: 200, sortable: false},
                {name: 'dosageForm', index: 'dosageForm', label: '剂型', width: 200, sortable: false},
                {name: 'drugSpec', index: 'drugSpec', label: '制剂规格', width: 200, sortable: false},
                {name: 'code', index: 'code', label: '产品编码', width: 300, sortable: false},
                {name: 'convertPer', index: 'convertPer', label: '包装转换比', width: 80, sortable: false},
                {name: 'orderNo', index: 'orderNo', label: '订单号', width: 150, sortable: false},
                {name: 'orderDetailNo', index: 'orderDetailNo', label: '订单明细编号', width: 150, sortable: false},
                {name: 'orderNumber', index: 'orderNumber', label: '订单数量', width: 150, sortable: false},
                {name: 'outNo', index: 'outNo', label: '配送单编号', width: 150, sortable: false},
                {name: 'outDate', index: 'outDate', label: '配送时间', width: 150, sortable: false},
                {name: 'outNumber', index: 'outNumber', label: '配送数量', width: 100, sortable: false},
                {
                    name: 'confirmationNumber', index: 'confirmationNumber', label: '确认收货数量', width: 100,
                    sortable: false
                },
            ],
            loadComplete: function () {
                updatePagerIcons(this, pagerDetail);
            },
            ondblClickRow: function () {
                showDetailModal(2);
            },
            rowNum: 50,
            rowList: [50, 100, 150, 200],
            pager: pagerDetail,
            sortname: 'id',
            viewrecords: true,
            sortorder: "desc",
            loadtext: "处理中,请稍后...",
            emptyrecords: "无数据",//空记录时的提示信息
            pgtext: '第 {0} 页 - 共 {1} 页',//页数显示格式
            recordtext: "第 {0} - {1} 条，共 {2} 条"//显示记录数的格式
        });

        var jqnav = $gridDetail.jqGrid('navGrid', pagerDetail, {
            add: true, addtext: '添加详情', addicon: 'ace-icon fa fa-plus-circle purple', addtitle: '新增药库详情',
            edit: false, edittext: '编辑详情', editicon: 'ace-icon fa fa-pencil blue', edittitle: '编辑药库详情',
            del: true, deltext: '删除详情', delicon: 'ace-icon fa fa-trash-o red', deltitle: '删除行(可多行删除)',
            refresh: true, refreshtext: '刷新', refreshicon: 'ace-icon fa fa-refresh green', refreshtitle: '刷新列表',
            view: true, viewtext: '药库详情', viewicon: 'ace-icon fa fa-search-plus grey', viewtitle: '查看药库详情',
            search: false, searchtext: '搜索', searchicon: 'ace-icon fa fa-search orange', searchtitle: '搜索',
            addfunc: function () {
                addDetail();
            },
            editfunc: function () {
                showDetailModal(true)
            },
            viewfunc: function () {
                showDetailModal(2)
            },
            delfunc: function () {
                deleteDetail();
            },
            position: 'left', alertwidth: 300,
            alertcap: '<span style="color: orange">操作出错</span>',
            alerttext: '<div style="color: red;text-align: center;font-size:large">请选择需要操作的数据行！</div>'
        });
        jqnav.navButtonAdd(pagerDetail, {
            caption: "添加/编辑药库",
            buttonicon: "ace-icon fa fa-plus-circle purple",
            position: "first",
            onClickButton: function () {
                addMain();
            }
        });
        gb_detail = new GridBtn($gridDetail, $modalDetail, $formDetail);
        gb_detail.setPath(addDetailUrl, delDetailUrl, updateDetailUrl, getDetailUrl);

    }

    function initMainView() {
        $gridMain.jqGrid({
            // caption: "药库主信息",
            url: '<%=path%>' + queryMainUrl,
            datatype: "json",
            height: 200,
            mtype: "post",
            autowidth: true,
            rownumbers: true,
            rownumWidth: 70,
            multiselect: false,//显示行选择cb
            multiboxonly: true,//单选行
            shrinkToFit: true,//横向滑动
            colModel: [
                {name: 'id', index: 'id', hidden: true},
                {
                    name: '', label: '<span color:blue>行操作</span>', width: 150,
                    formatter: function (v, i, r) {
                        return '<div class="hidden-sm hidden-xs action-buttons">' +
                            '<a class="blue" onclick="editMain(\'' + r.id + '\')">编辑药库</a>' +
                            '<a class="blue" onclick="deleteMain(\'' + r.id + '\')">删除药库</a></div>'
                    }
                },
                {name: 'medicalId', index: 'medicalId', label: '医疗机构Id', width: 200, sortable: false},
                {name: 'warehouseCode', index: 'warehouseCode', label: '药库编号', width: 250, sortable: false},
                {name: 'warehouseName', index: 'warehouseName', label: '药库名', width: 250, sortable: false},
            ],
            rowNum: 200,
            onSelectRow: function (rid, sta) {
                if (sta) {
                    editMain(rid);
                }
            },
        });
        $('#whCode').val('');
        $('#whName').val('');
        $formMain.find("input[name='warehouseCode']").attr("readonly", false);
        $formMain[0].reset();
        $gridMain.trigger("reloadGrid");

        $('#btn_submit_main').off("click").on("click", function () {
            var fjs = new FormHandler($formMain).submitForm();
            var _url = fjs.id ? updateMainUrl : addMainUrl;
            //启用表单校验
            $formMain.validate({
                ignore: ":hidden",//不验证的元素
                errorPlacement: function (er, el) {
                }
            });
            if ($formMain.valid()) {
                $.ajax({
                    url: '<%=path%>' + _url,
                    data: $formMain.serialize(),
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        if (!data) {
                            data.type = false;
                            data.msg = "服务器异常，结果获取失败！"
                        }
                        if (data.type) {
                            $formMain.find("input[name='warehouseCode']").attr("readonly", false);
                            $formMain[0].reset();
                            // $modalMain.modal('hide');
                            $gridMain.trigger("reloadGrid");
                            // $grid.trigger("reloadGrid");
                        }
                        alt.show(data.type, data.msg);
                    },
                    error: function () {
                        alt.show(false, "网络错误，数据保存失败！");
                    }
                });
            } else {
                alt.show(false, "数据填写异常，请检查填写内容");
            }
        });
        $('#btn_cancel_main').on("click", function () {
            $formMain.find("input[name='warehouseCode']").attr("readonly", false);
            $formMain[0].reset();
            $modalMain.modal('hide');
        });
        $('#btn_reset_main').on("click", function () {
            $formMain.find("input[name='warehouseCode']").attr("readonly", false);
            $formMain[0].reset();
            $gridMain.trigger("reloadGrid");
        });
        $('#btn_search_main').off('click').on('click', function () {
            var data = {
                warehouseCode: $('#whCode').val().trimA(),
                warehouseName: $('#whName').val().trimA(),
            };
            $gridMain.jqGrid('setGridParam', {
                url: '<%=path%>' + queryMainUrl,
                datatype: 'json',
                postData: data,
                page: 1
            }).trigger("reloadGrid"); //重新载入
        });

        $modalMain.modal({backdrop: 'static', keyboard: false, show: true});
    }

    function initMainView2() {
        $gridMain2.jqGrid({
            caption: "药库主信息",
            url: '<%=path%>' + queryMainUrl,
            datatype: "json",
            height: 350,
            mtype: "post",
            autowidth: true,
            rownumbers: true,
            rownumWidth: 70,
            multiselect: false,//显示行选择cb
            multiboxonly: true,//单选行
            shrinkToFit: true,//横向滑动
            colModel: [
                {name: 'id', index: 'id', hidden: true},
                {name: 'medicalId', index: 'medicalId', label: '医疗机构Id', width: 100, sortable: false},
                {name: 'warehouseCode', index: 'warehouseCode', label: '药库编号', width: 100, sortable: false},
                {name: 'warehouseName', index: 'warehouseName', label: '药库名', width: 150, sortable: false},
            ],
            rowNum: 200,
            loadtext: "处理中,请稍后...",
            onSelectRow: function (rid, sta) {
                queryRecords(rid, sta);
            },
            loadComplete: function () {
                updatePagerIcons(this);
            },
        });

        $('#btn_search_warehouse').off('click').on('click', function () {
            var data = {
                warehouseCode: $('#selWhCode').val().trimA(),
                // warehouseName: $('#whName').val().trimA(),
            };
            $gridMain2.jqGrid('setGridParam', {
                url: '<%=path%>' + queryMainUrl,
                datatype: 'json',
                postData: data,
                page: 1
            }).trigger("reloadGrid"); //重新载入
        });
        $('#selWhCode').val('');
        $gridMain2.trigger("reloadGrid");
    }

    function initOutGrid() {
        var $mso = $('#modal_add_detail');
        $gridOut.jqGrid({
            url: '<%=path%>/drugReceiving/queryDrugReceivingPage.do',
            datatype: "json",
            height: 200,
            mtype: "post",
            autowidth: false,
            rownumbers: true,
            rownumWidth: 70,
            multiselect: true,//显示行选择cb
            multiboxonly: false,//单选行
            shrinkToFit: false,//横向滑动
            colModel: [
                {name: 'rnum', index: 'rnum', key: true, hidden: true},
                {name: 'id', index: 'id', hidden: true},
                {name: 'outDetailId', index: 'outDetailId', hidden: true},
                {name: 'orderDetailId', index: 'orderDetailId', hidden: true},
                {name: 'drugId', index: 'drugId', hidden: true},
                {name: 'medicalId', index: 'medicalId', label: '医疗机构', width: 150, sortable: false},
                {name: 'outNo', index: 'outNo', label: '配送单编号', width: 200, sortable: false},
                {name: 'groupName', index: 'groupName', label: '药物分组名', width: 250, sortable: false},
                {name: 'drugNameCn', index: 'drugNameCn', label: '药物名称', width: 150, sortable: false},
                {name: 'outNumber', index: 'outNumber', label: '配送数量', width: 100, sortable: false},
                {name: 'confirmationNumber', index: 'confirmationNumber', label: '确认收货数量', width: 100, sortable: false},
                {name: 'outDate', index: 'outDate', label: '配送时间', width: 100, sortable: false},
                {name: 'factDtime', index: 'factDtime', label: '实际确认时间', width: 100, sortable: false},
                {name: 'orderNo', index: 'orderNo', label: '订单号', width: 150, sortable: false},
                {name: 'orderDetailNo', index: 'orderDetailNo', label: '订单明细编号', width: 180, sortable: false},
                {name: 'orderNumber', index: 'orderNumber', label: '订单数量', width: 180, sortable: false},
                {name: 'mediName', index: 'mediName', label: '产品名', width: 150, sortable: false},
                {name: 'approvalNumber', index: 'approvalNumber', label: '批准文号', width: 180, sortable: false},
                {name: 'dosageForm', index: 'dosageForm', label: '剂型', width: 100, sortable: false},
                {name: 'batchNo', index: 'batchNo', label: '批次号', width: 150, sortable: false},
                {name: 'accBatchNo', index: 'accBatchNo', label: '收货批次号', width: 180, sortable: false},
            ],
            rowNum: 200,
            loadtext: "处理中,请稍后...",
            onSelectRow: function (rid, sta) {
                setSelOut(rid, sta);
            },
            loadComplete: function () {
                updatePagerIcons(this);
                $('#jqgh_grid_out_cb').hide();
            },
        });


        $('#btn_submit_sel_out').off('click').on('click', function () {
            repushInputOuts();
            dgLsNew = [];
            for (var j in dgLsAll) {
                if (!dgLsAll[j].history) {
                    dgLsNew.push(dgLsAll[j]);
                }
            }
            if (dgLsNew != null && dgLsNew.length > 0) {
                if (validNewList()) {
                    $.ajax({
                        url: '<%=path%>' + addDetailUrl,
                        data: {list: JSON.stringify(dgLsNew)},
                        // data: $('#form_sel_drug').serializeArray(),
                        type: "post",
                        dataType: "json",
                        success: function (data) {
                            if (!data) {
                                data.type = false;
                                data.msg = "服务器异常，结果获取失败！！"
                            }
                            if (data.type) {
                                $mso.modal('hide');
                                $gridDetail.trigger("reloadGrid");
                            }
                            alt.show(data.type, data.msg);
                        },
                        error: function () {
                            alt.show(false, "网络错误，数据保存失败！！");
                        }
                    });
                }
            } else {
                alt.show(false, "您还没有选择数据！");
            }
        });
        $('#btn_cancel_sel_out').on('click', function () {
            // if (dgLsNew.length > 0) {
            //     if (window.confirm("您确定取消当前药物的选择？"))
            //         $msd.modal('hide');
            // } else {
            $mso.modal('hide');
            // }
        });
        $('#btn_reset_out').on('click', function () {
            $("#condition2 :input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");
        });
        $('#btn_search_out').on('click', function () {
            var data = {
                outNo: $('#selOutNo').val().trimA(),
                orderNo: $('#selOrderNo').val().trimA(),
                orderDetailNo: $('#selOrderDetailNo').val().trimA(),
                drugNameCn: $('#selDrugNameCn').val().trimA(),
                groupName: $('#selGroupName').val().trimA(),
                approvalNumber: $('#selApprovalNumber').val().trimA(),
                mediName: $('#selMediName').val().trimA(),
                dosageForm: $('#selDosageForm').val().trimA(),
            };
            $gridOut.jqGrid('setGridParam', {
                url: '<%=path%>/drugReceiving/queryDrugReceivingPage.do',
                datatype: 'json',
                postData: data,
                page: 1
            }).trigger("reloadGrid"); //重新载入
        });

        warehouse = {};
        dgJs = {};
        dgLsAll = [];
        dgLsNew = [];
        loadDetailList();
        $("#condition2 :input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");
        $gridOut.trigger("reloadGrid");
        $mso.modal('show');
    }

    function showDetailModal(type, did) {
        var isEdit;
        var warehouseDetailId;
        if (type == 1) {
            isEdit = true;
            warehouseDetailId = did;
        } else {
            isEdit = false;
            var rid = $gridDetail.jqGrid("getGridParam", "selrow");
            warehouseDetailId = rid;
        }
        if (isNullObject(warehouseDetailId)) {
            alt.show(false, "暂无药库详情");
            return;
        }

        getDetailInfo(warehouseDetailId);

        $('#btn_submit_detail').css('display', isEdit ? 'inline-block' : 'none');
        if (isEdit) {
            $formDetail.find("input,select").attr("disabled", false);
            $formDetail.find('select').removeClass('sel-dis');
        } else {
            $formDetail.find("input,select").attr("disabled", true);
            $formDetail.find('select').addClass('sel-dis');
        }

        $("#form_base").find("input,select").attr("disabled", true);
        $("#form_other").find("input,select").attr("disabled", true);
        $modalDetail.modal('show');

        $('#btn_submit_detail').on("click", function () {
            var reg = /^[0-9]*$/;
            var fjs = new FormHandler($formDetail).submitForm();
            var changeNumber = fjs.changeNumber;
            if (!reg.test(changeNumber)) {
                alt.show(false, "变动数量输入有误，请输入整数", 3000);
                return false;
            }
            console.log(changeNumber + "" + confirmationNumber + "" + inStorage);
            changeNumber = parseInt(changeNumber);
            if (changeNumber > confirmationNumber) {
                alt.show(false, "您输入的变动数量有误，请重新输入[注：变动数量应该不大于 确认收货数量]", 5000);
                return false;
            }
            $.ajax({
                url: '<%=path%>' + updateDetailUrl,
                data: $formDetail.serialize(),
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (!data) {
                        data.type = false;
                        data.msg = "服务器数据获取失败！！"
                    }
                    $modalDetail.modal('hide');
                    $gridDetail.trigger("reloadGrid");
                    alt.show(data.type, data.msg);
                },
                error: function () {
                    alt.show(false, "数据保存出错！！");
                }
            });

        });

        $('#btn_cancel_detail').on("click", function () {
            $formDetail[0].reset();
            $('#form_base')[0].reset();
            $('#form_other')[0].reset();
            $modalDetail.modal('hide');
        });
    }

    function deleteDetail() {
        var rids = $gridDetail.jqGrid("getGridParam", "selarrrow");
        var ids = [];
        for (var i in rids) {
            var rdata = $gridDetail.jqGrid('getRowData', rids[i]);
            ids.push(rdata.outDetailId);
        }
        var cfm = confirm(" 您确定删除已选择的数据？？？");
        if (cfm) {
            $.ajax({
                url: '<%=path%>' + delDetailUrl,
                data: {ids: ids.toString()},
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (!data) {
                        data.type = false;
                        data.msg = "服务异常，获取数据结果失败！！"
                    }
                    if (data.type) {
                        $gridDetail.trigger("reloadGrid");
                    }
                    alt.show(data.type, data.msg);
                },
                error: function () {
                    alt.show(false, "网络异常，数据删除出错！！");
                }
            });
        }
    };

    function editMain(rid) {
        $formMain[0].reset();
        $.ajax({
            url: '<%=path%>' + getMainUrl,
            data: {id: rid},
            type: "post",
            dataType: "json",
            success: function (data) {
                $formMain.find("input[name='warehouseCode']").attr("readonly", true);
                new FormHandler($formMain).fillForm(data);
                $('#collapse1').removeClass('in');
            },
            error: function () {
                alt.show(false, "数据查询出错！！");
            }
        });
    }

    function deleteMain(rid) {
        if (isNullObject(rid)) {
            alt.show(false, "药库ID获取失败，不能删除！");
            return;
        }
        $.ajax({
            url: '<%=path%>' + delMainUrl,
            data: {ids: rid},
            type: "post",
            dataType: "json",
            success: function (data) {
                if (!data) {
                    data.type = false;
                    data.msg = "服务器异常，结果获取失败！"
                }
                if (data.type) {
                    $gridMain.trigger("reloadGrid");
                    $gridDetail.trigger("reloadGrid");
                }
                alt.show(data.type, data.msg);
            },
            error: function () {
                alt.show(false, "网络错误，数据删除出错！");
            }
        });
    }

    function queryRecords(whId, sta) {
        if (!sta) return;
        if (dgLsNew != null && dgLsNew.length) {
            if (window.confirm("您当前有未提交药库详情，您确定离开此药库吗？")) {
                return true;
            } else {
                return false;
            }
        }
        warehouse = {};
        dgJs = {};
        dgLsAll = [];
        dgLsNew = [];
        var rdata = $gridMain2.jqGrid('getRowData', whId);
        if (rdata != null && rdata != '') {
            $gridOut.trigger("reloadGrid");
            warehouse = {
                warehouseId: rdata.id,
                medicalId: rdata.medicalId,
                warehouseCode: rdata.warehouseCode,
                warehouseName: rdata.warehouseName,
            };
            $.ajax({
                url: '<%=path%>' + queryHistoryUrl,
                data: {warehouseId: whId},
                type: "post",
                dataType: "json",
                success: function (data) {
                    for (var i in data) {
                        dgJs = {};
                        var order = data[i];
                        for (var key in order) {
                            dgJs[key] = order[key];
                            dgJs.history = true;
                        }
                        dgLsAll.push(dgJs);
                    }
                    loadDetailList();
                },
                error: function () {
                    alt.show(false, "网络错误，获取历史数据失败！");
                }
            });
        }
    }

    function loadDetailList() {
        var $tbd = $("#tbodyList");
        $tbd.html("");
        var keyArr = ['type', 'changeNumber', 'orderNumber', 'confirmationNumber', 'inStorage', 'drugNameCn', 'outNo', 'orderDetailNo',];
        var roKeyArr = ['orderNumber', 'confirmationNumber', 'inStorage', 'drugNameCn', 'outNo', 'orderDetailNo',];
        var harr = ["id", "warehouseId", "drugId", "outStorageId", "orderId",];
        for (var i = 0; i < dgLsAll.length; i++) {
            var json = dgLsAll[i];
            for (var k in keyArr) {
                json[keyArr[k]] = formatStr(json[keyArr[k]]);
            }
            var ts = '';
            ts += '<td >' + (i + 1) + '</td>';
            if (json.history) {
                for (var k in keyArr) {
                    var key = keyArr[k];
                    if (key == 'type') {
                        ts += '<td>进库</td>';
                    } else {
                        ts += '<td>' + formatStr(json[keyArr[k]]) + '</td>';
                    }
                }
                ts += '<td style="color: blue">历史数据</td>';
            } else {
                for (var j in harr) {
                    ts += '<td hidden><input name="' + harr[j] + '" value="' + formatStr(json[harr[j]]) + '"></td>';
                }
                for (var z in keyArr) {
                    var key = keyArr[z];
                    if (key == 'type') {
                        ts += '<td><select name="' + key + '">' +
                            '<option value="1" selected>进库</option> ' +
                            '<option value="2">出库</option> </select></td>';
                    } else {
                        var isRO = false;
                        for (var a in roKeyArr) {
                            if (key == roKeyArr[a]) {
                                isRO = true;
                                break;
                            }
                        }

                        if (isRO) {
                            ts += '<td><input name="' + key + '" value="' + formatStr(json[key]) + '" readonly></td>';
                        } else {
                            ts += '<td><input name="' + key + '" value="' + formatStr(json[key]) + '"></td>';
                        }
                    }
                }
                // <a onclick="toOption(1,\'' + json.drugId + '\')" style="margin:0 3px">编辑</a>' +
                ts += '<td><a onclick="toOption(2,\'' + json.outStorageId + '\')" style="margin:0 3px">删除</a></td>';
            }
            $tbd.append('<tr>' + ts + '</tr>');
        }
    }

    function toOption(type, outStorageId) {
        repushInputOuts();
        if (outStorageId != null && outStorageId.length > 0) {
            if (type == 1) {
                // setDrugOrder(orderDetailId);
            } else if (type == 2) {
                removeObjById(dgLsAll, outStorageId, 'outStorageId');
                loadDetailList();
            }
        } else {
            alt.show(false, "当前操作选择的行数据有误，请重新选择添加，并操作");
        }
    }

    function setSelOut(rid, isSel) {
        if (!isNotEmpty(warehouse.warehouseId)) {
            alt.show(false, "请先选择所属配送单主信息");
            return;
        }
        var rowData = $gridOut.jqGrid('getRowData', rid);
        if (rowData != null && rowData != '') {
            if (isSel) {
                var num = rowData.confirmationNumber;
                if (isNullObject(num) || num <= 0) {
                    alt.show(false, "该药物还没有确认收货数量，暂不能入库");
                    return;
                }
            }
            var outStorageId = rowData.outDetailId;
            dgJs = {};
            for (var i in dgLsAll) {
                var js = dgLsAll[i];
                if (js.history) {
                    if (outStorageId == js["outStorageId"]) {
                        if (isSel) {
                            alt.show(false, "该配送单已存在历史数据中，请不要重复添加.");
                        }
                        return;
                    }
                }
            }
            repushInputOuts();
            var fields = ["id", "warehouseId", "drugId", "outStorageId", "orderId", "outNumber", "type", "changeNumber",];
            for (var i in fields) {
                dgJs[fields[i]] = formatStr(rowData[fields[i]]);
            }
            getDrugPastRecords(rowData, isSel);
        }
    }

    function repushInputOuts() {
        var trs = $('#tbodyList').children("tr");
        var jsarr = [];
        var json = {};
        $.each(trs, function (i, row) {
            json = {};
            $(row.cells).each(function (j, cell) {
                $(cell).children().each(function (idx, item) {
                    var name = $(item).attr("name");// .replace(/[^\.]+\./gi, '') 替换testList[i].xxx为xxx
                    var value = $(item).val();
                    if (isNotEmpty(name)) {
                        json[name] = value;
                    }
                })
            });
            if (!isNullObject(json)) {
                jsarr.push(json);
            }
        });
        if (jsarr != null && jsarr.length > 0) {
            for (var i in dgLsAll) {
                var js = dgLsAll[i];
                if (!js.history) {
                    for (var j in jsarr) {
                        var ijs = jsarr[j];
                        if (js['outStorageId'] == ijs['outStorageId']) {
                            for (var k in ijs) {
                                js[k] = ijs[k];
                            }
                        }
                    }
                }
            }
        }
    }

    function validNewList() {
        for (var i in dgLsNew) {
            var js = dgLsNew[i];
            var reg = /^[0-9]*$/;
            var confirmationNumber = parseInt(js.confirmationNumber);
            var inStorage = parseInt(js.inStorage);
            var outStorage = parseInt(js.outStorage);
            var changeNumber = js.changeNumber;
            if (inStorage >= confirmationNumber) {
                alt.show(false, "该药物(" + js.drugNameCn + ")已全部入库,请不要重复添加", 3000);
                return false;
            }
            if (!reg.test(changeNumber)) {
                alt.show(false, "变动数量输入有误，请输入整数", 3000);
                return false;
            }
            changeNumber = parseInt(changeNumber);

            if (changeNumber > confirmationNumber - inStorage) {
                alt.show(false, "您输入的变动数量有误，请重新输入[注：变动数量应该不大于 确认收货数量-历史入库量]", 5000);
                return false;
            }
        }
        return true;
    }


    function addMain() {
        initMainView();
    }

    function addDetail() {
        initMainView2();
        initOutGrid();
    }

    function getDetailInfo(id) {
        if (id != null && id != '') {
            $formDetail[0].reset();
            $.ajax({
                url: '<%=path%>' + getDetailUrl,
                data: {id: id},
                type: "post",
                dataType: "json",
                success: function (data) {
                    console.log(JSON.stringify(data))
                    data.type = (data.type).trimA();
                    new FormHandler($formDetail).fillForm(data);
                    new FormHandler($('#form_base')).fillForm(data);
                    new FormHandler($('#form_other')).fillForm(data);
                    $('#dtype').val(data.type);
                    confirmationNumber = data.confirmationNumber;
                    getPastNumber(data);
                },
                error: function () {
                    new AlertTools().show(false, "药物到货监管详情查询出错！！");
                }
            });
        }
    }

    function getPastNumber(data) {
        $.ajax({
            url: '<%=path%>/drugWarehouse/getDrugPastRecords.do',
            data: {orderId: data.orderId, drugId: data.drugId, outStorageId: data.outStorageId},
            type: "post",
            dataType: "json",
            success: function (result) {
                var data = result.data;
                if (data != null) {
                    inStorage = data.IN_STORAGE;
                    outStorage = data.OUT_STORAGE;
                } else {
                    inStorage = 0;
                    outStorage = 0;
                }
                $('#inStorage').val(inStorage);
            },
            error: function () {
                inStorage = 0;
                outStorage = 0;
            }
        });
    }

    function getDrugPastRecords(rowData, isSel) {
        $.ajax({
            url: '<%=path%>/drugWarehouse/getDrugPastRecords.do',
            data: {orderId: rowData.orderDetailId, drugId: rowData.drugId, outStorageId: rowData.outDetailId},
            type: "post",
            dataType: "json",
            success: function (result) {
                var data = result.data;
                //补充数据
                dgJs.orderNumber = rowData.orderNumber;
                dgJs.confirmationNumber = rowData.confirmationNumber;
                dgJs.drugNameCn = rowData.drugNameCn;
                dgJs.outNo = rowData.outNo;
                dgJs.orderDetailNo = rowData.orderDetailNo;
                // dgJs.inStorage = records.inStorage;
                // dgJs.outStorage = records.outStorage;
                if (data != null) {
                    dgJs.inStorage = data.IN_STORAGE;
                    dgJs.outStorage = data.OUT_STORAGE;
                } else {
                    dgJs.inStorage = 0;
                    dgJs.outStorage = 0;
                }
                //必须数据
                dgJs.warehouseId = warehouse.warehouseId;
                dgJs.drugId = rowData.drugId;
                dgJs.outStorageId = rowData.outDetailId;
                dgJs.orderId = rowData.orderDetailId;
                dgJs.type = "";
                dgJs.id = "";
                if (isSel) {
                    dgLsAll.push(dgJs);
                } else {
                    removeJsonFromArr(dgLsAll, dgJs, 'outStorageId');
                }
                loadDetailList();
            },
            error: function () {
                dgJs.inStorage = 0;
                dgJs.outStorage = 0;
                // alt.show(false, "药物到货监管详情查询出错！！");
            }
        });
    }

</script>