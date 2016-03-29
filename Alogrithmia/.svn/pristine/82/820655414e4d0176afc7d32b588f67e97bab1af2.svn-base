<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="alg.base.service.*" %>
<%@ page language="java" import="alg.base.bean.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>修改密码</title>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="resources/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/local.css" />
		
		<link rel="stylesheet" type="text/css" href="resources/css/shieldui-all.min.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/all.min.css" /><!--
		<link rel="stylesheet" type="text/css" href="resources/css/easyui.css">

		--><script type="text/javascript" src="resources/js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.js"></script>

		<script type="text/javascript" src="resources/js/shieldui-all.min.js"></script>
		<script type="text/javascript" src="resources/js/gridData.js"></script>
		<script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery.validate.js" type="text/javascript"></script>
    <script src="js/jquery.metadata.js" type="text/javascript"></script>
    <script type="text/javascript" src="./js/md5.js"></script>
	
<style>

        div {
            padding-bottom:20px;
        }
        .center{
        margin-left:auto;
        margin-right:auto;
        width:40%;
        }

</style>


</head>

<SCRIPT LANGUAGE="JavaScript">
$().ready(function() {
 $("#signupForm").validate({
   
   rules: {
   user_name: "required",
   user_mail: {
    required: true,
    email: true
   },
   user_pwd: {
    required: true,
    minlength: 6
   },
   repassword: {
    required: true,
    minlength: 6,
    equalTo: "#password"
   }
  },
  messages:{
   user_pwd: {
    required: "请输入新密码",
    minlength: jQuery.format("密码不能小于{0}个字 符")
   },
   repassword: {
    required: "请输入确认密码",
    minlength: "确认密码不能小于6个字符",
    equalTo: "两次输入密码不一致"
   }
   },
    submitHandler:function(form){
            alert("submitted"); 
            var hash = hex_md5(trim($('#password').val()));  
            $('#password').attr('value',hash);
            form.submit();
            alert("修改成功");
            window.close('userUpdate.jsp');
            window.open('Signup.jsp');
        }  
  })

  } );
    function trim(str)
	{
		return str.replace(/^\s*|\s*$/g, '');
	}
    
    

</SCRIPT>
<body>
<div>
       
        <form id="signupForm" method="post" action="Resetpwd.action">
        <input  style="display:none;" id="userid" name="user_id"  class=" form-control" value=${requestScope.user.user_id} } > 
        <div>
            <label for="password" class="col-md-2">
                	输入新密码:
            </label>
            <div class="col-md-9">
                <input type="password"  id="password" name="user_pwd"  class=" form-control">             
            </div>
        </div>
        <div>
            <label for="password" class="col-md-2">
                	重复密码:
            </label>
            <div class="col-md-9">
                <input type="password"  id="repassword" name="repassword" placeholder="Repeat Password"  class=" form-control" >
            </div>
        </div>
        <div >
            <div class="center">
                <button type="submit" class="btn btn-default ">
                               	 保存修改
                </button>
            </div>
        </div>
        </form> 
       </div> 
</body>
</html>

