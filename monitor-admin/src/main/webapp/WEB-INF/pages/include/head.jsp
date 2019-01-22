<%@ page language="java" pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta charset="utf-8"/>
<meta name="description" content="Dynamic tables and grids using jqGrid plugin"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
<link rel="stylesheet" href="<%=path%>/css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=path%>/font-awesome/4.5.0/css/font-awesome.min.css"/>

<!-- page specific plugin styles -->
<link rel="stylesheet" href="<%=path%>/css/jquery-ui.custom.min.css"/>
<link rel="stylesheet" href="<%=path%>/css/chosen.min.css"/>
<link rel="stylesheet" href="<%=path%>/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" href="<%=path%>/css/daterangepicker.min.css"/>
<link rel="stylesheet" href="<%=path%>/css/bootstrap-datetimepicker.min.css"/>
<link rel="stylesheet" href="<%=path%>/css/bootstrap-colorpicker.min.css"/>

<link rel="stylesheet" href="<%=path%>/css/jquery-ui.min.css"/>
<link rel="stylesheet" href="<%=path%>/css/bootstrap-datepicker3.min.css"/>
<link rel="stylesheet" href="<%=path%>/css/ui.jqgrid.min.css"/>
<link rel="stylesheet" href="<%=path%>/css/fonts.googleapis.com.css"/>
<link rel="stylesheet" href="<%=path%>/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>
<link rel="stylesheet" href="<%=path%>/css/ace-skins.min.css"/>
<link rel="stylesheet" href="<%=path%>/css/ace-rtl.min.css"/>
<link rel="stylesheet" href="<%=path%>/css/myform.css"/>

<!--[if lte IE 9]>
<link rel="stylesheet" href="<%=path%>/css/ace-part2.min.css" class="ace-main-stylesheet"/>
<link rel="stylesheet" href="<%=path%>/css/ace-ie.min.css"/>
<![endif]-->
<!-- ace settings handler -->
<script src="<%=path%>/js/ace-extra.min.js"></script>
<!--[if lte IE 8]>
<script src="<%=path%>/js/html5shiv.min.js"></script>
<script src="<%=path%>/js/respond.min.js"></script>
<![endif]-->

<!--[if !IE]> -->
<script src="<%=path%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=path%>/js/jquery-1.11.3.min.js"></script>
<!-- <![endif]-->

<!--[if IE ]>
<script src="<%=path%>/js/jquery-1.11.3.min.js"></script>
<![endif]-->

<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='<%=path%>/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>

<script src="<%=path%>/js/jquery-ui.custom.min.js"></script>
<script src="<%=path%>/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=path%>/js/chosen.jquery.min.js"></script>
<script src="<%=path%>/js/spinbox.min.js"></script>
<script src="<%=path%>/js/bootstrap-timepicker.min.js"></script>
<script src="<%=path%>/js/moment.min.js"></script>
<script src="<%=path%>/js/daterangepicker.min.js"></script>
<script src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=path%>/js/bootstrap-colorpicker.min.js"></script>
<script src="<%=path%>/js/jquery.knob.min.js"></script>
<script src="<%=path%>/js/autosize.min.js"></script>
<script src="<%=path%>/js/jquery.inputlimiter.min.js"></script>
<script src="<%=path%>/js/jquery.maskedinput.min.js"></script>
<script src="<%=path%>/js/jquery.validate.min.js"></script>
<script src="<%=path%>/js/bootstrap-tag.min.js"></script>
<script src="<%=path%>/js/myform.js"></script>
<script src="<%=path%>/js/common.js"></script>
<script src="<%=path%>/js/edit-table.js"></script>

<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/bootstrap-datepicker.min.js"></script>
<script src="<%=path%>/js/jquery.jqGrid.min.js"></script>
<script src="<%=path%>/js/grid.locale-en.js"></script>
<script src="<%=path%>/js/ace-elements.min.js"></script>
<script src="<%=path%>/js/ace.min.js"></script>
