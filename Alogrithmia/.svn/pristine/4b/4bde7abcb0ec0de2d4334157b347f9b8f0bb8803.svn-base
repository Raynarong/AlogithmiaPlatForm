<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="alg.base.service.*" %>
<%@ page language="java" import="alg.base.bean.*" %>

<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />
    
    
    
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery.validate.js" type="text/javascript"></script>
    <script src="js/jquery.metadata.js" type="text/javascript"></script>
    <script type="text/javascript" src="./js/md5.js"></script>
    
    <style>

        div {
            padding-bottom:20px;
        }

    </style> 
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
   box:{
   required:true
   },
   
   repassword: {
    required: true,
    minlength: 6,
    equalTo: "#password"
   }
  },
    messages: {
   user_name: "请输入姓名",
   user_mail: {
    required: "请输入Email地址",
    email: "请输入正确的email地址"
   },
   user_pwd: {
    required: "请输入密码",
    minlength: jQuery.format("密码不能小于{0}个字 符")
   },
   repassword: {
    required: "请输入确认密码",
    minlength: "确认密码不能小于6个字符",
    equalTo: "两次输入密码不一致不一致"
   }
  },
  submitHandler:function(form){
            alert("submitted"); 
            var hash = hex_md5(trim($('#password').val()));  
            $('#password').attr('value',hash);
            form.submit();
        }
    });
    
    
    
});

function judgeRename(){
var user_name=$('#username').val();
console.log(user_name);
var url='loginJudgeName.action';
var parameters={
'user_name':user_name
};
$.post(url,parameters,resultHandle,'html');

}
function trim(str)
	{
		return str.replace(/^\s*|\s*$/g, '');
	}
function resultHandle(value){
var val=trim(value);
if(val!=''){
$('#tips').show();
}
else{
$('#tips').hide();
}
}
function display(){
$('#tips').hide();
}
  	
  </SCRIPT>
	
        <div>
        <div class="row text-center">
            <h2>新用户注册</h2>
        </div>
        <form id="signupForm" method="post" action="Register.action">
        <div>
            <label for="username" class="col-md-2">
                	用户名：
            </label>
            <div class="col-md-9">
                <input type="text"  id="username" name="user_name" placeholder="Enter your Name"  class=" form-control" onblur="judgeRename()" onfocus="display()">
                <label id="tips" style="display:none;color:#FF0000"  >
                	用户名已经被注册了
             </label>
            </div>
        </div>        
        <div>
            <label for="emailaddress" class="col-md-2">
               	 邮箱:
            </label>
            <div class="col-md-9">
                <input type="email" id="emailaddress" name="user_mail"  placeholder="Enter email address" class=" form-control">
                <p class="help-block">
                    Example: yourname@domain.com
                </p>
            </div>
        </div>
        <div>
            <label for="password" class="col-md-2">
                	密码:
            </label>
            <div class="col-md-9">
                <input type="password"  id="password" name="user_pwd" placeholder="Enter Password" class=" form-control">
                <p class="help-block">
                   	 最少6个字符
                </p>
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
        <div>
            <label for="sex" class="col-md-2">
                	性别:
            </label>
            <div class="col-md-9" >
                <label >
                    <input type="radio" name="user_sex" id="sex" value="男" checked>
                    	男
                </label>
                <label style="margin-left:20px;">
                    <input type="radio" name="user_sex" id="Radio1" value="女">
                    	女
                </label>
            </div>             
        </div>
        <div>
            <label for="uploadimage" class="col-md-2">
                	上传头像:
            </label>
            <div class="col-md-10">
                <input type="file" name="uploadimage" id="uploadimage">
                <p class="help-block">
                    	允许格式: jpeg, jpg, gif, png
                </p>
            </div>          
        </div>
        <div>
            <div class="col-md-2">
            </div>
            <div class="col-md-10">
                <label>
                    <input type="checkbox" name="box" required>我接受该协议并使用这个网站</label>
            </div>            
        </div>
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-10">
                <button type="submit" class="btn btn-info">
                    	注册
                </button>
            </div>
        </div>
        </form> 
       </div> 
<jsp:include page="<%=M.j_tail%>" />
