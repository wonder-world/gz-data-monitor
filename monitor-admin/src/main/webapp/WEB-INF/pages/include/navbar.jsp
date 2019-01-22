<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="navbar" class="navbar navbar-default navbar-fixed-top ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small><i class="fa fa-leaf"></i>
                    广州市数据监控系统</small>
            </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <div class="i-info">
                            <span id="i_name">南沙卫计局</span>
                            <span id="i_clock"></span>
                        </div>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li><a onclick="logout()"><i class="ace-icon fa fa-power-off"></i>退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<script>
    function logout(){
        if(confirm("是否确定退出登陆？")){
            var arr =  window.location.href.split('/');
            window.location.href=arr[0]+'//'+arr[2]+'/cuteframework-sso-server/logout';
        }
    }
</script>