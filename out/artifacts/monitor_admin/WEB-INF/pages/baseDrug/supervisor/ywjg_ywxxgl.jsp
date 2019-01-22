<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2018/7/23  下午2:41
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="../../include/head.jsp" %>

<div class="main-content-inner">
    <div class="search-grid" id="search_grid">
        <span>目录分组名</span><input type="text" id="groupName"/>
        <span>药物名称</span><input type="text" id="drugNameCn"/>
        <span>产品名</span><input type="text" id="mediName"/>
        <span>审核状态</span>
        <select id="dataStatus" id="dataStatus">
            <option value="">全部</option>
            <option value="0">待审核</option>
            <option value="9">审核通过</option>
            <option value="4">审核不通过</option>
        </select>
        <button id="btn_search" class="btn btn-sm btn-primary">
            <i class="ace-icon fa fa-search"></i>搜索
        </button>
        <button id="btn_reset" class="btn btn-sm btn-purple">
            <i class="ace-icon fa fa-reply"></i>重置
        </button>
    </div>

    <table id="grid_table"></table>
    <div id="grid_pager"></div>

    <%@include file="../../include/fotter.jsp" %>
</div>

<div id="modal_form" class="modal" tabindex="-1">
    <div class="modal-dialog" style="width:90%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">药物管理信息</h4>
            </div>

            <div class="modal-body overflow-scroll">
                <form id="form_main" role="form">
                    <input name="id" hidden/>
                    <table class="table">
                        <tr>
                            <td class="subtitle" colspan="6">药物所属分组信息</td>
                            <input name="groupId" id="fGroupId" hidden/>
                        </tr>
                        <tr>
                            <td>目录分组名:</td>
                            <td colspan="3"><input name="groupName" id="fGroupName" readonly/></td>
                            <td>药交备注:</td>
                            <td><input name="remark" id="fRemark" readonly/></td>
                        </tr>
                        <tr>
                            <td>目录分组依据</td>
                            <td colspan="3"><input name="groupSource" id="fGroupSource" readonly/></td>
                            <td>分类</td>
                            <td><input name="type" id="fType" readonly/></td>
                            <%--<td>国家医保</td>--%>
                            <%--<td><input name="gjyb" id="fGjyb" readonly/></td>--%>
                            <%--<td>省医保:</td>--%>
                            <%--<td><input name="syb" id="fSyb" readonly/></td>--%>
                        </tr>
                        <tr>
                            <td class="subtitle" colspan="6">药物的基本信息</td>
                        </tr>
                        <tr>
                            <td>产品名</td>
                            <td><input name="mediName" placeholder="必填" required/></td>
                            <td>产品英文名:</td>
                            <td><input name="mediNameEn"/></td>
                            <td>药物基药属性:(基药、国药):</td>
                            <td>
                                <select class="sel-dis" name="nedrugtype">
                                    <option value=""></option>
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
                            <td><input name="manufacturerAbbr" placeholder="必填" required/></td>
                            <td>生产厂商全称</td>
                            <td><input name="manufacturer" placeholder="必填" required/></td>
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

        <div class="modal-footer">
            <button id="btn_cancel" class="btn btn-sm btn-grey"><i class="ace-icon fa fa-times"></i>取消</button>
            <button id="btn_submit" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-check"></i>保存</button>
        </div>
    </div>
</div>

<div id="modal_form_check" class="modal">
    <div class="modal-dialog" style="width:50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">提交审核信息</h4>
            </div>

            <div class="modal-body">
                <form id="form_check" role="form">
                    <table class="table">
                        <tr>
                            <td>审核状态</td>
                            <td>
                                <select name="dataStatus" required>
                                    <option>请选择(必选)</option>
                                    <option value="0">待审核</option>
                                    <option value="9">审核通过</option>
                                    <option value="4">审核不通过</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>审核备注</td>
                            <td><input name="statusRemark"/></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <div class="modal-footer">
            <button id="btn_cancel_check" class="btn btn-sm btn-grey"><i class="ace-icon fa fa-times"></i>取消</button>
            <button id="btn_submit_check" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-check"></i>提交</button>
        </div>
    </div>
</div>

<div id="modal_select_group" class="modal">
    <div class="modal-dialog" style="width:80%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close btn-sm" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="blue bigger">选择药物的所属目录组</h4>
            </div>

            <div class="modal-body overflow-hidden">
                <div style="padding-bottom: 10px">
                    <span>目录分组名:</span><input type="text" id="selGroupName"/>
                    <button id="btn_search_group" class="btn btn-sm btn-primary">
                        <i class="ace-icon fa fa-search"></i>搜索
                    </button>
                    <button id="btn_reset_group" class="btn btn-sm btn-purple">
                        <i class="ace-icon fa fa-reply"></i>重置
                    </button>
                </div>
                <table id="grid_table_group"></table>
                <%--<div id="grid_pager_group"></div>--%>
            </div>
        </div>

        <div class="modal-footer">
            <button id="btn_cancel_group" class="btn btn-sm btn-grey">
                <i class="ace-icon fa fa-times"></i>取消选择
            </button>
            <button id="btn_submit_group" class="btn btn-sm btn-primary">
                <i class="ace-icon fa fa-check"></i>确定选择该行
            </button>
        </div>
    </div>
</div>


<script type="text/javascript">

    var grid_table = $("#grid_table");
    var modal_form = $('#modal_form');
    var form_main = $('#form_main');
    var add_url = '/drugInfo/addDrugInfo.do';
    var del_url = '/drugInfo/deleteDrugInfo.do';
    var update_url = '/drugInfo/updateDrugInfo.do';
    var view_url = '/drugInfo/getDrugInfo.do';
    var grid_url = '/drugInfo/queryDrugInfoPage.do';
    var gb;

    function InitView() {
        grid_table.jqGrid({
            caption: "药物基本信息列表",
            url: '<%=path%>' + grid_url,
            datatype: "json",
            height: 400,
            mtype: "post",
            autowidth: true,
            rownumbers: true,
            rownumWidth:70,
            multiselect: true,//显示行选择cb
            multiboxonly: true,//单选行
            shrinkToFit: false,//横向滑动
            colModel: [
                {name:'id',index:'id',hidden:true},
                {name: 'groupName', index: 'groupName', label: '药物分组名', width: 250, sortable: false},
                {name: 'drugNameCn', index: 'drugNameCn', label: '药物名称', width: 120, sortable: false},
                {name: 'mediName', index: 'mediName', label: '产品名', width: 150, sortable: false},
                {name: 'approvalNumber', index: 'approvalNumber', label: '批准文号', width: 180, sortable: false},
                {name: 'code', index: 'code', label: '产品编码', width: 320, sortable: false},
                {name: 'dosageForm', index: 'dosageForm', label: '剂型', width: 100, sortable: false},
                {
                    name: 'packingSpecifications', index: 'packingSpecifications', label: '包装规格', width: 100,
                    sortable: false
                },
                {name: 'convertPer', index: 'convertPer', label: '包装转换比', width: 100, sortable: false},
                {name: 'descript', index: 'descript', label: '处方', width: 200, sortable: false},
                {name: 'manufacturer', index: 'manufacturer', width: 200, label: '生产厂商', sortable: false,},
                {
                    name: 'dataStatus', index: 'dataStatus', label: '审核状态', width: 170, sortable: false,
                    formatter: function (v, o, r) {
                        if (v == 0) {
                            v = '<span style="color: #1171d0">待审核</span>'
                        } else if (v == 9) {
                            v = '<span style="color: green">审核通过</span>'
                        } else {
                            v = '<span style="color: #ff5809">审核不通过</span>'
                        }
                        return v;
                    }
                }
            ],
            loadComplete: function () {
                updatePagerIcons(this);
            },
            ondblClickRow: function () {
                gb.view();
            },
            rowNum: 50,
            rowList: [50, 100, 150,200],
            pager: '#grid_pager',
            sortname: 'id',
            viewrecords: true,
            sortorder: "desc",
            loadtext: "处理中,请稍后...",
            emptyrecords: "无数据",//空记录时的提示信息
            pgtext: '第 {0} 页 - 共 {1} 页',//页数显示格式
            recordtext: "第 {0} - {1} 条，共 {2} 条"//显示记录数的格式
        });

        var jqnav = grid_table.jqGrid('navGrid', "#grid_pager", {
            edit: true, edittext: '编辑', editicon: 'ace-icon fa fa-pencil blue',
            add: true, addtext: '添加', addicon: 'ace-icon fa fa-plus-circle purple',
            del: true, deltext: '删除', delicon: 'ace-icon fa fa-trash-o red',
            search: false, searchtext: '搜索', searchicon: 'ace-icon fa fa-search orange',
            refresh: true, refreshtext: '刷新', refreshicon: 'ace-icon fa fa-refresh green',
            view: true, viewtext: '详情', viewicon: 'ace-icon fa fa-search-plus grey',
            addfunc: function () {
                selectGroup();
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
            position: 'left', alertwidth: 300,
            alertcap: '<span style="color: orange">操作出错</span>',
            alerttext: '<div style="color: red;text-align: center;font-size:large">请选择需要操作的数据行！</div>'
        });

        jqnav.navButtonAdd("#grid_pager", {
            caption: "审核",
            buttonicon: "ace-icon fa fa-flag orange",
            position: "last",
            onClickButton: function () {
                var ids = grid_table.jqGrid("getGridParam", "selarrrow");
                if (ids && ids.length > 0) {
                    check(ids.toString());
                } else {
                    new AlertTools().show(false, "请先选择需审核的数据行！");
                }
            }
        });
        jqnav.navButtonAdd("#grid_pager", {
            caption: "上报",
            buttonicon: "ace-icon fa fa-cloud-upload green",
            position: "last",
            onClickButton: function () {
                var ids = grid_table.jqGrid("getGridParam", "selarrrow");
                if (ids && ids.length > 0) {
                }
            }
        });
        gb = new GridBtn(grid_table, modal_form, form_main);
        gb.setPath(add_url, del_url, update_url, view_url);
    }

    function selectGroup() {
        var grid = $('#grid_table_group');
        grid.jqGrid({
            // caption: "药物目录信息",
            url: '<%=path%>/drugGroup/getDrugGroupPage.do',
            datatype: "json",
            postData: {dataStatus: '9'},
            height: 300,
            mtype: "post",
            autowidth: false,
            rownumbers: false,
            multiselect: false,//显示行选择cb
            multiboxonly: true,//单选行
            shrinkToFit: false,//横向滑动
            colModel: [
                {name: 'id', hidden: true}, {name: 'gjyb', hidden: true},
                {name: 'syb', hidden: true}, {name: 'remark', hidden: true},
                {name: 'groupName', index: 'groupName', label: '目录分组名', width: 350, sortable: false},
                {name: 'drugNameCn', index: 'drugNameCn', label: '药物名称', width: 120, sortable: false},
                {name: 'type', index: 'type', label: '分类', width: 120, sortable: false},
                {name: 'groupSource', index: 'groupSource', label: '目录分组依据', width: 350, sortable: false},
            ],
            loadComplete: function () {
                updatePagerIcons(this);
            },
            ondblClickRow: function () {
                showMainForm(grid);
            },
            rowNum: 200,
            sortname: 'id',
            sortorder: "desc",
            loadtext: "处理中,请稍后...",
        });
        $('#modal_select_group').modal('show');
    }

    function check(ids) {
        var modal_form_check = $('#modal_form_check');
        var form_check = $('#form_check');
        var al = new AlertTools();
        modal_form_check.modal({backdrop: 'static', keyboard: false, show: true});
        $('#btn_cancel_check').on("click", function () {
            modal_form_check.modal('hide');
        });
        $('#btn_submit_check').off("click").on("click", (function () {
            var d = JSON.parse(new FormHandler(form_check).submitForm());
            form_check.validate();
            if (form_check.valid()) {
                $.ajax({
                    url: '<%=path%>/drugInfo/checkDrugGroup.do',
                    data: {ids: ids, dataStatus: d.dataStatus, statusRemark: d.statusRemark},
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        if (!data) {
                            data.type = false;
                            data.msg = "服务器数据获取失败！！"
                        }
                        modal_form_check.modal('hide');
                        $("#grid_table").trigger("reloadGrid");
                        al.show(data.type, data.msg);
                    },
                    error: function () {
                        al.show(false, "数据审核出错！！");
                    }
                });
            } else {
                al.show(false, "数据填写异常，请检查填写内容");
            }
        }));
    }

    function report() {

    }

    function showMainForm(grid) {
        var rid = grid.jqGrid("getGridParam", "selrow");
        var rowData = grid.jqGrid('getRowData', rid);
        if (rowData != null && rowData != '') {
            $('#modal_select_group').modal('hide');
            $('#fGroupId').val(rowData.id);
            $('#fGroupName').val(rowData.groupName);
            $('#fGjyb').val(rowData.gjyb);
            $('#fSyb').val(rowData.syb);
            $('#fRemark').val(rowData.remark);
            $('#fGroupSource').val(rowData.groupSource);
            $('#fType').val(rowData.type);
            gb.add();
        } else {
            new AlertTools().show(false, "请先选择药物分组");
        }
    }

    $(function () {
        InitView();
        addCaptionTips(grid_table);
        $('#btn_search').off("click").on("click", function () {
            var data = {
                groupName: $('#groupName').val().trimA(),
                drugNameCn: $('#drugNameCn').val().trimA(),
                mediName: $('#mediName').val().trimA(),
                dataStatus: $('#dataStatus option:selected').val().trimA(),
            };
            gb.search(data, grid_url);
        });

        $('#btn_reset').on("click", function () {
            gb.reset('search_grid');
        });

        $('#btn_search_group').off("click").on("click", function () {
            var data = {
                groupName: $('#selGroupName').val().trimA(),
                dataStatus: '9',//只查询已审核的记录
            };
            $('#grid_table_group').jqGrid('setGridParam', {
                url: '<%=path%>/drugGroup/getDrugGroupPage.do',//你的搜索程序地址
                datatype: 'json',
                postData: data, //发送数据
                page: 1
            }).trigger("reloadGrid"); //重新载入
        });

        $('#btn_reset_group').on("click", function () {
            $('#selGroupName').val("");
        });

        $('#btn_submit_group').off("click").on("click", function () {
            showMainForm($('#grid_table_group'))
        });

        $('#btn_cancel_group').on("click", function () {
            $('#modal_select_group').modal('hide');
        });
    });
</script>