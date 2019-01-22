<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String baseUrl = request.getContextPath(); %>

<div style="margin-top: 45px" class="main-container" id="main-container">
    <div id="sidebar" class="sidebar responsive">
        <ul class="nav nav-list">
            <li class="active">
                <a href="#">
                    <i class="menu-icon fa fa-tachometer"></i>
                    <span class="menu-text">监控概览</span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="open">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-list"></i>
                    <span class="menu-text">医疗机构监管模块</span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>
                <b class="arrow"></b>

                <ul class="submenu">
                    <%--<li class="">--%>
                    <%--<a onclick="loadIframe('<%=baseUrl%>/drug/toYwztjk.do')">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>药物处理状态监控</a>--%>
                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>
                    <li class="">
                        <a onclick="loadIframe('<%=baseUrl%>/drug/toYwddgl.do')">
                            <i class="menu-icon fa fa-caret-right"></i>药物订单管理</a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a onclick="loadIframe('<%=baseUrl%>/drug/toYwdhjg.do')">
                            <i class="menu-icon fa fa-caret-right"></i>药物到货监管</a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a onclick="loadIframe('<%=baseUrl%>/drug/toYkgl.do')">
                            <i class="menu-icon fa fa-caret-right"></i>药库管理</a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a onclick="loadIframe('<%=baseUrl%>/drug/toJbywsyjgsb.do')">
                            <i class="menu-icon fa fa-caret-right"></i>基本药物使用监管上报</a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a onclick="loadIframe('<%=baseUrl%>/drug/toJbywblfybg.do')">
                            <i class="menu-icon fa fa-caret-right"></i>基本药物不良反应报告</a>
                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
        </ul>
    </div>

    <div class="main-content">
        <iframe class="ifr-content" frameborder="0" scrolling="no" name="iframe_main" id="iframe_main"
                onload="setIframeHeight(this)" src="<%=baseUrl%>/drug/toYwmlgl.do"></iframe>
    </div>
</div>

<div class="tip-box" id="tip_box">
    <span><a style="color:chocolate" onclick="closeTip()">(关闭提示)</a>温馨提示：</span>
    <span class="tip">针对列表信息，您可以双击查看详情，或选中行，点击下方按钮来操作当前选中的行数据</span>
    <script>
        function closeTip() {
            $('#tip_box').css('display', 'none');
        }
    </script>
</div>
