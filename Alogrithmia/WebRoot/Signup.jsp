<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />
<script type="text/javascript" src="./js/md5.js"></script>
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="resources/js/comet4j.js"></script>

 <script type="text/javascript">
	function trim(str)
	{
		return str.replace(/^\s*|\s*$/g, '');
	}
	function login2()
	{   
	
	  //  JS.Engine.start('conn');
		if (checkLogin()){
		 var hash = hex_md5(trim($('#password').val()));  
         $('#password').attr('value',hash);
          var pw=document.getElementById("password").value;
		$('#form1').submit();

 /* var username=$("#name").val();
  var password=pw;
 $.ajax({
  url: "denglu.action",
  type:"POST",
  data:{
  username:username,
  password:password
  },
  success: function(data){
     console.log(data);
    var da= eval("("+data+")");
 
   console.log(	(da));

    if(da.data=="SUCCESS"){
    
    window.location="/Alogrithmia/search.jsp";
      	 

    }
    if(da.data=="LOGIN"){
    window.location.href="/Alogrithmia/Signup.jsp?";
    }
    
  }
});*/
 
 
		
		}
	}
	
	   
   

	//验证输入信息
	function checkLogin()
	{

		var name1 = trim(document.getElementById("name").value);
		if (trim(name1) == '')
		{
			alert("请输入用户名");
			document.getElementById("name").focus();
			return false;
		}

		var passwd1 = trim(document.getElementById("password").value);
		if (trim(passwd1) == '')
		{
			alert("请输入密码");
			document.getElementById("password").focus();
			return false;
		}

		/*var checkCode1 = trim(document.getElementById("checkCode").value);
		if (trim(checkCode1) == '')
		{
			alert("请输入验证码");
			document.getElementById("checkCode").focus();
			return false;
		}
*/
		
		return true;
	}
	function trim(str)
	{
		return str.replace(/^\s*|\s*$/g, '');
	}
/*	$(function()
	{
		$('#changeCode').click(function()
		{
			var url = 'CheckCode.jsp';
			$('#codePic').attr('src', '/supervision/CheckCode.jsp');
		});
	});*/
	// 验证码 密码处 回车登录
	$(function()
	{
		/*$('#checkCode').bind('keypress', function(event)
		{
			if (event.keyCode == "13")
			{
				login2();
			}
		});*/
		$('#password').bind('keypress', function(event)
		{
			if (event.keyCode == "13")
			{
				login2();
			}
		})
	});
  
	$(function()
	{
		//?
		var par='<%=request.getAttribute("errorMsg")%>';
		
		if ('${request.errorMsg!=null}' == 'true')
		{
			alert('${request.errorMsg}');
			
		}

	}

	);
</script>
    
        <div id="page-wrapper">
           <div class="row">

                <div class="col-lg-12 text-center v-center">

                    <h2>登录</h2>
                    <br>
                    <br>
                    <form name="form1" id="form1" class="col-lg-12" action="login.action">
                        <div class="input-group" style="width: 340px; text-align: center; margin: 0 auto; border-radius: 4px;">
                            <input class="form-control input-lg" title="Confidential signup."
                                placeholder="输入账号" type="text" name="username" id="name" style="border-radius:6px;">
                        </div>
                        <br>
                        <br>
                        <div class="input-group" style="width: 340px; text-align: center; margin: 0 auto;">
                            <input class="form-control input-lg" title="Confidential signup."
                                placeholder="输入密码" name="password" id="password" type="password">
                            <span class="input-group-btn">
                                <button class="btn btn-lg btn-primary" type="button" onclick="login2()">进入</button></span>
                        </div>
                    </form>
                    <br>
                    <p><a href="resetpassword.jsp">忘记密码？</a></p>
                </div>
            </div>
        </div>
<jsp:include page="<%=M.j_tail%>" />

