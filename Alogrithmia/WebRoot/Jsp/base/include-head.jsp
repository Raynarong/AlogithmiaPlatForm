<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="context.M"%>

 <!--  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">-->
<!doctype html>
<html class="no-js">
<head>

<title>
	<%
		if (request.getParameter("page-title") != null) {
			out.print(request.getParameter("page-title").toString());
		}// Show the Page-Title
	%> 
</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="">
<meta http-equiv="description" content="">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">

<link rel="alternate icon" type="image/png" href="<%=M.m_icon_fav%>">
<link rel="stylesheet" href="<%=M.m_css_theme%>" />
<link rel="stylesheet" href="<%=M.m_css_theme_5%>" />

<script type="text/javascript" charset="utf-8" src="<%=M.m_js_search%>"></script>
<script type="text/javascript" charset="utf-8" src="<%=M.m_js_theme%>"></script>
<script type="text/javascript" charset="utf-8" src="<%=M.m_js_app%>"></script>
<script type="text/javascript" charset="utf-8" src="<%=M.handlebars%>"></script>
<script type="text/javascript" charset="utf-8" src="<%=M.helper%>"></script>

</head>
<%
	String perms = session.getAttribute("perms").toString();
 %>
<body>
	<!--  wait the tail page -->
<div>
<input type="hidden" name="perms" id="sessionPer" value="<%=perms %>"/>
</div>

	