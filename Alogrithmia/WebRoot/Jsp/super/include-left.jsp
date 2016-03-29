<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="context.M"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>

<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong>湘雅精神卫生医疗大数据平台</strong> <small>主页面</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
<!--      <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">5</span></a></li>-->
<!--      <li class="am-dropdown" data-am-dropdown>-->
<!--        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">-->
<!--          <span class="am-icon-users"></span>欢迎用户： ${sessionScope.admin.u_account} <span class="am-icon-caret-down"></span>-->
<!--        </a>-->
<!--        <ul class="am-dropdown-content">-->
<!--          <li><a href="#"><span class="am-icon-user"></span> 资料</a></li>-->
<!--          <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>-->
<!--          <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>-->
<!--        </ul>-->
<!--      </li>-->
      <li><a><span class="am-icon-users"></span>欢迎您, ${sessionScope.admin.u_account}</a> </li>
      <li><a href="logout.action"  id="admin-fullscreen"> <span class="am-icon-power-off">退出系统</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar">
    <ul class="am-list admin-sidebar-list">
      <li><a href="test.jsp"><span class="am-icon-home"></span> 首页</a></li>
      <li><a href="/PermissionValid/manager-user.jsp?account=${sessionScope.admin.u_account}&perms=${sessionScope.perms}" class=" per per1000"><span class="am-icon-home"></span> 进入权限管理系统</a></li>
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 病人基本信息管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
          <li><a href="patientMan.jsp" class="am-cf per per705"><span class="am-icon-check"></span> 病人信息列表</a></li>
          <li><a href="patient_add.jsp" class="per per706"><span class="am-icon-puzzle-piece"></span> 添加病人信息</a></li>
          <li><a href="topicMan.jsp" class="per per702"><span class="am-icon-th"></span> 课题管理</a></li>
          <li><a href="itemMan.jsp" class="per per703"><span class="am-icon-calendar"></span> 项目管理</a></li>
          <li><a href="patient_revisite.jsp" class="per per704"><span class="am-icon-calendar"></span> 病人回访列表</a></li>
          <li><a href="sysuserAction.action" class="per per707"><span class="am-icon-calendar"></span> 用户-课题关系管理</a></li>
          <!---------------------------------------------------->
          <li><a href="TopicSelect.jsp" class="per per888"><span class="am-icon-calendar"></span> 患者信息管理</a></li>
          <!---------------------------------------------------->
        </ul>
      </li>
      
      <li class="admin-parent">
      		<a class="am-cf" data-am-collapse="{target: '#scale'}"><span class="am-icon-file"></span> 心理测评管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
	        <ul class="am-list am-collapse admin-sidebar-sub am-in" id="scale">
	          <li><a href="queryScaleAction.action" class="am-cf per per801"><span class="am-icon-table"></span> 量表管理</a></li>
	          <li><a href="patientSelect.action" class="am-cf per per802"><span class="am-icon-pencil-square-o"></span> 心理测评</a></li>
	           <li><a href="KindManage.jsp" class="am-cf per per803"><span class="am-icon-puzzle-piece"></span> 分类管理</a></li>
	          <li><a href="reportManageAction.action" class="am-cf per per804"><span class="am-icon-th"></span> 测评结果管理</a></li>
	          <li><a href="reportAnalysisAction.action" class="am-cf per per805"><span class="am-icon-calendar"></span> 测试结果统计分析</a></li>
	        </ul>
      </li>
      <li><a href="table.jsp" class="per per901"><span class="am-icon-pencil-square-o"></span> 文件管理</a></li>
      <li><a href="specimen.jsp" class="per per902"><span class="am-icon-sign-out"></span> 标本管理</a></li>
    </ul>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-bookmark"></span> 公告</p>
        <p>时光静好，与君语；细水流年，与君同。—— Mr.Li</p>
      </div>
    </div>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-tag"></span> wiki</p>
        <p>Welcome to the Psychological Test System!</p>
      </div>
    </div>
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">

<link rel="stylesheet" href="resrcs/css/left.css"/>

    