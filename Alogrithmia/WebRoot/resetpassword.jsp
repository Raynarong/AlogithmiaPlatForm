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
<jsp:include page="<%=M.j_tail%>" />
<style>
.center{
margin-left:auto;
margin-right:auto;
width:40%
}
</style>
<script>
function trim(str)
	{
		return str.replace(/^\s*|\s*$/g, '');
	}
	
function judgeMail(){
var address=trim($("#emailaddress").val());
var url='judgeMail.action';
 var parameters={
'user_mail':address
};
$.post(url,parameters,resultHandle,'html');

}
function display(){
$("#tips").hide();
}
function resultHandle(value){
var val=trim(value);
if(val=='') {             
$("#tips").show();
return false;
}
else 
return true;
}
</script>
   <div> 
      <h1 class="center"> 重置密码</h1>
 </div>   
     <form  method="post" action="resetpwd.action" >
      
     
          <div>
                <label for="mail" class="col-md-2">
                	
            </label>
            <div class="col-md-9">
         
                <input type="email" id="emailaddress" name="user_mail"  placeholder="Enter email address" class=" form-control" required  onblur="judgeMail()" onfocus="display()">
               <p class="help-block" id="tips" style="display:none;color:#FF0000">输入的邮箱不存在</p>
                <p class="help-block">
                    Example: yourname@domain.com
                </p>
              
            </div>
        </div> 
         
            
            <div class="row">
            <label for="but" class="col-md-2">
                	
            </label>

            <div class="center">
                <button type="submit" class="btn btn-info" >
                    	重置
                </button>
                 <a  class="btn btn-default" href="#" onclick ="javascript:history.go(-1);">
                               	 取消
                </a>
            </div>
        </div>
     </form>
   </div>
</div>


