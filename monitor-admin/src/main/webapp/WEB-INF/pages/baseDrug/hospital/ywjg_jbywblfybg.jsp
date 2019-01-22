<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2018/7/20
  Time: 下午2:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/head.jsp" %>
<style>
    select {
        width: 200px;
    }
</style>
<div class="main-content-inner">
    <div class="search-grid" id="search_grid">
        <span>患者姓名</span><input type="text" name="patientName" id="patientName"/>
        <span>不良反应事件名</span><input type="text"id="adverseEventName"/>
        <span>不良反应发生时间</span>
        <div class="input-group input-group-date">
            <input class="date-picker" type="text" data-date-format="yyyy-mm-dd" name="adverseEventDate"
                   id="adverseEventDate"/>
            <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
        </div>
        <span>医疗机构名称</span><input type="text" name="medicalId"  id="medicalId"/>
        <button id="btn_search" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-search"></i>搜索</button>
        <button id="btn_reset" class="btn btn-sm btn-purple"><i class="ace-icon fa fa-reply"></i>重置</button>
    </div>

    <table id="grid_table"></table>
    <div id="grid_pager"></div>

    <%@ include file="../../include/fotter.jsp" %>
</div>


<div id="modal_form" class="modal" tabindex="-1">
    <div class="modal-dialog" style="width:90%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">基本药物不良反应--报告信息</h4>
            </div>
            <div class="modal-body overflow-scroll" style="max-height: 450px">
                <form id="form_main" class="form-horizontal" role="form">
                    <table class="table">
                        <tr>
                            <input name="id" type="hidden"/>
                            <td>医疗机构名称<span style="color: red">*</span></td>
                            <td><input type="text" name="medicalId" required="required"/></td>
                            <td>报告频率</td>
                            <td>
                                <select name="reportFollow">
                                    <option value="0">首次报告</option>
                                    <option value="1">跟踪报告</option>
                                </select>
                            </td>
                            <td>报告编码</td>
                            <td><input type="text" name="reportCode"/></td>
                        </tr>

                        <tr>
                            <td>报告类型</td>
                            <td>
                                <select name="reportType">
                                    <option value="0">新的</option>
                                    <option value="1">严重</option>
                                    <option value="2">一般</option>
                                </select>
                            </td>
                            <td>报告单位类别</td>
                            <td>
                                <select name="reportUnitType" id="reportUnitType">
                                    <option value="0">医疗机构</option>
                                    <option value="1">经营企业</option>
                                    <option value="2">生产企业</option>
                                    <option value="3">个人</option>
                                    <option value="4">其他</option>
                                </select></td>
                            <td>报告单位描述</td>
                            <td><input type="text" name="reportUnitDescribe"/></td>
                        </tr>

                        <tr>
                            <td>患者姓名<span style="color: red">*</span></td>
                            <td><input type="text" name="patientName" required="required"/></td>
                            <td>性别<span style="color: red">*</span></td>
                            <td>
                                <select name="sex">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </td>
                            <td>出生日期</td>
                            <td><input name="birthday" class="form-control date-picker" type="text" required="required"
                                       data-date-format="yyyy-mm-dd"/></td>
                        </tr>

                        <tr>
                            <td>民族</td>
                            <td>
                                <select name="nation">
                                    <option value="汉族">汉族</option>
                                    <option value="蒙古族">蒙古族</option>
                                    <option value="回族">回族</option>
                                    <option value="藏族">藏族</option>
                                    <option value="维吾尔族">维吾尔族</option>
                                    <option value="苗族">苗族</option>
                                    <option value="彝族">彝族</option>
                                    <option value="壮族">壮族</option>
                                    <option value="布依族">布依族</option>
                                    <option value="朝鲜族">朝鲜族</option>
                                    <option value="满族">满族</option>
                                    <option value="侗族">侗族</option>
                                    <option value="瑶族">瑶族</option>
                                    <option value="白族">白族</option>
                                    <option value="土家族">土家族</option>
                                    <option value="哈尼族">哈尼族</option>
                                    <option value="哈萨克族">哈萨克族</option>
                                    <option value="傣族">傣族</option>
                                    <option value="黎族">黎族</option>
                                    <option value="傈僳族">傈僳族</option>
                                    <option value="佤族">佤族</option>
                                    <option value="畲族">畲族</option>
                                    <option value="高山族">高山族</option>
                                    <option value="拉祜族">拉祜族</option>
                                    <option value="水族">水族</option>
                                    <option value="东乡族">东乡族</option>
                                    <option value="纳西族">纳西族</option>
                                    <option value="景颇族">景颇族</option>
                                    <option value="柯尔克孜族">柯尔克孜族</option>
                                    <option value="土族">土族</option>
                                    <option value="达斡尔族">达斡尔族</option>
                                    <option value="仫佬族">仫佬族</option>
                                    <option value="羌族">羌族</option>
                                    <option value="布朗族">布朗族</option>
                                    <option value="撒拉族">撒拉族</option>
                                    <option value="毛南族">毛南族</option>
                                    <option value="仡佬族">仡佬族</option>
                                    <option value="锡伯族">锡伯族</option>
                                    <option value="阿昌族">阿昌族</option>
                                    <option value="普米族">普米族</option>
                                    <option value="塔吉克族">塔吉克族</option>
                                    <option value="怒族">怒族</option>
                                    <option value="乌孜别克族">乌孜别克族</option>
                                    <option value="俄罗斯族">俄罗斯族</option>
                                    <option value="鄂温克族">鄂温克族</option>
                                    <option value="德昂族">德昂族</option>
                                    <option value="保安族">保安族</option>
                                    <option value="裕固族">裕固族</option>
                                    <option value="京族">京族</option>
                                    <option value="塔塔尔族">塔塔尔族</option>
                                    <option value="独龙族">独龙族</option>
                                    <option value="鄂伦春族">鄂伦春族</option>
                                    <option value="赫哲族">赫哲族</option>
                                    <option value="门巴族">门巴族</option>
                                    <option value="珞巴族">珞巴族</option>
                                    <option value="基诺族">基诺族</option>
                                </select>
                            </td>
                            <td>体重（kg）</td>
                            <td><input type="text" name="weight"/></td>
                            <td>联系电话</td>
                            <td><input type="tel" name="telephoneNumber"/></td>
                        </tr>

                        <tr>
                            <td>原患疾病</td>
                            <td><input type="text" name="diseaseName"/></td>
                            <td>医院名称<span style="color: red">*</span></td>
                            <td><input type="text" name="hospital" required="required"/></td>
                            <td>病历号/门诊号<span style="color: red">*</span></td>
                            <td><input type="text" name="visitingSerialNumber" required="required"/></td>
                        </tr>

                        <tr>
                            <td>既往药品不良反应</td>
                            <td>
                                <select name="pastDrugs">
                                    <option value="0">有</option>
                                    <option value="1">无</option>
                                    <option value="2">不祥</option>
                                </select>
                            </td>
                            <td>既往药品不良反应描述</td>
                            <td><input type="text" name="pastDrugsDescribe"/></td>
                            <td>家族药品不良反应</td>
                            <td>
                                <select name="familyDurgs">
                                    <option value="0">有</option>
                                    <option value="1">无</option>
                                    <option value="2">不祥</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>家族药品不良反应描述</td>
                            <td><input type="text" name="familyDurgsDescribe"/></td>
                            <td>是否有吸烟史</td>
                            <td>
                                <select name="smokingStatus">
                                    <option value="0">否</option>
                                    <option value="1">是</option>
                                </select>
                            </td>
                            <td>是否有饮酒史</td>
                            <td>
                                <select name="drinking">
                                    <option value="0">否</option>
                                    <option value="1">是</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>是否有妊娠期</td>
                            <td><select name="gestation">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select></td>
                            <td>是否有肝病史</td>
                            <td><select name="hepatopathy">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select></td>
                            <td>是否有肾病史</td>
                            <td><select name="nephropathy">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select></td>
                        </tr>

                        <tr>
                            <td>是否有过敏史</td>
                            <td><select name="allergy">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select></td>
                            <td>是否有过敏史描述</td>
                            <td><input type="text" name="allergyDescribe"/></td>
                            <td>其他重要信息</td>
                            <td><input type="text" name="otherMessage"/></td>
                        </tr>

                        <tr>
                            <td>不良反应事件名<span style="color: red">*</span></td>
                            <td><input type="text" name="adverseEventName" required="required"/></td>
                            <td>不良反应发生时间</td>
                            <td><input name="adverseEventDate" class="form-control date-picker" type="text"
                                       data-date-format="yyyy-mm-dd" required="required"/></td>
                            <td>不良反应过程描述</td>
                            <td><input type="text" name="adverseEventDescribe"/></td>
                        </tr>

                        <tr>
                            <td>不良反应结果</td>
                            <td>
                                <select name="result">
                                    <option value="0">痊愈</option>
                                    <option value="1">好转</option>
                                    <option value="3">未好转</option>
                                    <option value="4">不详</option>
                                    <option value="5">有后遗症</option>
                                    <option value="6">死亡</option>
                                </select>
                            </td>
                            <td>不良反应有后遗症描述</td>
                            <td><input type="text" name="sequelaDescribe"/></td>
                            <td>不良反应直接死因</td>
                            <td><input type="text" name="causeOfDeath"/></td>
                        </tr>

                        <tr>
                            <td>死亡时间</td>
                            <td><input name="timeOfDeath" class="form-control date-picker" type="text"
                                       data-date-format="yyyy-mm-dd"/></td>
                            <td>停药或减量后是否有减轻</td>
                            <td>
                                <select name="useAgain">
                                    <option value="0">是</option>
                                    <option value="1">否</option>
                                    <option value="2">不明</option>
                                    <option value="3">未停药或减量</option>
                                </select>
                            </td>
                            <td>再次使用是否再出现不良反应</td>
                            <td>
                                <select name="lessenTheSymptoms">
                                    <option value="0">是</option>
                                    <option value="1">否</option>
                                    <option value="2">不明</option>
                                    <option value="3">未再使用</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>对患者影响</td>
                            <td>
                                <select name="patientImpact">
                                    <option value="0">不明显</option>
                                    <option value="1">病程延长</option>
                                    <option value="2">病情加重</option>
                                    <option value="3">导致后遗症</option>
                                    <option value="4">导致死亡</option>
                                </select>
                            </td>
                            <td>报告人评价</td>
                            <td>
                                <select name="reportEvaluate">
                                    <option value="1">肯定</option>
                                    <option value="2">很可能</option>
                                    <option value="3">可能</option>
                                    <option value="4">可能无关</option>
                                    <option value="5">待评价</option>
                                    <option value="6">无法评价</option>
                                </select>
                            </td>
                            <td>报告单位评价</td>
                            <td>
                                <select name="reportUnitEvaluate">
                                    <option value="1">肯定</option>
                                    <option value="2">很可能</option>
                                    <option value="3">可能</option>
                                    <option value="4">可能无关</option>
                                    <option value="5">待评价</option>
                                    <option value="6">无法评价</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>报告人联系电话</td>
                            <td>
                                <input type="text" name="reportTel"/></td>
                            <td>报告人职业</td>
                            <td>
                                <select name="reportJob" id="reportJob">
                                    <option value="0">医生</option>
                                    <option value="1">药师</option>
                                    <option value="2">护士</option>
                                    <option value="3">其他</option>
                                </select>
                            </td>
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
                            <td>报告日期<span style="color: red">*</span></td>
                            <td><input name="reportDate" class="form-control date-picker" type="text"
                                       data-date-format="yyyy-mm-dd" required/></td>
                            <td>生产企业消息来源</td>
                            <td>
                                <select name="manuFrom" id="manuFrom">
                                    <option value="0">医疗机构</option>
                                    <option value="1">经营企业</option>
                                    <option value="2">个人</option>
                                    <option value="3">文献报道</option>
                                    <option value="4">上市后研究</option>
                                    <option value="5">其他</option>
                                </select>
                            </td>
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

<!--搜索药品模态框-->

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
                                <a id="btnCond2" style="float: right;"
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
                        <p class="subtitle">以下为当前已选择的药品列表信息(产品名为灰色则为已添加的药品)</p>
                        <table class="table" id="selectEdDrugTable">
                            <thead>
                            <tr>
                                <th style="display:none;">ID</th>
                                <th>产品名</th>
                                <th>用法用量</th>
                                <th>药品类型</th>
                                <th>用药开始时间</th>
                                <th>用药结束时间</th>
                                <th>用药原因</th>
                                <th>操作</th>
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
    $(function () {
        initView();
    })
    //创建一个新的数组，存取刚刚添加的数据id
    var AddArr = [];
    //创建一个新的数组，存取需要删除的数据id
    var deleteIdArr = [];
    //创建一个是否保存操作的标志
    var SAVE_FLAG = false;
    //设置不良反应ID
    var ADVERSE_EVENT_ID = '';
    //设置一选择的药品ID数组
    var DrugIds = [];
    //设置--选择药品的状态:是否曾经添加过
    var DrugIsAdd = [];

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
            //获取当前行的id
            var deleteId = $(e).parent().parent().find("td").find("input").eq(0).val();
            if (deleteId != "") {
                deleteIdArr.push(deleteId);
                AddArr.removeArray(id);
                DrugIds.removeArray(id);
                FIRST_FLAG = false;
                $(e).parent().parent().remove();
                al.show(true, "数据删除成功！！");
            } else {
                $(e).parent().parent().remove();
                AddArr.removeArray(id);
                FIRST_FLAG = false;
                al.show(true, "数据删除成功！！");
            }
        }
    }
    var FIRST_FLAG = true;
    var trLength = 0;

    //获取表中选中的id
    function addSelectDrug(ids, status) {
        var FIRST_TB_LENGTH = $("#selectEdDrugTable").find("#tbody_add").children().length;
        //如果是第一次进来，则为table中tr的原长度，否则为其本身
        trLength = FIRST_FLAG ? FIRST_TB_LENGTH : trLength;
        FIRST_FLAG = false;
        if (status) {
            var ids = ids;
            if (ids != null) {
                var flag = true;
                for (var j = 0; j < DrugIds.length; j++) {
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
                    if (ids == DrugIds[j] && DrugIsAdd[j] == '0') {
                        flag = false;
                        $.get("<%=path%>/drugInfo/getDrugInfoNameById.do?id=" + ids, function (result) {
                            al.show(false, result + "已在添加药品中,请重新选择");
                        })
                        break;
                    }
                }
            }
            if (flag) {
                var htmlId = '';
                var htmlMediName = '';
                var html = '';
                var data = $('#grid_table_drug').jqGrid('getRowData', ids);
                htmlId += '<tr id="TR' + data.id + '"><td  style="display:none;">' + '<input name="drugList[' + trLength + '].id" value=""/><input name="drugList[' + trLength + '].drugId" value="' + data.id + '"/><input name="drugList[' + trLength + '].adverseEventId" value="' + ADVERSE_EVENT_ID + '"/><input name="drugList[' + trLength + '].mediName" readonly="readonly"  value="' + data.mediName + '"/><input name="drugList[' + trLength + '].approvalNumber" value="' + data.approvalNumber + '"/><input name="drugList[' + trLength + '].currencyName" value="' + data.genericName + '"/><input name="drugList[' + trLength + '].manufacturer" value="' + data.manufacturer + '"/>';
                htmlId += '</td>';
                htmlMediName += '<td>' + data.mediName;
                htmlMediName += '</td>';
                html += '<td><input name="drugList[' + trLength + '].use" placeholder="用法用量"/></td><td><select name="drugList[' + trLength + '].drugType" style="width:100px">' +
                    '<option value="0">怀疑药品</option><option value="1">并用药品</option></select></td>' +
                    '<td><input name="drugList[' + trLength + '].beginDate" class="form-control date-picker" onclick="initView()" type="text" data-date-format="yyyy-mm-dd" placeholder="用药开始时间"/></td>' +
                    '<td><input name="drugList[' + trLength + '].endDate" class="form-control date-picker" onclick="initView()" type="text" data-date-format="yyyy-mm-dd" placeholder="用药结束时间"/></td>' +
                    '<td><input name="drugList[' + trLength + '].useReason" placeholder="用药原因"/></td>' +
                    '<td><input type="button" value="删除" onclick="deleteThisInfo(this,\'' + data.id + '\')"/></td></tr>';
                //判断table中是否有tr，若无，采用.html(),若有，采用.before()
                var trs = $("#selectEdDrugTable").find("#tbody_add").find("tr");
                trLength++;
                AddArr.push(ids);
                if (trs.length == 0) {
                    $("#selectEdDrugTable").find("#tbody_add").html(htmlId + htmlMediName + html);
                } else {
                    $("#selectEdDrugTable").find("#tbody_add").find("tr:last").after(htmlId + htmlMediName + html);
                }
            }
        } else {
            AddArr.removeArray(ids);
            $("#TR" + ids + "").remove();
        }
    }

    $(function () {
        initView();
        pageInit();
        btnSearchDrug();
        btnResetDrug();
        $('#btn_submit_drug').off("click").on("click", function () {
            if (window.confirm('确定添加该数据吗？')) {
                if(deleteIdArr.length > 0 ){
                    var html = '<tr style="display: none"> <td><input name = "deleteIdArr" value = '+deleteIdArr+' > </td></tr>';
                    $("#selectEdDrugTable").find("#tbody_add").find("tr:last").after(html);
                }
                var al = new AlertTools();

                $.ajax({
                    type: 'POST',
                    url: '<%=path%>/drugAdverseEvent/addDrugAdverseEventAndDrugInfo.do',
                    data: $("#form_add").serialize(),
                    dataType: 'json',
                    success: function (result) {
                        if (!result) {
                            result.type = false;
                            result.msg = "服务器数据获取失败！！"
                        }
                        deleteIdArr = [];
                        // SAVE_FLAG = true;
                        // deleteIdInfo();
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
            pageInit();
            $("#tbody_add").html("");
            $('#modal_select_drug').modal('hide');

        });

        //不良反应药品信息查看
        $('#btn_search_adverse_drug').off("click").on("click", function () {
            var data = {
                mediName: $('#selMediName').val().trimA(),
                dataStatus: '9',//只查询已审核的记录
            };
            $('#grid_table_drug').jqGrid('setGridParam', {
                url: '<%=path%>/drugInfo/queryDrugInfoPage.do',//你的搜索程序地址
                datatype: 'json',
                postData: data, //发送数据
                page: 1
            }).trigger("reloadGrid"); //重新载入
        });

    })
    var option = {
        caption: "基本药物不良反应报告",
        url: '<%=path%>/drugAdverseEvent/getdrugAdverseEventPage.do',
        datatype: "json",
        height: 360,
        mtype: "post",
        autowidth: true,
        rownumbers: true,
        multiselect: false,//显示行选择cb
        multiboxonly: true,//单选行
        shrinkToFit: false,//横向滑动
        colModel: [
            {name: 'id', index: 'id', hidden: true},
            {name: 'reportCode', index: 'reportCode', label: '报告编号', width: 100, sortable: true, frozen: true},
            {name: 'patientName', index: 'patientName', label: '患者姓名', width: 100, sortable: true, frozen: true},
            {name: 'sex', index: 'sex', label: '性别', width: 50, sortable: true},
            {name: 'birthday', index: 'birthday', label: '出生日期', width: 100, sortable: true},
            {name: 'adverseEventName', index: 'adverseEventName', label: '不良反应事件名', width: 120, sortable: true},
            {name: 'adverseEventDate', index: 'adverseEventDate', label: '不良反应发生时间', width: 130, sortable: true},
            /* {
                 name: 'reportType', index: 'reportType', label: '报告类型', width: 100, sortable: true,
                 formatter: function (v, o, r) {
                     if (v == 0) {
                         v = '<span >新的</span>'
                     } else if (v == 9) {
                         v = '<span >严重</span>'
                     } else {
                         v = '<span >一般</span>'
                     }
                     return v;
                 }
             },*/
            {name: 'hyName', index: 'hyName', label: '怀疑药品', width: 150, hidden: false},
            {name: 'byName', index: 'byName', label: '并用药品', width: 150, hidden: false},
            {name: 'reportDate', index: 'reportDate', label: '报告日期', width: 100, sortable: true},
            {
                name: '', index: '', width: 200, align: 'center',
                formatter: function (v, i, r) {
                    return "<div class='hidden-sm hidden-xs action-buttons'><a  class='blue' onclick='lookFormDrug(\"" + r.id + "\")' " +
                        "title='编辑药品信息' >编辑药品信息  </a>&nbsp;" +
                        "<a  href='<%=path%>/drugAdverseEvent/getDrugAdverseEventViewDetail.do?id=" + r.id + " ' class='blue'title='查看不良反应报告' target='_blank'>查看报告</a></div>";
                }
            },
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
    var $modal_form = $('#modal_form');

    var $form_main = $('#form_main');
    var $grid_table = $("#grid_table");
    var add_url = '/drugAdverseEvent/addDrugAdverseEvent.do';
    var update_url = '/drugAdverseEvent/updateDrugAdverseEvent.do';
    var view_url = '/drugAdverseEvent/getDrugAdverseEventSingleDetail.do';
    var grid_url = '/drugAdverseEvent/getdrugAdverseEventPage.do';

    //展示药品信息
    function showDrugSelect() {
        $("#modal_select_drug").modal("show");
        var grid = $('#grid_table_drug');
        grid.jqGrid({
            url: '<%=path%>/drugInfo/queryDrugInfoPage.do',
            datatype: "json",
            postData: {dataStatus: '9'},
            height: 180,
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
        }).trigger("reloadGrid"); //重新载入;
    }

    //当报告类别为4：其他时候，该描述必填
    $("#reportUnitType").blur(function () {
        var reportTypeValue = $("#reportUnitType option:checked").val();
        if (reportTypeValue == 4) {
            $("input[name='reportUnitDescribe']").attr("required", "required");
            $("input[name='reportUnitDescribe']").attr("placeholder", "此信息必填");
        }
    })
    //当报告人职业为3：其他时候，该描述必填
    $("#reportJob").blur(function () {
        var reportTypeValue = $("#reportJob option:checked").val();
        if (reportTypeValue == 3) {
            $("input[name='reportJobDescribe']").attr("required", "required");
            $("input[name='reportJobDescribe']").attr("placeholder", "此信息必填");
        }
    })
    //当生产企业消息来源为5：其他时候，该描述必填
    $("#manuFrom").blur(function () {
        var reportTypeValue = $("#manuFrom option:checked").val();
        if (reportTypeValue == 5) {
            $("input[name='manuFromDescribe']").attr("required", "required");
            $("input[name='manuFromDescribe']").attr("placeholder", "此信息必填");
        }
    })

    $('#btn_search').off("click").on("click", function () {
        var data = {
            patientName: $('#patientName').val().trimA(),
            adverseEventName: $('#adverseEventName').val().trimA(),
            medicalId: $('#medicalId').val().trimA(),
            adverseEventDate: $('#adverseEventDate').val().trimA()
        };
        gb.search(data, grid_url);
    });
    $('#btn_reset').on("click", function () {
        gb.reset('search_grid');
    });

    function pageInit() {
        $grid_table.jqGrid(option);

        $grid_table.jqGrid('navGrid', "#grid_pager", {
            edit: false, edittext: '编辑', editicon: 'ace-icon fa fa-pencil blue',
            add: true, addtext: '创建报告', addicon: 'ace-icon fa fa-plus-circle purple',
            del: false, deltext: '删除', delicon: 'ace-icon fa fa-trash-o red',
            refresh: true, refreshtext: '刷新', refreshicon: 'ace-icon fa fa-refresh green',
            view: false, viewtext: '查看详情', viewicon: 'ace-icon fa fa-search-plus grey',
            search: false, searchtext: '搜索', searchicon: 'ace-icon fa fa-search orange',
            addfunc: function () {
                gb.add();
            },
            editfunc: function () {
                gb.update();
            },
            viewfunc: function () {
                gb.view();
            },
            position: 'left', alertwidth: 300,
            alertcap: '<span style="color: orange">操作出错</span>',
            alerttext: '<div style="color: red;text-align: center;font-size:large">请选择需要操作的数据行！</div>'
        }).trigger("reloadGrid");
        gb = new GridBtn($grid_table, $modal_form, $form_main);
        gb.setPath(add_url, '', update_url, view_url);
    }



    var lookFormDrug = function (id) {
        ADVERSE_EVENT_ID = id;
        if (DrugIds.length > 0 || DrugIsAdd.length > 0) {
            DrugIds = [];
            DrugIsAdd = [];
        }
        $.ajax({
            type: 'POST',
            url: '<%=path%>/drugAdverseEvent/getAdverseEventDrugsFromMap.do',
            data: {adverseEventId: id},
            dataType: 'json',
            success: function (result) {
                var html = '';
                $.each(result, function (i, n) {
                    html += '<tr style="color: gray"><td style="display: none"><input name="drugList[' + i + '].id" value="' + n.id + '"/><input name="drugList[' + i + '].drugId" value="' + n.drugId + '"/><input name="drugList[' + i + '].adverseEventId" value="' + n.adverseEventId + '"/><input name="drugList[' + i + '].mediName" readonly="readonly"  value="' + n.mediName + '"/><input name="drugList[' + i + '].approvalNumber" value="' + n.approvalNumber + '"/><input name="drugList[' + i + '].currencyName" value="' + n.currencyName + '"/><input name="drugList[' + i + '].manufacturer" value="' + n.manufacturer + '"/></td>';
                    html += '<td>' + n.mediName + '</td>';
                    html += '<td><input name="drugList[' + i + '].use" value="' + n.use + '"/></td>';
                    if (n.drugType == 0) {
                        html += '<td><select name="drugList[' + i + '].drugType" style="width:100px" ><option value="0" selected>怀疑药品</option><option value="1">并用药品</option></select></td>';
                    } else if (n.drugType == 1) {
                        html += '<td><select name="drugList[' + i + '].drugType" style="width:100px" ><option value="0" >怀疑药品</option><option value="1" selected>并用药品</option></select></td>';
                    }
                    html += '<td><input name="drugList[' + i + '].beginDate"  class="form-control date-picker" onclick="initView()" value="' + n.beginDate + '" data-date-format="yyyy-mm-dd" /></td></td>';
                    html += '<td><input name="drugList[' + i + '].endDate"  class="form-control date-picker" onclick="initView()" value="' + n.endDate + '" data-date-format="yyyy-mm-dd" /></td></td>';
                    html += '<td><input name="drugList[' + i + '].useReason" value="' + n.useReason + '"/></td>';
                    html += '<td><input type="button" value="删除" onclick="deleteThisInfo(this,\'' + n.drugId + '\')"/></td></tr>';
                    DrugIds.push(n.drugId);
                    DrugIsAdd.push(n.removed);
                });
                $("#selectEdDrugTable").find("#tbody_add").html(html);
            }
        });
        showDrugSelect();
        $('#modal_select_drug').modal("show");
        var title = "药物信息   " + "<span class='title-tip' style='color: red'>提示：单击选择或取消药品</span>";
        //$("#grid_table_drug").jqGrid("setCaption", title);
    };

    function btn_cancel() {
        $modal_form.modal('hide');
    }

    $('body').on('mousemove','.date-picker',function(){
        $(this).datepicker();
    })

</script>