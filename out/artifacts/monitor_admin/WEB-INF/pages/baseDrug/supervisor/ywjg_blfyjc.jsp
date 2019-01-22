<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2018/7/23  下午2:42
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="../../include/head.jsp"%>

<div class="main-content-inner">
    <div class="search-grid" id="search_grid">
        <span>患者姓名</span><input type="text" name="patientName" id="patientName"/>
        <span>不良反应事件名</span><input type="text"id="adverseEventName"/>
        <span>不良反应发生时间</span>
        <div class="input-group input-group-date">
            <input style="width: 150px" class="date-picker" type="text" data-date-format="yyyy-mm-dd"
                   name="adverseEventDate" id="adverseEventDate"/>
            <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
        </div>
        <span>医疗机构名称</span><input type="text" name="medicalId" id="medicalId"/>
        <button id="btn_search" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-search"></i>搜索</button>
        <button id="btn_reset" class="btn btn-sm btn-purple"><i class="ace-icon fa fa-reply"></i>重置</button>
    </div>

    <table class="grid-scl-bottom" id="grid_table"></table>
    <div id="grid_pager"></div>


    <%@ include file="../../include/fotter.jsp" %>
</div>

<div id="modal_form_drug" class="modal" style="z-index: 1060" tabindex="-1">
    <div class="modal-dialog" style="width:70%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm"  data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">药物配送信息查看</h4>
            </div>

            <div class="modal-body overflow-scroll" style="max-height: 450px">
                <form id="form_main_drug" role="form">
                    <table class="table">
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

                        <tr>
                            <td>药品名称:</td>
                            <td><input name="drugName"/></td>
                            <td>剂型:</td>
                            <td><input name="dosageForm"/></td>
                            <td>制剂规格:</td>
                            <td><input name="drugSpec"/></td>
                        </tr>
                        <tr>
                            <td>批准文号:</td>
                            <td><input name="approvalNumber"/></td>
                            <td>生产厂商:</td>
                            <td><input name="manufacturer"/></td>
                            <td>包装单位:</td>
                            <td><input name="packagingUnit"/></td>
                        </tr>
                        <tr>
                            <td>最小使用单位:</td>
                            <td><input name="minUseUnit"/></td>
                            <td>包装规格:</td>
                            <td><input name="packingSpecifications"/></td>
                            <td>分类:</td>
                            <td><input name="type"/></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <div class="modal-footer">
            <button id="btn_cancel_drug" class="btn btn-sm btn-grey"><i class="ace-icon fa fa-times"></i>取消</button>
            <button id="btn_submit_drug" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-check"></i>保存</button>
        </div>
    </div>

</div>
<!-- 模态框详细信息 （Modal） -->
<div id="modal_form_drug_detail" class="modal" tabindex="-1"  role="dialog" style="display:none;overflow:auto">
    <div class="modal-dialog" style="width:80%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true" >x</button>
                <h4 class="blue bigger">不良反应监测--药品信息</h4>
            </div>
            <div class="modal-body overflow-scroll" style="max-height: 550px;overflow: auto">
                <div class="row">
                    <div class="col-xs-12">
                        <table class="grid-scl-bottom" id="grid_table2"></table>
                        <div id="grid_pager2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="modal_form" class="modal" tabindex="-1">
    <div class="modal-dialog" style="width:90%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">不良反应监测详细信息</h4>
            </div>
            <div class="modal-body overflow-scroll" style="max-height: 500px">
                <form id="form_main" class="form-horizontal" role="form">
                    <table class="table">
                        <tr>
                            <td>医疗机构ID</td>
                            <td><input type="text" name="medicalId"/></td>
                            <td>报告频率</td>
                            <td><input type="text" name="reportFollow"/></td>
                            <td>报告编码</td>
                            <td><input type="text" name="reportCode"/></td>
                        </tr>

                        <tr>
                            <td>报告类型</td>
                            <td><input type="text" name="reportType"/></td>
                            <td>报告单位类别</td>
                            <td><input type="text" name="reportUnitType"/></td>
                            <td>报告单位描述</td>
                            <td><input type="text" name="reportUnitDescribe"/></td>
                        </tr>

                        <tr>
                            <td>患者姓名</td>
                            <td><input type="text" name="patientName"/></td>
                            <td>性别</td>
                            <td><input type="text" name="sex"/></td>
                            <td>出生日期</td>
                            <td><input name="birthday" class="form-control date-picker" type="text" data-date-format="yyyy-mm-dd"/></td>
                        </tr>

                        <tr>
                            <td>民族</td>
                            <td><input type="text" name="nation"/></td>
                            <td>体重</td>
                            <td><input type="text" name="weight"/></td>
                            <td>联系电话</td>
                            <td><input type="text" name="telephoneNumber"/></td>
                        </tr>

                        <tr>
                            <td>原患疾病</td>
                            <td><input type="text" name="diseaseName"/></td>
                            <td>医院名称</td>
                            <td><input type="text" name="hospital"/></td>
                            <td>病历号/门诊号</td>
                            <td><input type="text" name="visitingSerialNumber"/></td>
                        </tr>

                        <tr>
                            <td>既往药品不良反应</td>
                            <td><input type="text" name="pastDrugs"/></td>
                            <td>既往药品不良反应描述</td>
                            <td><input type="text" name="pastDrugsDescribe"/></td>
                            <td>家族药品不良反应</td>
                            <td><input type="text" name="familyDurgs"/></td>
                        </tr>

                        <tr>
                            <td>家族药品不良反应描述</td>
                            <td><input type="text" name="familyDurgsDescribe"/></td>
                            <td>是否有吸烟史</td>
                            <td><input type="text" name="smokingStatus"/></td>
                            <td>是否有饮酒史</td>
                            <td><input type="text" name="drinking"/></td>
                        </tr>

                        <tr>
                            <td>是否有妊娠期</td>
                            <td><input type="text" name="gestation"/></td>
                            <td>是否有肝病史</td>
                            <td><input type="text" name="hepatopathy"/></td>
                            <td>是否有肾病史</td>
                            <td><input type="text" name="nephropathy"/></td>
                        </tr>

                        <tr>
                            <td>是否有过敏史</td>
                            <td><input type="text" name="allergy"/></td>
                            <td>是否有过敏史描述</td>
                            <td><input type="text" name="allergyDescribe"/></td>
                            <td>其他重要信息</td>
                            <td><input type="text" name="otherMessage"/></td>
                        </tr>

                        <tr>
                            <td>不良反应事件名</td>
                            <td><input type="text" name="adverseEventName"/></td>
                            <td>不良反应发生时间</td>
                            <td><input name="adverseEventDate" class="form-control date-picker" type="text" data-date-format="yyyy-mm-dd"/></td>
                            <td>不良反应过程描述</td>
                            <td><input type="text" name="adverseEventDescribe"/></td>
                        </tr>

                        <tr>
                            <td>不良反应结果</td>
                            <td><input type="text" name="result"/></td>
                            <td>不良反应有后遗症描述</td>
                            <td><input type="text" name="sequelaDescribe"/></td>
                            <td>不良反应直接死因</td>
                            <td><input type="text" name="causeOfDeath"/></td>
                        </tr>

                        <tr>
                            <td>死亡时间</td>
                            <td><input name="timeOfDeath" class="form-control date-picker" type="text" data-date-format="yyyy-mm-dd"/></td>
                            <td>停药或减量后是否有减轻</td>
                            <td><input type="text" name="useAgain"/></td>
                            <td>再次使用是否再出现不良反应</td>
                            <td><input class="col-sm-5 blue" type="text" name="lessenTheSymptoms"/></td>
                        </tr>

                        <tr>
                            <td>对患者影响</td>
                            <td><input type="text" name="patientImpact"/></td>
                            <td>报告人评价</td>
                            <td><input type="text" name="reportEvaluate"/></td>
                            <td>报告单位评价</td>
                            <td><input type="text" name="reportUnitEvaluate"/></td>
                        </tr>

                        <tr>
                            <td>报告人联系电话</td>
                            <td><input type="text" name="reportTel"/></td>
                            <td>报告人职业</td>
                            <td><input type="text" name="reportJob"/></td>
                            <td>报告人职业描述</td>
                            <td><input type="text" name="reportJobDescribe"/></td>
                        </tr>

                        <tr>
                            <td>报告人电子邮箱</td>
                            <td><input type="text" name="reportEmail"/></td>
                            <td>报告单位名称</td>
                            <td><input type="text" name="reportUnitName"/></td>
                            <td>报告单位联系人</td>
                            <td><input type="text" name="reportUnitContacts"/></td>
                        </tr>

                        <tr>
                            <td>报告单位电话</td>
                            <td><input type="text" name="reportUnitTel"/></td>
                            <td>报告日期</td>
                            <td><input name="reportDate"  type="text" /></td>
                            <td>生产企业消息来源</td>
                            <td><input type="text" name="manuFrom"/></td>
                        </tr>

                        <tr>
                            <td>生产企业消息来源描述</td>
                            <td><input type="text" name="manuFromDescribe"/></td>
                            <td>备注</td>
                            <td><input type="text" name="remark"/></td>
                            <td colspan="2"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <div class="modal-footer">
            <button id="btn_cancel" class="btn btn-sm btn-grey"><i class="ace-icon fa fa-times"></i>取消</button>
            <button id="btn_submit" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-check"></i>保存</button>
        </div>
    </div>
</div>
<script type="text/javascript">

    var option={
        caption: "不良反应信息列表",
        url: '<%=path%>/drugAdverseEvent/getdrugAdverseEventPage.do',
        datatype: "json",
        height: 360,
        mtype: "post",
        autowidth: true,
        rownumbers: true,
        multiselect: false,//显示行选择cb
        multiboxonly: true,//单选行
        shrinkToFit: true,//横向滑动
        colModel: [
            {name: 'id', index: 'id', width: 100, sortable: true, editable: true,hidden:true},
            {name: 'hospital', index: 'hospital', width: 100,label:'医院名称', sortable: true, editable: false},
            {name: 'patientName', index: 'patientName',label:'患者姓名', width: 100, sortable: true, editable: true},
            {name: 'sex', index: 'sex', width: 50, sortable: true,label:'性别', editable: true},
            {name: 'reportType', index: 'reportType', width: 100,label:'报告类型', sortable: true, editable: true},
            {name: 'adverseEventName', index: 'adverseEventName',label:'不良反应事件名', width: 120, sortable: true, editable: false},
            {name: 'adverseEventDate', index: 'adverseEventDate',label:'不良反应发生时间', width: 120, sortable: true, editable: false},
            {
                name: ' ', index: ' ', align: 'center', width: 120, editable: true,
                formatter: function (v, i, r) {
                    return "<a  href='<%=path%>/drugAdverseEvent/getDrugAdverseEventViewDetail.do?id="+r.id+ " ' class='blue'title='查看不良反应报告' target='_blank'>查看不良反应报告</a>";
                },
            }
        ],
        loadComplete: function () {updatePagerIcons(this);},
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

    $(function(){
        pageInit();
    })

    function getView(id){
        gb.view(id);
    }
    var $modal_form = $('#modal_form');
    var $form_main = $('#form_main');
    var $grid_table = $("#grid_table");
    var $grid_pager = $('#grid_pager');
    var gb = new GridBtn($grid_table, $modal_form, $form_main);
    var view_url = '/drugAdverseEvent/getDrugAdverseEventSingleDetail.do';
    var grid_url = '/drugAdverseEvent/getdrugAdverseEventPage.do';
    gb.setPath('', '', '',view_url);



    $('#btn_reset').on("click", function () {
        gb.reset('search_grid');
    });
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
            addfunc: function () {gb.add();},
            editfunc: function () {gb.update();},
            viewfunc: function () {gb.view();},
            delfunc: function () {gb.delete();},
            alertwidth: 300,
            alertcap: '<span style="color: orange">操作出错</span>',
            alerttext: '<div style="color: red;text-align: center;font-size:large">请选择需要操作的数据行！</div>'
        });
    }
    $('.date-picker').datepicker({
        autoclose: true, todayHighlight: true
    }).next().on(ace.click_event, function () {
        $(this).prev().focus();
    });

    $('#btn_search').off("click").on("click", function () {
        var data = {
            patientName: $('#patientName').val().trimA(),
            adverseEventName: $('#adverseEventName').val().trimA(),
            medicalId: $('#medicalId').val().trimA(),
            adverseEventDate: $('#adverseEventDate').val(),
        };
        gb.search(data, grid_url);
    });
</script>