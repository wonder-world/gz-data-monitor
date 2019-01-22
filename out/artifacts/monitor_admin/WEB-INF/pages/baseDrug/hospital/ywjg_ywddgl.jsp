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
        <div id="condition" style="display:none;">
            <div>
                <span>医疗机构</span><input type="text" id="medicalId"/>
                <span>订单号</span><input type="text" id="orderNo"/>
                <span>订单明细编号</span><input type="text" id="orderDetailNo"/>
                <span>产商名</span><input type="text" id="membersale"/>
                <span>药物分组名</span><input type="text" id="groupName"/>
            </div>
            <div style="margin-top: 10px">
                <span>药物名称</span><input type="text" id="drugNameCn"/>
                <span>产品名</span><input type="text" id="mediName"/>
                <span>批准文号</span><input type="text" id="approvalNumber"/>
                <span>剂型</span><input type="text" id="dosageForm"/>
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
    <table id="grid_table"></table>
    <div id="grid_pager"></div>
    <%@ include file="../../include/fotter.jsp" %>
</div>

<div id="modal_main" class="modal">
    <div class="modal-dialog" style="width:70%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">药物订单主信息</h4>
            </div>

            <div class="modal-body" style="padding: 10px">
                <div class="panel-group">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                                    药物订单主信息<span>（点击展开或隐藏）</span>
                                </a>
                            </h4>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse">
                            <div class="panel-body mb-padding-0">
                                <div class="search-grid ">
                                    <span>订单号:</span><input style="width: 100px" type="text" id="selMainOrderNo"/>
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
                    <input name="id" hidden>
                    <table class="table">
                        <tr>
                            <td class="subtitle" colspan="6">新增/编辑已选订单</td>
                        </tr>
                        <tr>
                            <td>订单号</td>
                            <td><input name="orderNumber" required></td>
                            <td>医疗机构ID</td>
                            <td><input name="medicalId"></td>
                            <td>订单备注</td>
                            <td><input name="remark"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <div class="modal-footer">
            <button id="btn_reset" class="btn btn-sm btn-purple">
                <i class="ace-icon fa fa-refresh"></i>重置表单
            </button>
            <button id="btn_cancel_main" class="btn btn-sm btn-grey">
                <i class="ace-icon fa fa-times"></i>取消编辑
            </button>
            <button id="btn_submit_main" class="btn btn-sm btn-primary">
                <i class="ace-icon fa fa-check"></i>保存已编辑或新增的订单
            </button>
        </div>
    </div>
</div>

<div id="modal_detail" class="modal">
    <div class="modal-dialog" style="width:80%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">药物订单信息</h4>
            </div>

            <div class="modal-body overflow-scroll" style="max-height: 450px">
                <form id="form_detail" role="form">
                    <table class="table">
                        <tr>
                            <input name="orderDetailId" hidden>
                            <input name="orderId" hidden>
                            <input name="drugId" hidden>
                        </tr>
                        <tr>
                            <td>医疗机构</td>
                            <td><input name="medicalId"></td>
                            <td>订单号</td>
                            <td><input name="orderNo"></td>
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
                    </table>
                </form>

                <div class="panel-group" id="accordion">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                    药物基本信息<span>（点击展开或隐藏）</span>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body mb-padding-0">
                                <form id="form_drug" role="form">
                                    <table class="table">
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
            <button id="btn_cancel_detail" class="btn btn-sm btn-grey"><i class="ace-icon fa fa-times"></i>取消
            </button>
            <button id="btn_submit_detail" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-check"></i>保存
            </button>
        </div>
    </div>
</div>

<div id="modal_sel_drug" class="modal">
    <div class="modal-dialog" style="width:98%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">药物订单信息 </h4>
            </div>

            <div class="modal-body overflow-scroll" style="padding: 0">
                <div style="float: left;width: 250px;display:block;border-right: 1px solid #cccccc">
                    <div class="search-grid">
                        <span>订单号:</span><input style="width: 100px" type="text" id="selOrderNo"/>
                        <button id="btn_search_order" class="btn btn-sm btn-primary">
                            <i class="ace-icon fa fa-search"></i>搜索
                        </button>
                    </div>
                    <table id="grid_table_order_main"></table>
                </div>
                <div style="margin-left:255px;display:block;">
                    <div class="panel-group">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4 class="panel-title" style="position: relative;">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOrder">
                                        以下为当前订单的明细信息[注：此处历史数据只做查看对比使用]
                                        <span>（点击展开或隐藏明细列表）</span>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOrder" class="panel-collapse collapse in">
                                <form id="form_sel_drug" role="form">
                                    <div class="alert alert-info" id="alt_msg" style="display: none">
                                        <button class="close" data-dismiss="alert">
                                            <i class="ace-icon fa fa-times"></i>
                                        </button>

                                        <i class="ace-icon fa fa-hand-o-right"></i>
                                        <span></span>
                                    </div>
                                    <div class="panel-box">
                                        <table class="table" id="table_sel_drug">
                                            <thead>
                                            <tr>
                                                <th style="min-width: 40px">行号</th>
                                                <th>订单明细编号</th>
                                                <th>订单数量</th>
                                                <th>成交价格</th>
                                                <th>企业编码</th>
                                                <th>配送企业</th>
                                                <th>药物名称</th>
                                                <th>批准文号</th>
                                                <th style="min-width: 40px">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody id="tbodyDrugSeledList"/>
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
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseDrug">
                                        药物基本信息
                                        <span class="title-tip">[注:单击行来选择或取消选择药物]</span>
                                        <span>（点击展开或隐藏药物列表）</span>
                                    </a>
                                    <a id="btnCond2" style="float: right;"
                                       onclick="toggleDiv($('#btnCond2'),$('#condition2'))">显示搜索条件
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseDrug" class="panel-collapse collapse in">
                                <div class="panel-body mb-paddingb-10" style="display: inline-grid;">
                                    <div class="search-grid">
                                        <div id="condition2" style="display: none">
                                            <div>
                                                <span>目录分组名:</span><input type="text" id="selGroupName"/>
                                                <span>药物名称:</span><input type="text" id="selDrugNameCn"/>
                                                <span>批准文号:</span><input type="text" id="selApprovalNumber"/>
                                                <span>产品名:</span><input type="text" id="selMediName"/>
                                                <button id="btn_reset_drug" class="btn btn-sm btn-purple float-right">
                                                    <i class="ace-icon fa fa-reply"></i>重置
                                                </button>
                                            </div>
                                            <div style="margin-top: 10px">
                                                <span>包装转换比:</span><input type="text" id="selConvertPer"/>
                                                <span>包装规格:</span><input type="text" id="selPackingSpecifications"/>
                                                <span>制剂规格:</span><input type="text" id="selDrugSpec"/>
                                                <span>剂型:</span><input style="width: 113px" type="text"
                                                                       id="selDosageForm"/>
                                                <button id="btn_search_drug" class="btn btn-sm btn-primary float-right">
                                                    <i class="ace-icon fa fa-search"></i>搜索
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <table id="grid_table_drug"></table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button id="btn_cancel_sel_drug" class="btn btn-sm btn-grey">
                <i class="ace-icon fa fa-times"></i>取消已选择
            </button>
            <button id="btn_submit_sel_drug" class="btn btn-sm btn-primary">
                <i class="ace-icon fa fa-check"></i>保存已选择
            </button>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        initOrderGridPager();
        addCaptionTips($grid);
    });


    var $grid = $("#grid_table");
    var $modal = $('#modal_detail');
    var $form = $('#form_detail');
    var $gridOrderMain = $("#grid_table_order_main");
    var pager = '#grid_pager';
    var addDetailUrl = '/drugOrder/addDrugOrderDetail.do';
    var delDetailUrl = '/drugOrder/deleteDrugOrderDetail.do';
    var updateDetailUrl = '/drugOrder/updateDrugOrderDetail.do';
    var getDetailUrl = '/drugOrder/getDrugOrderDetail.do';
    var queryDetailUrl = '/drugOrder/queryDrugOrderDetailPage.do';
    var queryDetailHistoryUrl = '/drugOrder/queryDrugOrderDetailHistory.do';
    var gb;
    var alt = new AlertTools();
    var $gridDrug = $('#grid_table_drug');
    var order = {};
    var dgJs = {};
    var dgLsAll = [];
    var dgLsNew = [];

    var $gridMain = $("#grid_table_main");
    var $modalMain = $('#modal_main');
    var $formMain = $('#form_main');

    // var pagerMain = '#grid_pager_main';
    var addMainUrl = '/drugOrder/addDrugOrderInfo.do';
    var delMainUrl = '/drugOrder/deleteDrugOrderInfo.do';
    var updateMainUrl = '/drugOrder/updateDrugOrderInfo.do';
    var getMainUrl = '/drugOrder/getDrugOrderInfo.do';
    var queryMainUrl = '/drugOrder/queryDrugOrderInfoPage.do';

    function initOrderGridPager() {
        $grid.jqGrid({
            caption: "药物订单信息",
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
                {name: 'orderDetailId', index: 'orderDetailId', hidden: true},
                {name: 'drugId', index: 'drugId', hidden: true},
                {name: 'createDate', index: 'createDate', hidden: true},
                {
                    name: '', label: '<span color:blue>行操作</span>', width: 80,
                    formatter: function (v, i, r) {
                        return '<div class="hidden-sm hidden-xs action-buttons">' +
                            '<a class="blue" onclick="showOrderDetail(1,\'' + r.orderDetailId + '\')">编辑明细</a></div>'
                    }
                },
                {name: 'medicalId', index: 'medicalId', label: '医疗机构', width: 100, sortable: false},
                {name: 'orderNo', index: 'orderNo', label: '订单号', width: 150, sortable: false},
                {name: 'orderDetailNo', index: 'orderDetailNo', label: '订单明细编号', width: 180, sortable: false},
                {name: 'orderNumber', index: 'orderNumber', label: '订单数量', width: 100, sortable: false},
                {name: 'groupName', index: 'groupName', label: '药物分组名', width: 250, sortable: false},
                {name: 'drugNameCn', index: 'drugNameCn', label: '药物名称', width: 150, sortable: false},
                {name: 'mediName', index: 'mediName', label: '产品名', width: 150, sortable: false},
                {name: 'approvalNumber', index: 'approvalNumber', label: '批准文号', width: 150, sortable: false},
                {name: 'dosageForm', index: 'dosageForm', label: '剂型', width: 100, sortable: false},
                {name: 'dispatchName', index: 'dispatchName', label: '配送企业名', width: 200, sortable: false},
                {name: 'matchPrice', index: 'matchPrice', label: '成交价格', width: 100, sortable: false},
                {name: 'membersale', index: 'membersale', label: '产商名', width: 200, sortable: false},
                {name: 'drugPackage', index: 'drugPackage', label: '包材', width: 160, sortable: false},
                {name: 'proArea', index: 'proArea', label: '产地', width: 200, sortable: false},
            ],
            loadComplete: function () {
                updatePagerIcons(this);
            },
            ondblClickRow: function (rid) {
                showOrderDetail(2, rid);
            },
            rowNum: 50,
            rowList: [50, 100, 150, 200],
            pager: pager,
            sortname: 'id',
            viewrecords: true,
            sortorder: "desc",
            loadtext: "处理中,请稍后...",
            emptyrecords: "无数据",//空记录时的提示信息
            pgtext: '第 {0} 页 - 共 {1} 页',//页数显示格式
            recordtext: "第 {0} - {1} 条，共 {2} 条"//显示记录数的格式
        });

        var jqnav = $grid.jqGrid('navGrid', pager, {
            add: true, addtext: '添加明细', addicon: 'ace-icon fa fa-plus-circle purple', addtitle: '新增基础订单',
            edit: false, edittext: '添加详情', editicon: 'ace-icon fa fa-pencil blue', edittitle: '新增订单详情',
            del: true, deltext: '删除明细', delicon: 'ace-icon fa fa-trash-o red', deltitle: '删除行(可多行删除)',
            refresh: true, refreshtext: '刷新', refreshicon: 'ace-icon fa fa-refresh green', refreshtitle: '刷新列表',
            view: true, viewtext: '查看明细', viewicon: 'ace-icon fa fa-search-plus grey', viewtitle: '查看详情',
            search: false, searchtext: '搜索', searchicon: 'ace-icon fa fa-search orange', searchtitle: '搜索',
            addfunc: function () {
                addOrderDetail();
            },
            editfunc: function () {
                addOrderDetail();
            },
            viewfunc: function () {
                showOrderDetail(2);
            },
            delfunc: function () {
                deleteDetail();
            },
            position: 'left', alertwidth: 300,
            alertcap: '<span class="alertcap">操作出错</span>',
            alerttext: '<div class="alerttext">请先选择需要操作的数据行！</div>'
        });
        jqnav.navButtonAdd(pager, {
            caption: "添加/编辑订单",
            buttonicon: "ace-icon fa fa-plus-circle purple",
            position: "first",
            onClickButton: function () {
                addOrder();
            }
        });
        gb = new GridBtn($grid, $modal, $form);
        gb.setPath(addDetailUrl, delDetailUrl, updateDetailUrl, getDetailUrl);

        $('#btn_search_detail').off("click").on("click", function () {
            var data = {
                medicalId: $('#medicalId').val().trimA(),
                orderNo: $('#orderNo').val().trimA(),
                orderDetailNo: $('#orderDetailNo').val().trimA(),
                membersale: $('#membersale').val().trimA(),
                groupName: $('#groupName').val().trimA(),
                drugNameCn: $('#drugNameCn').val().trimA(),
                mediName: $('#mediName').val().trimA(),
                approvalNumber: $('#approvalNumber').val().trimA(),
                dosageForm: $('#dosageForm').val().trimA(),
            };
            $grid.jqGrid('setGridParam', {
                url: '<%=path%>' + queryDetailUrl,//你的搜索程序地址
                datatype: 'json',
                postData: data, //发送数据
                page: 1
            }).trigger("reloadGrid"); //重新载入
        });
        $('#btn_reset_detail').on("click", function () {
            gb.reset('searchGrid');
        });


        $('#btn_submit_detail').on("click", function () {
            //启用表单校验
            $form.validate({
                ignore: ":hidden",//不验证的元素
                errorPlacement: function (er, el) {
                }
            });
            if ($form.valid()) {
                $.ajax({
                    url: '<%=path%>' + updateDetailUrl,
                    data: $form.serialize(),
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        if (!data) {
                            data.type = false;
                            data.msg = "服务器数据获取失败！！"
                        }
                        if (data.type) {
                            $modal.modal('hide');
                            $grid.trigger("reloadGrid");
                        }
                        alt.show(data.type, data.msg);
                    },
                    error: function () {
                        alt.show(false, "数据保存出错！！");
                    }
                });
            } else {
                alt.show(false, "数据填写异常，请检查填写内容");
            }

        });
        $('#btn_cancel_detail').on("click", function () {
            $form[0].reset();
            $("#form_drug")[0].reset();
            $modal.modal('hide');
        });

    }

    function initOrderMainGridPager() {
        $gridMain.jqGrid({
            // caption: "药物订单主信息",
            url: '<%=path%>' + queryMainUrl,
            datatype: "json",
            height: 200,
            mtype: "post",
            autowidth: true,
            rownumbers: true,
            rownumWidth: 70,
            multiselect: false,//显示行选择cb
            multiboxonly: true,//单选行
            shrinkToFit: false,//横向滑动
            colModel: [
                {name: 'id', index: 'id', hidden: true},
                {
                    name: '', label: '<span color:blue>行操作</span>', width: 140,
                    formatter: function (v, i, r) {
                        return '<div class="hidden-sm hidden-xs action-buttons">' +
                            '<a class="blue" onclick="editMain(\'' + r.id + '\')">编辑订单</a>'+
                            '<a class="blue" onclick="deleteMain(\'' + r.id + '\')">删除订单</a></div>'
                    }
                },
                {name: 'medicalId', index: 'medicalId', label: '医疗机构', width: 120, sortable: false},
                {name: 'orderNumber', index: 'orderNumber', label: '订单号', width: 200, sortable: false},
                {name: 'remark', index: 'remark', label: '订单备注', width: 150, sortable: false},
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
                            $formMain.find("input[name='orderNumber']").attr("readonly", false);
                            $formMain[0].reset();
                            // $modalMain.modal('hide');
                            $gridMain.trigger("reloadGrid");
                            $grid.trigger("reloadGrid");
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
            $formMain.find("input[name='orderNumber']").attr("readonly", false);
            $formMain[0].reset();
            $modalMain.modal('hide');
        });
        $('#btn_reset').on("click", function () {
            $formMain.find("input[name='orderNumber']").attr("readonly", false);
            $formMain[0].reset();
            $('#selMainOrderNo').val('');
            $gridMain.trigger("reloadGrid");
        });
        $('#btn_search_main').off('click').on('click', function () {
            var data = {
                orderNumber: $('#selMainOrderNo').val().trimA(),
            };
            $gridMain.jqGrid('setGridParam', {
                url: '<%=path%>' + queryMainUrl,
                datatype: 'json',
                postData: data,
                page: 1
            }).trigger("reloadGrid"); //重新载入
        });

        $formMain.find("input[name='orderNumber']").attr("readonly", false);
        $formMain[0].reset();
        $('#selMainOrderNo').val('');
        var data = {
            orderNumber: $('#selMainOrderNo').val().trimA(),
        };
        $gridMain.jqGrid('setGridParam', {
            url: '<%=path%>' + queryMainUrl,
            datatype: 'json',
            postData: data,
            page: 1
        }).trigger("reloadGrid"); //重新载入
        $modalMain.modal({backdrop: 'static', keyboard: false, show: true});
    }

    function initOrderMainGrid() {
        $gridOrderMain.jqGrid({
            caption: "药物订单主信息",
            url: '<%=path%>' + queryMainUrl,
            datatype: "json",
            height: 330,
            mtype: "post",
            autowidth: true,
            rownumbers: true,
            rownumWidth: 50,
            multiselect: false,//显示行选择cb
            multiboxonly: true,//单选行
            shrinkToFit: false,//横向滑动
            colModel: [
                {name: 'id', index: 'id', hidden: true},
                {name: 'medicalId', index: 'medicalId', label: '医疗机构', width: 80, sortable: false},
                {name: 'orderNumber', index: 'orderNumber', label: '订单号', width: 120, sortable: false},
            ],
            loadComplete: function () {
                updatePagerIcons(this);
                $('#jqgh_grid_table_order_main_cb').hide();
            },
            onSelectRow: function (rid, sta) {
                if (sta) {
                    initOrderDetailRecords(rid);
                }
            },
            rowNum: 200,
            loadtext: "处理中,请稍后...",
        });
        $gridOrderMain.trigger("reloadGrid");
        $('#btn_search_order').off('click').on('click', function () {
            var data = {
                orderNumber: $('#selOrderNo').val().trimA(),
            };
            $gridOrderMain.jqGrid('setGridParam', {
                url: '<%=path%>' + queryMainUrl,
                datatype: 'json',
                postData: data,
                page: 1
            }).trigger("reloadGrid"); //重新载入
        });
    }

    function initDrugGrid() {
        var $msd = $('#modal_sel_drug');
        $gridDrug.jqGrid({
            // caption: "药物信息列表",
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
                {name: 'code', index: 'code', hidden: true},
                {name: 'packagingMaterial', index: 'packagingMaterial', hidden: true},
                {name: 'manufacturer', index: 'manufacturer', hidden: true},
                {name: 'groupName', index: 'groupName', label: '药物分组名', width: 250, sortable: false},
                {name: 'drugNameCn', index: 'drugNameCn', label: '药物名称', width: 150, sortable: false},
                {name: 'mediName', index: 'mediName', label: '产品名', width: 150, sortable: false},
                {name: 'approvalNumber', index: 'approvalNumber', label: '批准文号', width: 180, sortable: false},
                {name: 'dosageForm', index: 'dosageForm', label: '剂型', width: 150, sortable: false},
                {name: 'drugSpec', index: 'drugSpec', label: '制剂规格', width: 150, sortable: false},
                {name: 'speTypeName', index: 'speTypeName', label: '规格属性', width: 150, sortable: false},
                {
                    name: 'packingSpecifications', index: 'packingSpecifications', label: '包装规格', width: 150,
                    sortable: false
                },
                {name: 'convertPer', index: 'convertPer', label: '包装转换比', width: 100, sortable: false},

            ],
            onSelectRow: function (rid, sta) {
                setDrugRecords(rid, sta);
            },
            loadComplete: function () {
                updatePagerIcons(this);
                $('#jqgh_grid_table_drug_cb').hide();
            },
            rowNum: 200,
            loadtext: "处理中,请稍后..."
        });
        $('#btn_submit_sel_drug').off('click').on('click', function () {
            repushInputDrugs();
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
                                $msd.modal('hide');
                                $grid.trigger("reloadGrid");
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
        $('#btn_cancel_sel_drug').on('click', function () {
            // if (dgLsNew.length > 0) {
            //     if (window.confirm("您确定取消当前药物的选择？"))
            //         $msd.modal('hide');
            // } else {
            $msd.modal('hide');
            // }
        });

        $('#btn_search_drug').off('click').on('click', function () {
            var data = {
                groupName: $('#selGroupName').val().trimA(),
                drugNameCn: $('#selDrugNameCn').val().trimA(),
                approvalNumber: $('#selApprovalNumber').val().trimA(),
                mediName: $('#selMediName').val().trimA(),
                convertPer: $('#selConvertPer').val().trimA(),
                packingSpecifications: $('#selPackingSpecifications').val().trimA(),
                drugSpec: $('#selDrugSpec').val().trimA(),
                dosageForm: $('#selDosageForm').val().trimA(),
            };
            $gridDrug.jqGrid('setGridParam', {
                url: '<%=path%>/drugInfo/queryDrugInfoPage.do',
                datatype: 'json',
                postData: data,
                page: 1
            }).trigger("reloadGrid"); //重新载入
        });
        $('#btn_reset_drug').on('click', function () {
            $("#condition2 :input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");
        });

        $gridDrug.trigger("reloadGrid");
        $msd.modal({backdrop: 'static', keyboard: false, show: true});
    }

    function addOrder() {
        initOrderMainGridPager();
    }

    function addOrderDetail() {
        order = {};
        dgJs = {};
        dgLsAll = [];
        dgLsNew = [];
        loadDrugOrderDetailList();
        initOrderMainGrid();
        initDrugGrid();
    }

    function deleteDetail() {
        var rids = $grid.jqGrid("getGridParam", "selarrrow");
        var ids = [];
        for (var i in rids) {
            var rdata = $grid.jqGrid('getRowData', rids[i]);
            ids.push(rdata.orderDetailId);
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
                        $grid.trigger("reloadGrid");
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
                $formMain.find("input[name='orderNumber']").attr("readonly", true);
                new FormHandler($formMain).fillForm(data);
                $('#collapse1').removeClass('in');
            },
            error: function () {
                alt.show(false, "数据查询出错！！");
            }
        });
    }
    function deleteMain(rid) {
        if (isNullObject(rid)) return;
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
                    $grid.trigger("reloadGrid");
                }
                alt.show(data.type, data.msg);
            },
            error: function () {
                alt.show(false, "网络错误，数据删除出错！");
            }
        });
    }

    function initOrderDetailRecords(orderId) {
        $gridDrug.trigger("reloadGrid");
        if (dgLsNew != null && dgLsNew.length) {
            if (window.confirm("您当前有未提交药物订单明细，您确定离开此订单吗？")) {
                return true;
            } else {
                return false;
            }
        }
        order = {};
        dgJs = {};
        dgLsAll = [];
        dgLsNew = [];
        var rdata = $gridOrderMain.jqGrid('getRowData', orderId);
        if (rdata != null && rdata != '') {
            order = {
                orderId: rdata.id,
                medicalId: rdata.medicalId,
                orderNo: rdata.orderNumber,
            };
            $.ajax({
                url: '<%=path%>' + queryDetailHistoryUrl,
                data: {orderId: orderId},
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
                    loadDrugOrderDetailList();
                },
                error: function () {
                    alt.show(false, "网络错误，获取历史数据失败！");
                }
            });
        }
    }

    function repushInputDrugs() {
        var trs = $('#tbodyDrugSeledList').children("tr");
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
                        if (js['drugId'] == ijs['drugId']) {
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
            var v1 = isNotEmpty(js.orderDetailNo);
            var v2 = isNotEmpty(js.orderNumber);
            var v3 = isNotEmpty(js.matchPrice);
            var flag = v1 || v2 || v3;
            if (!flag) {
                alt.show(false, "还有药物的订单详情信息没有哦填写，请至少填写一项");
                return false;
                // if (window.confirm("您还确定要提交所选择的药物吗？")) {
                //     return true;
                // } else {
                //     return false;
                // }
            }
            var od = {};
            for (var j in dgLsNew) {
                var no = dgLsNew[j]['orderDetailNo'];
                if (od[no]) {
                    od[no] = od[no];
                    alt.show(false, "订单明细号有重复，请确认填写无误后再提交保存.");
                    return false;
                } else {
                    od[no] = 1;
                }
            }
            return true;
        }
    }

    function setDrugRecords(drugId, isSel) {
        if (!isNotEmpty(order.orderId)) {
            alt.show(false, "请先选择药物所属订单主信息");
            return;
        }
        dgJs = {};
        for (var i in dgLsAll) {
            var js = dgLsAll[i];
            if (js.history) {
                if (drugId == js["drugId"]) {
                    if (isSel) {
                        alt.show(false, "该药物已存在历史数据中，请不要重复添加.");
                    }
                    return;
                }
            }
        }
        repushInputDrugs();
        var rowData = $gridDrug.jqGrid('getRowData', drugId);
        if (rowData != null && rowData != '') {
            var fields = ["id", "orderId", "drugId", "drugPackage", "dosageFormName", "membersale",
                "productCode", "proArea", "orderDetailNo", 'orderNumber', "dispatchName", "matchPrice",];
            for (var i in fields) {
                dgJs[fields[i]] = formatStr(rowData[fields[i]]);
            }
            //补充数据
            dgJs.drugNameCn = rowData.drugNameCn;
            dgJs.mediName = rowData.mediName;
            dgJs.approvalNumber = rowData.approvalNumber;
            dgJs.dosageForm = rowData.dosageForm;
            dgJs.drugSpec = rowData.drugSpec;
            dgJs.drugPackage = rowData.packagingMaterial;
            dgJs.dosageFormName = rowData.dosageForm;
            dgJs.membersale = rowData.manufacturer;
            dgJs.drugName = rowData.drugNameCn;
            // dgJs.productCode = rowData.code;
            dgJs.proArea = rowData.manufacturer;
            dgJs.medicalId = order.medicalId;
            dgJs.orderNo = order.orderNo;
            dgJs.orderId = order.orderId;
            dgJs.drugId = drugId;
            dgJs.id = "";
            if (isSel) {
                dgLsAll.push(dgJs);
            } else {
                removeJsonFromArr(dgLsAll, dgJs, 'drugId');
            }
            loadDrugOrderDetailList();
        }
    }

    function loadDrugOrderDetailList() {
        var $tbd = $("#tbodyDrugSeledList");
        $tbd.html("");
        var keyArr = ['orderDetailNo', 'orderNumber', 'matchPrice', 'productCode', 'dispatchName', 'drugNameCn', 'approvalNumber',];
        var roKeyArr = ['drugNameCn', 'approvalNumber',];

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
                ts += '<td><a onclick="toOption(2,\'' + json.drugId + '\')" style="margin:0 3px">删除</a></td>';
            }
            $tbd.append('<tr>' + ts + '</tr>');
        }
    }

    function toOption(type, drugId) {
        repushInputDrugs();
        if (drugId != null && drugId.length > 0) {
            if (type == 1) {
                setDrugOrder(drugId);
            } else if (type == 2) {
                removeObjById(dgLsAll, drugId, 'drugId');
                loadDrugOrderDetailList();
            }
        } else {
            alt.show(false, "当前操作选择的行数据有误，请重新选择添加，并操作");
        }
    }

    function setDrugOrder(drugId) {
        var $modal = $('#modal_order_detail');
        var $form = $('#form_order_detail');
        $form[0].reset();
        var fh = new FormHandler($form);
        for (var i in dgLsAll) {
            var js = dgLsAll[i];
            if (drugId == js.drugId) {
                fh.fillForm(js);
            }
        }

        $('#btn_submit_order_detail').off("click").on("click", function () {
            var data = fh.submitForm();
            if (data != null && data != '') {
                var drugId = data.drugId;
                var orderDetailNo = data.orderDetailNo;
                for (var i in dgLsAll) {
                    var js = dgLsAll[i];
                    if (orderDetailNo == js.orderDetailNo) {
                        if (drugId != js.drugId) {
                            alt.show(false, "该订单编号（" + orderDetailNo + "）已存在，请重新输入");
                            return;
                        }
                    }
                }
                for (var j in dgLsAll) {
                    var js = dgLsAll[j];
                    if (drugId == js.drugId) {
                        for (var key in data) {
                            js[key] = data[key];
                        }
                    }
                }
            }
            $("#tbodyDrugSeledList").html("");
            loadDrugOrderDetailList();
            $modal.modal('hide');
        });
        $('#btn_cancel_order_detail').on("click", function () {
            $modal.modal('hide');
        });
        $modal.modal({backdrop: 'static', keyboard: false, show: true});
    }

    function showOrderDetail(type, orid) {
        var isEdit;
        var orderDetailId;
        if (type == 1) {
            isEdit = true;
            orderDetailId = orid;
        } else {
            isEdit = false;
            var rid = $grid.jqGrid("getGridParam", "selrow");
            var rowData = $grid.jqGrid('getRowData', rid);
            orderDetailId = rowData.orderDetailId;
        }
        if (isNullObject(orderDetailId)) {
            alt.show(false, "暂无订单明细");
            return;
        }

        getDetailInfo(orderDetailId);
        $('#btn_submit_detail').css('display', isEdit ? 'inline-block' : 'none');
        $form.find("input").attr("readonly", !isEdit);
        var rn = ['medicalId', 'orderNo', 'orderRemark', 'orderDetailNo'];
        for (var i in rn) {
            $form.find("input[name='" + rn[i] + "']").attr("readonly", true);
        }
        $("#form_drug").find("input").attr("readonly", true);
    }

    function getDetailInfo(id) {
        if (id != null && id != '') {
            $form[0].reset();
            $('#form_drug')[0].reset();
            $.ajax({
                url: '<%=path%>' + getDetailUrl,
                data: {id: id},
                type: "post",
                dataType: "json",
                success: function (data) {
                    new FormHandler($form).fillForm(data);
                    new FormHandler($('#form_drug')).fillForm(data);
                    $modal.modal('show');
                },
                error: function () {
                    $form[0].reset();
                    $('#form_drug')[0].reset();
                    alt.show(false, "网络异常，信息查询出错！！");
                }
            });
        }
    }
</script>