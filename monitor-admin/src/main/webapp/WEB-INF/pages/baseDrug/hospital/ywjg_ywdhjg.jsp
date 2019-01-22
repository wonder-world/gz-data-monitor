<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2018/7/20
  Time: 下午1:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/head.jsp" %>

<div class="main-content-inner">
    <div class="search-grid" id="searchGrid" style="min-height: 40px">
        <div id="condition" style="display: none">
            <div>
                <span>医疗机构</span><input type="text" id="medicalId"/>
                <span>配送单编号</span><input type="text" id="outNo"/>
                <span>配送时间</span>
                <div class="input-group input-group-date">
                    <input style="width: 100px" class="date-picker" type="text" data-date-format="yyyy-mm-dd"
                           placeholder="开始时间" id="outDate"/>
                    <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
                </div>
                <span>订单号</span><input type="text" id="orderNo"/>
                <span>订单明细编号</span><input type="text" id="orderDetailNo"/>
            </div>
            <div style="margin-top: 10px">
                <span>药物名称</span><input type="text" id="drugNameCn"/>
                <span>药物分组名</span><input type="text" id="groupName"/>
                <span>批准文号</span><input type="text" id="approvalNumber"/>
                <span>产品名</span><input type="text" id="mediName"/>
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
                onclick="toggleDiv($('#btnCond'),$('#condition'))">显示搜索条件
        </button>
    </div>

    <table id="grid_table_detail"></table>
    <div id="grid_pager_detail"></div>

    <%@ include file="../../include/fotter.jsp" %>
</div>

<div id="modal_main" class="modal">
    <div class="modal-dialog" style="width:80%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">药物到货监管基本信息</h4>
            </div>

            <div class="modal-body overflow-scroll">

                <div class="panel-group">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                                    药物配送单主信息<span>（点击展开或隐藏）</span>
                                </a>
                            </h4>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse">
                            <div class="panel-body mb-padding-0">
                                <div class="search-grid ">
                                    <span>配送单编号</span><input type="text" id="selOutNo"/>
                                    <button id="btn_search_main" class="btn btn-sm btn-primary">
                                        <i class="ace-icon fa fa-search"></i>搜索
                                    </button>
                                </div>
                                <table id="grid_table_main"></table>
                            </div>
                        </div>
                    </div>
                </div>


                <form id="form_main" role="form">
                    <table class="table">
                        <input name="id" hidden/>
                        <tr>
                            <td>配送单编号:</td>
                            <td><input name="outNo" required/></td>
                            <td>配送时间:</td>
                            <td><input name="outDate" class="form-control date-picker" data-date-format="yyyy-mm-dd"/>
                            </td>
                            <td>医疗机构名称:</td>
                            <td><input name="medicalId"/></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <div class="modal-footer">
            <button id="btn_reset_main" class="btn btn-sm btn-purple">
                <i class="ace-icon fa fa-refresh"></i>重置表单
            </button>

            <button id="btn_cancel_main" class="btn btn-sm btn-grey">
                <i class="ace-icon fa fa-times"></i>取消编辑
            </button>
            <button id="btn_submit_main" class="btn btn-sm btn-primary">
                <i class="ace-icon fa fa-check"></i>保存已编辑或新增的配送单
            </button>
        </div>
    </div>
</div>

<div id="modal_detail" class="modal">
    <div class="modal-dialog" style="width:90%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">药物到货监管信息</h4>
            </div>

            <div class="modal-body overflow-scroll">
                <form id="form_base" role="form">
                    <table class="table">
                        <tr>
                            <td class="subtitle" colspan="6">药物配送的基本信息</td>
                        </tr>
                        <tr>
                            <td>配送单编号:</td>
                            <td><input name="outNo" id="foutNo" readonly/></td>
                            <td>医疗机构:</td>
                            <td><input name="medicalId" id="fmedicalId" readonly/></td>
                            <td>配送时间:</td>
                            <td><input name="outDate" id="foutDate" readonly/></td>
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
                        <tr>
                            <td class="subtitle" colspan="6">药物配送的详细信息
                                <span>历史配送总数量：<span id="pastOutNumber"></span></span>
                            </td>
                        </tr>
                        <tr>
                            <input name="id" id="id" hidden/>
                            <input name="outStorId" id="outStorId" hidden/>
                            <input name="orderDetailId" id="orderDetailId" hidden/>
                        </tr>
                        <tr>
                            <td>配送数量:</td>
                            <td><input type="number" name="outNumber" placeholder="累计数量不能大于订单数量"/></td>
                            <td>确认收货数量:</td>
                            <td><input type="number" name="confirmationNumber"/></td>
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
                    </table>
                </form>

                <div class="panel-group" id="accordion">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" aria-expanded="false"
                                   href="#collapseOne">
                                    药物其他详细信息<span>（点击展开或隐藏）</span>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body mb-padding-0">
                                <form id="form_other" role="form">
                                    <table class="table">
                                        <tr>
                                            <td class="subtitle" colspan="6">药物所属订单信息</td>
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
                                            <td class="subtitle" colspan="6">药物所属分组信息</td>
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
                                            <td><input name="type"/></td>
                                        </tr>
                                        <tr>
                                            <td class="subtitle" colspan="6">药物的基本信息</td>
                                        </tr>
                                        <tr>
                                            <td>产品名</td>
                                            <td><input name="mediName"/></td>
                                            <td>产品英文名:</td>
                                            <td><input name="mediNameEn"/></td>
                                            <td>药物基药属性:(基药、国药):</td>
                                            <td><input name="nedrugtype"/></td>
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

<div id="modal_select_order" class="modal">
    <div class="modal-dialog" style="width:98%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">配送单信息 </h4>
            </div>

            <div class="modal-body overflow-scroll" style="padding: 0">
                <div style="float: left;width: 260px;display:block;border-right: 1px solid #cccccc">
                    <div class="search-grid">
                        <span>配送单号:</span><input style="width: 100px" type="text" id="selOutNo2"/>
                        <button id="btn_search_out" class="btn btn-sm btn-primary">
                            <i class="ace-icon fa fa-search"></i>搜索
                        </button>
                    </div>
                    <table id="grid_table_main2"></table>
                </div>
                <div style="margin-left:265px;display:block;">
                    <div class="panel-group">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4 class="panel-title" style="position: relative;">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                                        以下为当前配送单的明细信息[注：此处历史数据只做查看对比使用]
                                        <span>（点击展开或隐藏明细列表）</span>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse in">
                                <form id="form_sel_order" role="form">
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
                                                <th>配送数量</th>
                                                <th>确认收货量</th>
                                                <th>批次号</th>
                                                <th>收货批次号</th>
                                                <th>确认时间</th>
                                                <th>历史配送数量</th>
                                                <th>药物名称</th>
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
                                        订单信息
                                        <span class="title-tip">[注:单击行来选择或取消选择药物所属订单信息]</span>
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
                                                <span>订单明细号</span><input type="text" id="selOrderDetailNo"/>
                                                <span>订单号</span><input type="text" id="selOrderNo"/>
                                                <span>药物名称</span><input type="text" id="selDrugNameCn"/>
                                                <span>批准文号</span><input type="text" id="selApprovalNumber"/>
                                                <button id="btn_reset_order" class="btn btn-sm btn-purple float-right">
                                                    <i class="ace-icon fa fa-reply"></i>重置
                                                </button>
                                            </div>
                                            <div style="margin-top: 10px">
                                                <span>目录分组名</span><input type="text" id="selGroupName"/>
                                                <span>产品名</span><input type="text" id="selMediName"/>
                                                <span>剂型</span><input style="width: 113px" type="text"
                                                                      id="selDosageForm"/>
                                                <button id="btn_search_order"
                                                        class="btn btn-sm btn-primary float-right">
                                                    <i class="ace-icon fa fa-search"></i>搜索
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <table id="grid_table_order"></table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button id="btn_cancel_sel_order" class="btn btn-sm btn-grey">
                <i class="ace-icon fa fa-times"></i>取消已选择
            </button>
            <button id="btn_submit_sel_order" class="btn btn-sm btn-primary">
                <i class="ace-icon fa fa-check"></i>保存已选择
            </button>
        </div>
    </div>
</div>

<script type="text/javascript">
    //主表信息内容
    var $gridMain = $("#grid_table_main");//$gridMain
    var $modalMain = $('#modal_main');
    var $formMain = $('#form_main');
    var pagerDetail = "#grid_pager_detail";
    var addMainUrl = '/drugReceiving/addDrugOutStorage.do';
    var delMainUrl = '/drugReceiving/deleteDrugOutStorage.do';
    var updateMainUrl = '/drugReceiving/updateDrugOutStorage.do';
    var viewMainUrl = '/drugReceiving/getDrugOutStorage.do';
    var queryMainUrl = '/drugReceiving/queryDrugOutStoragePage.do';
    var queryHistoryUrl = '/drugReceiving/queryOutDetailHistory.do';
    var gb;
    var alt = new AlertTools();

    var $gridMain2 = $("#grid_table_main2");
    var $gridOrder = $('#grid_table_order');
    var outStor = {};
    var dgJs = {};
    var dgLsAll = [];
    var dgLsNew = [];

    //详情表内容
    var $gridDetail = $("#grid_table_detail");
    var $modalDetail = $('#modal_detail');
    var $formDetail = $('#form_detail');
    var addDetailUrl = '/drugReceiving/addDrugReceiving.do';
    var delDetailUrl = '/drugReceiving/deleteDrugReceiving.do';
    var updateDetailUrl = '/drugReceiving/updateDrugReceiving.do';
    var getDetailUrl = '/drugReceiving/getDrugReceiving.do';
    var queryDetailUrl = '/drugReceiving/queryDrugReceivingPage.do';
    var outStorId = '';
    var orderNumber = 0;
    var pastOutNumber = 0;

    function initDetailView() {
        $gridDetail.jqGrid({
            caption: "药物到货监管信息列表",
            url: '<%=path%>' + queryDetailUrl,
            datatype: "json",
            height: 400,
            mtype: "post",
            autowidth: true,
            rownumbers: true,
            rownumWidth: 70,
            multiselect: true,//显示行选择cb
            multiboxonly: true,//单选行
            shrinkToFit: false,//横向滑动
            colModel: [
                {name: 'rnum', index: 'rnum', key: true, hidden: true},
                {name: 'id', index: 'id', hidden: true},
                {name: 'outDetailId', index: 'outDetailId', hidden: true},
                {name: 'orderDetailId', index: 'orderDetailId', hidden: true},
                {
                    name: '', label: '<span color:blue>行操作</span>', width: 80,
                    formatter: function (v, i, r) {
                        return '<div class="hidden-sm hidden-xs action-buttons">' +
                            '<a class="blue" onclick="showOutDetailModal(1,\'' + r.outDetailId + '\')">编辑明细</a></div>'
                    }
                },
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
                {name: 'mediName', index: 'mediName', label: '产品名', width: 150, sortable: false},
                {name: 'approvalNumber', index: 'approvalNumber', label: '批准文号', width: 180, sortable: false},
                {name: 'dosageForm', index: 'dosageForm', label: '剂型', width: 100, sortable: false},
                {name: 'batchNo', index: 'batchNo', label: '批次号', width: 150, sortable: false},
                {name: 'accBatchNo', index: 'accBatchNo', label: '收货批次号', width: 180, sortable: false},
            ],
            loadComplete: function () {
                updatePagerIcons(this, pagerDetail);
            },
            ondblClickRow: function () {
                showOutDetailModal(2);
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
            add: true, addtext: '添加详情', addicon: 'ace-icon fa fa-plus-circle purple', addtitle: '新增基础配送单',
            edit: false, edittext: '编辑详情', editicon: 'ace-icon fa fa-pencil blue', edittitle: '新增配送单详情',
            del: true, deltext: '删除详情', delicon: 'ace-icon fa fa-trash-o red', deltitle: '删除行(可多行删除)',
            refresh: true, refreshtext: '刷新', refreshicon: 'ace-icon fa fa-refresh green', refreshtitle: '刷新列表',
            view: true, viewtext: '配送单详情', viewicon: 'ace-icon fa fa-search-plus grey', viewtitle: '查看配送单详情',
            search: false, searchtext: '搜索', searchicon: 'ace-icon fa fa-search orange', searchtitle: '搜索',
            addfunc: function () {
                addOutDetail();
            },
            editfunc: function () {
                showOutDetailModal(true)
            },
            viewfunc: function () {
                showOutDetailModal(2)
            },
            delfunc: function () {
                deleteDetail();
            },
            position: 'left', alertwidth: 300,
            alertcap: '<span style="color: orange">操作出错</span>',
            alerttext: '<div style="color: red;text-align: center;font-size:large">请选择需要操作的数据行！</div>'
        });
        jqnav.navButtonAdd(pagerDetail, {
            caption: "添加/编辑配送单",
            buttonicon: "ace-icon fa fa-plus-circle purple",
            position: "first",
            onClickButton: function () {
                addOutMain();
            }
        });
        gb = new GridBtn($gridDetail, $modalDetail, $formDetail);
        gb.setPath(addDetailUrl, delDetailUrl, updateDetailUrl, getDetailUrl);


        $('#btn_search_detail').off("click").on("click", function () {
            var data = {
                medicalId: $('#medicalId').val().trimA(),
                outNo: $('#outNo').val().trimA(),
                outDate: $('#outDate').val().trimA(),
                orderNo: $('#orderNo').val().trimA(),
                orderDetailNo: $('#orderDetailNo').val().trimA(),
                drugNameCn: $('#drugNameCn').val().trimA(),
                groupName: $('#groupName').val().trimA(),
                approvalNumber: $('#approvalNumber').val().trimA(),
                mediName: $('#mediName').val().trimA(),
            };
            gb.search(data, queryDetailUrl);
        });

        $('#btn_reset_detail').on("click", function () {
            gb.reset("searchGrid");
        });
    }

    function initMainView() {
        $gridMain.jqGrid({
            // caption: "药物监管基本信息",
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
                            '<a class="blue" onclick="editMain(\'' + r.id + '\')">编辑配送单</a>' +
                            '<a class="blue" onclick="deleteMain(\'' + r.id + '\')">删除配送单</a></div>'
                    }
                },
                {name: 'medicalId', index: 'medicalId', label: '医疗机构', width: 250, sortable: false},
                {name: 'outNo', index: 'outNo', label: '配送单编号', width: 250, sortable: false},
                {name: 'outDate', index: 'outDate', label: '配送时间', width: 200, sortable: false},
            ],
            loadComplete: function () {
                updatePagerIcons(this);
            },
            onSelectRow: function (rid, sta) {
                if (sta) {
                    editMain(rid);
                }
            },
            rowNum: 200
        });

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
                            $formMain.find("input[name='outNo']").attr("readonly", false);
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
            $formMain.find("input[name='outNo']").attr("readonly", false);
            $formMain[0].reset();
            $modalMain.modal('hide');
        });
        $('#btn_reset_main').on("click", function () {
            $formMain.find("input[name='outNo']").attr("readonly", false);
            $formMain[0].reset();
            $gridMain.trigger("reloadGrid");
        });
        $('#btn_search_main').off('click').on('click', function () {
            var data = {
                outNo: $('#selOutNo').val().trimA(),
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

    function initOrderGrid() {
        var $mso = $('#modal_select_order');
        $gridOrder.jqGrid({
            url: '<%=path%>/drugOrder/queryDrugOrderDetailPage.do',
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
                {name: 'orderId', index: 'orderId', hidden: true},
                {name: 'orderDetailId', index: 'orderDetailId', hidden: true},
                {name: 'drugId', index: 'drugId', hidden: true},
                {name: 'orderNo', index: 'orderNo', label: '订单号', width: 200, sortable: false},
                {name: 'orderDetailNo', index: 'orderDetailNo', label: '订单明细编号', width: 200, sortable: false},
                {name: 'orderNumber', index: 'orderNumber', label: '订单数量', width: 100, sortable: false},
                {name: 'groupName', index: 'groupName', label: '药物分组名', width: 250, sortable: false},
                {name: 'drugNameCn', index: 'drugNameCn', label: '药物名称', width: 150, sortable: false},
                {name: 'mediName', index: 'mediName', label: '产品名', width: 150, sortable: false},
                {name: 'approvalNumber', index: 'approvalNumber', label: '批准文号', width: 150, sortable: false},
                {name: 'membersale', index: 'membersale', label: '产商名', width: 200, sortable: false},
                {name: 'dosageFormName', index: 'dosageFormName', label: '剂型', width: 160, sortable: false},
                {name: 'drugPackage', index: 'drugPackage', label: '包材', width: 160, sortable: false},
                {name: 'matchPrice', index: 'matchPrice', label: '成交价格', width: 100, sortable: false},
                {name: 'dispatchName', index: 'dispatchName', label: '配送企业名', width: 200, sortable: false},
                {name: 'medicalId', index: 'medicalId', label: '医疗机构', width: 150, sortable: false},
            ],
            rowNum: 200,
            loadtext: "处理中,请稍后...",
            onSelectRow: function (rid, sta) {
                setSelOrder(rid, sta);
            },
            loadComplete: function () {
                updatePagerIcons(this);
                $('#jqgh_grid_table_order_cb').hide();
            },
        });

        $('#btn_submit_sel_order').off('click').on('click', function () {
            repushInputOrders();
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
        $('#btn_cancel_sel_order').on('click', function () {
            // if (dgLsNew.length > 0) {
            //     if (window.confirm("您确定取消当前药物的选择？"))
            //         $msd.modal('hide');
            // } else {
            $mso.modal('hide');
            // }
        });

        $('#btn_search_order').off('click').on('click', function () {
            var data = {
                orderDetailNo: $('#selOrderDetailNo').val().trimA(),
                orderNo: $('#selOrderNo').val().trimA(),
                drugNameCn: $('#selDrugNameCn').val().trimA(),
                approvalNumber: $('#selApprovalNumber').val().trimA(),
                groupName: $('#selGroupName').val().trimA(),
                mediName: $('#selMediName').val().trimA(),
                dosageForm: $('#selDosageForm').val().trimA(),
            };
            $gridOrder.jqGrid('setGridParam', {
                url: '<%=path%>/drugOrder/queryDrugOrderDetailPage.do',
                datatype: 'json',
                postData: data,
                page: 1
            }).trigger("reloadGrid"); //重新载入
        });
        $('#btn_reset_order').on('click', function () {
            $("#condition2 :input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");
        });

        outStor = {};
        dgJs = {};
        dgLsAll = [];
        dgLsNew = [];
        loadDetailList();
        $gridOrder.trigger("reloadGrid");
        $mso.modal({backdrop: 'static', keyboard: false, show: true});
    }

    function initMainView2() {
        $gridMain2.jqGrid({
            caption: "药物监管主信息",
            url: '<%=path%>' + queryMainUrl,
            datatype: "json",
            height: 300,
            mtype: "post",
            autowidth: true,
            rownumbers: true,
            rownumWidth: 70,
            multiselect: false,//显示行选择cb
            multiboxonly: false,//单选行
            shrinkToFit: true,//横向滑动
            colModel: [
                {name: 'id', index: 'id', hidden: true},
                {name: 'medicalId', index: 'medicalId', label: '医疗机构', width: 100, sortable: false},
                {name: 'outNo', index: 'outNo', label: '配送单编号', width: 150, sortable: false},
                {name: 'outDate', index: 'outDate', label: '配送时间', width: 100, sortable: false},
            ],
            rowNum: 200,
            loadtext: "处理中,请稍后...",
            onSelectRow: function (rid, sta) {
                queryOutRecords(rid, sta);
            },
            loadComplete: function () {
                updatePagerIcons(this);
                $('#jqgh_grid_table_drug_cb').hide();
            },
        });

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
                            $formMain.find("input[name='outNo']").attr("readonly", false);
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
            $formMain.find("input[name='outNo']").attr("readonly", false);
            $formMain[0].reset();
            $modalMain.modal('hide');
        });
        $('#btn_reset_main').on("click", function () {
            $formMain.find("input[name='outNo']").attr("readonly", false);
            $formMain[0].reset();
            $gridMain.trigger("reloadGrid");
        });
        $('#btn_search_main').off('click').on('click', function () {
            var data = {
                outNo: $('#selOutNo').val().trimA(),
            };
            $gridMain.jqGrid('setGridParam', {
                url: '<%=path%>' + queryMainUrl,
                datatype: 'json',
                postData: data,
                page: 1
            }).trigger("reloadGrid"); //重新载入
        });

        $gridMain2.trigger("reloadGrid");
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
            url: '<%=path%>' + viewMainUrl,
            data: {id: rid},
            type: "post",
            dataType: "json",
            success: function (data) {
                $formMain.find("input[name='outNo']").attr("readonly", true);
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
            alt.show(false, "配送单ID获取失败，不能删除！");
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

    function queryOutRecords(outStorId, sta) {
        if (!sta) return;
        if (dgLsNew != null && dgLsNew.length) {
            if (window.confirm("您当前有未提交药物订单明细，您确定离开此订单吗？")) {
                return true;
            } else {
                return false;
            }
        }
        outStor = {};
        dgJs = {};
        dgLsAll = [];
        dgLsNew = [];
        var rdata = $gridMain2.jqGrid('getRowData', outStorId);
        if (rdata != null && rdata != '') {
            $gridOrder.trigger("reloadGrid");
            outStor = {
                outStorId: rdata.id,
                medicalId: rdata.medicalId,
                outNo: rdata.outNo,
            };
            $.ajax({
                url: '<%=path%>' + queryHistoryUrl,
                data: {outStorId: outStorId},
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
        var keyArr = ['outNumber', 'confirmationNumber', 'batchNo', 'accBatchNo', 'factDtime', 'pastOutNumber', 'drugNameCn', 'orderDetailNo',];
        var roKeyArr = ['pastOutNumber', 'drugNameCn', 'orderDetailNo',];
        for (var i = 0; i < dgLsAll.length; i++) {
            var json = dgLsAll[i];
            for (var k in keyArr) {
                json[keyArr[k]] = formatStr(json[keyArr[k]]);
            }
            var ts = '';
            ts += '<td >' + (i + 1) + '</td>';
            if (json.history) {
                for (var k in keyArr) {
                    ts += '<td>' + formatStr(json[keyArr[k]]) + '</td>';
                }
                for (var hk in json) {
                    var flHide = true;
                    for (var k in keyArr) {
                        if (keyArr[k] == hk) {
                            flHide = false;
                            break;
                        }
                    }
                    if (flHide) {
                        ts += '<td hidden>' + formatStr(json[hk]) + '</td>';
                    }
                }
                ts += '<td style="color: blue">历史数据</td>';
            } else {
                for (var k in keyArr) {
                    var key = keyArr[k];
                    var flReadOnly = false;
                    for (var rk in roKeyArr) {
                        if (key == roKeyArr[rk]) {
                            flReadOnly = true;
                            break;
                        }
                    }
                    ts += '<td><input name="' + key + '" value="' + formatStr(json[key]) + '"';
                    if (flReadOnly) {
                        ts += ' readonly="readonly"';
                    }
                    ts += '></td>';
                }
                for (var hk in json) {
                    var flHide = true;
                    for (var k in keyArr) {
                        if (keyArr[k] == hk) {
                            flHide = false;
                            break;
                        }
                    }
                    if (flHide) {
                        ts += '<td hidden><input name="' + hk + '" value="' + formatStr(json[hk]) + '" ></td>';
                    }
                }
                // <a onclick="toOption(1,\'' + json.drugId + '\')" style="margin:0 3px">编辑</a>' +
                ts += '<td><a onclick="toOption(2,\'' + json.orderDetailId + '\')" style="margin:0 3px">删除</a></td>';
            }
            $tbd.append('<tr>' + ts + '</tr>');
        }
    }

    function toOption(type, orderDetailId) {
        repushInputOrders();
        if (orderDetailId != null && orderDetailId.length > 0) {
            if (type == 1) {
                // setDrugOrder(orderDetailId);
            } else if (type == 2) {
                removeObjById(dgLsAll, orderDetailId, 'orderDetailId');
                loadDetailList();
            }
        } else {
            alt.show(false, "当前操作选择的行数据有误，请重新选择添加，并操作");
        }
    }


    function setSelOrder(rid, isSel) {
        if (!isNotEmpty(outStor.outStorId)) {
            alt.show(false, "请先选择所属配送单主信息");
            return;
        }
        var rowData = $gridOrder.jqGrid('getRowData', rid);
        if (rowData != null && rowData != '') {
            var orderDetailId = rowData.orderDetailId;
            dgJs = {};
            for (var i in dgLsAll) {
                var js = dgLsAll[i];
                if (js.history) {
                    if (orderDetailId == js["orderDetailId"]) {
                        if (isSel) {
                            alt.show(false, "该订单已存在历史数据中，请不要重复添加.");
                        }
                        return;
                    }
                }
            }
            repushInputOrders();
            var fields = ["id", "outStorId", "orderDetailId", "outNumber", "batchNo", "confirmationNumber",
                "factDtime", "accBatchNo",];
            for (var i in fields) {
                dgJs[fields[i]] = formatStr(rowData[fields[i]]);
            }
            getDrugOutNumberRecords(rowData, isSel);
        }
    }

    function repushInputOrders() {
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
                        if (js['orderDetailId'] == ijs['orderDetailId']) {
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
        var reg = /^[0-9]*$/;
        for (var i in dgLsNew) {
            var js = dgLsNew[i];
            var orderNumber = parseInt(js.orderNumber);
            var pastOutNumber = parseInt(js.pastOutNumber);
            var outNumber = js.outNumber;
            var confirmationNumber = js.confirmationNumber;
            if (!reg.test(outNumber)) {
                alt.show(false, "配送数量输入有误，请输入整数", 3000);
                return false;
            }

            if (!reg.test(confirmationNumber)) {
                alt.show(false, "确认收货数量输入有误，请输入整数", 3000);
                return false;
            }
            outNumber = parseInt(outNumber);
            confirmationNumber = parseInt(confirmationNumber);
            if (outNumber > orderNumber - pastOutNumber) {
                alt.show(false, "您输入的配送数量有误，请重新输入[注：配送数量应该不大于 订单数量-历史配送数量]", 3000);
                return false;
            }
            if (confirmationNumber > outNumber) {
                alt.show(false, "您输入的确认收货数量有误，请重新输入[注：确认收货数量应该不大于配送数量]", 3000);
                return false;
            }
        }
        return true;
    }

    function addOutMain() {
        initMainView();
        $modalMain.modal('show');
    }

    function addOutDetail() {
        initMainView2();
        initOrderGrid();
    }

    function getDrugOutNumberRecords(rowData, isSel) {
        $.ajax({
            url: '<%=path%>/drugReceiving/getDrugOutNumberRecords.do',
            data: {orderDetailId: rowData.orderDetailId},
            type: "post",
            dataType: "json",
            success: function (result) {
                var data = result.data;
                if (data != null) {
                    dgJs.pastOutNumber = data.PAST_OUT_NUMBER;
                } else {
                    dgJs.pastOutNumber = '0';
                }
                //补充数据
                dgJs.drugNameCn = rowData.drugNameCn;
                dgJs.orderDetailNo = rowData.orderDetailNo;
                dgJs.orderNumber = rowData.orderNumber;

                dgJs.orderDetailId = rowData.orderDetailId;
                dgJs.medicalId = outStor.medicalId;
                dgJs.outStorId = outStor.outStorId;
                dgJs.id = "";
                if (isSel) {
                    dgLsAll.push(dgJs);
                } else {
                    removeJsonFromArr(dgLsAll, dgJs, 'orderDetailId');
                }
                console.log(JSON.stringify(dgLsAll));
                loadDetailList();
            },
            error: function () {
                // alt.show(false, "药物到货监管详情查询出错！！");
            }
        });
    }

    function showOutDetailModal(type, orid) {
        var isEdit;
        var outDetailId;
        if (type == 1) {
            isEdit = true;
            outDetailId = orid;
        } else {
            isEdit = false;
            var rid = $gridDetail.jqGrid("getGridParam", "selrow");
            var rowData = $gridDetail.jqGrid('getRowData', rid);
            outDetailId = rowData.outDetailId;
        }
        if (isNullObject(outDetailId)) {
            alt.show(false, "暂无配送单");
            return;
        }

        getDetailInfo(outDetailId);
        $('#btn_submit_detail').css('display', isEdit ? 'inline-block' : 'none');
        $formDetail.find("input").attr("disabled", !isEdit);
        $("#form_base").find("input").attr("disabled", true);
        $("#form_other").find("input").attr("disabled", true);

        $('#btn_submit_detail').on("click", function () {
            var reg = /^[0-9]*$/;
            var fjs = new FormHandler($formDetail).submitForm();
            var outNumber = fjs.outNumber;
            var confirmationNumber = fjs.confirmationNumber;

            if (!reg.test(outNumber)) {
                alt.show(false, "配送数量输入有误，请输入整数", 3000);
                return;
            }

            if (!reg.test(confirmationNumber)) {
                alt.show(false, "确认收货数量输入有误，请输入整数", 3000);
                return;
            }

            outNumber = parseInt(outNumber);
            confirmationNumber = parseInt(confirmationNumber);
            if (outNumber > orderNumber) {//pastOutNumber
                alt.show(false, "您输入的配送数量有误，请重新输入[注：配送数量应该不大于 订单数量]", 5000);
                return;
            }
            if (confirmationNumber > outNumber) {
                alt.show(false, "您输入的确认收货数量有误，请重新输入[注：确认收货数量应该不大于配送数量]", 5000);
                return;
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
                    if (data.type) {
                        $modalDetail.modal('hide');
                        $gridDetail.trigger("reloadGrid");
                    }
                    alt.show(data.type, data.msg);
                },
                error: function () {
                    alt.show(false, "数据修改出错！！");
                }
            });
        });

        $('#btn_cancel_detail').on("click", function () {
            $formDetail[0].reset();
            $modalDetail.modal('hide');
        });
    }

    function getDetailInfo(rid) {
        $formDetail[0].reset();
        if (rid != null && rid != '') {
            $.ajax({
                url: '<%=path%>' + getDetailUrl,
                data: {id: rid},
                type: "post",
                dataType: "json",
                success: function (data) {
                    new FormHandler($formDetail).fillForm(data);
                    new FormHandler($("#form_base")).fillForm(data);
                    new FormHandler($("#form_other")).fillForm(data);
                    orderNumber = data.orderNumber;
                    console.log(JSON.stringify(data));
                    var orderDetailId = data.orderDetailId;
                    if (orderDetailId != null && orderDetailId != '') {
                        getPastOutNumber(orderDetailId);
                    }
                    $modalDetail.modal('show');
                },
                error: function () {
                    alt.show(false, "药物到货监管详情查询出错！！");
                }
            });


        }
    }

    function getPastOutNumber(orderDetailId) {
        $.ajax({
            url: '<%=path%>/drugReceiving/getDrugOutNumberRecords.do',
            data: {orderDetailId: orderDetailId},
            type: "post",
            dataType: "json",
            success: function (result) {
                var data = result.data;
                if (data != null) {
                    pastOutNumber = Number(data.PAST_OUT_NUMBER);
                    $('#pastOutNumber').text(pastOutNumber);
                } else {
                    $('#pastOutNumber').text(0);
                }
            },
            error: function () {
            }
        });
    }

    $(function () {
        initView();
        initDetailView();
        addCaptionTips($gridDetail);
    });
</script>