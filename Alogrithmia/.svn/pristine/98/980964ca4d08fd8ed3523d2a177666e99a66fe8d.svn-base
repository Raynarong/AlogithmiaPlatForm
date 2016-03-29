<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="alg.base.service.*" %>
<%@ page import="alg.base.bean.*" %>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />


<script type="text/javascript">
//获取当前时间
function getTime() {
		var mydate = new Date();
		var str = "" + mydate.getFullYear() + "-";
		str += (mydate.getMonth() + 1) + "-";
		str += mydate.getDate() + " " + mydate.getHours() + ':'
				+ mydate.getMinutes() + ':' + mydate.getSeconds();
		return str;
}

function submitForm(){
	var user_name = $('#hide_usname').attr('value');
	var user_id = $('#hide_usid').attr('value');
	if(user_name!==null){
		var reward_name = $("#rewardName").val();
		var reward_instruction = $("#rewardInstruction").val();
		var reward_pride = $("#rewardPride").val();
		var time = getTime();
		var parameters={
		'user_name':user_name,
		'user_id':user_id,
		'reward_name':reward_name,
		'reward_instruction':reward_instruction,
		'reward_pride':reward_pride,
		'time':time
		};
		//var url = $("#createRewardForm").submit();
		$.post('CreateReward',parameters,callback_bonus);
		//alert("OK");
	}else{
		alert("请先登录");
	}
	
	function callback_bonus(data){
		var obj = eval("("+data+")");
		console.log(data);
		if(obj.message == "success"){
			window.location.href = "reward.jsp";
		}else{
			alert("创建失败！");
		}
	}
    
} 
</script>
<div class="hide_d" value="<%=request.getParameter("alg_id")%>">
	<form action="#" class="hide_element">
		<input type="hidden" id="hide_usname"
			value="<%=(String) session.getAttribute("user")%>">
			 <input
			type="hidden" id="hide_usid"
			value="<%=(Integer)session.getAttribute("id")%>">
	</form>
</div> 
 <div class="container">
      <div class="row">
           <!-- 创建悬赏 -->
           <h3>创建问题</h3>
           <hr><!--
           <form id="createRewardForm" method="post" action="">
                 --><div class="col-lg-8">
      		 		<div class="row">
                		<div class="col-lg-12">
                       	<div class="form-group">
            				<h4>悬赏标题</h4>
            				<div>
                				<input type="text"  id="rewardName" name="reward_name" placeholder="Enter your problem's title"  class=" form-control" onblur="judgeRename()" onfocus="display()">
            				</div>
            		   	</div>
            		    <div class="form-group">
            				<h4>详细描述问题，如输入数据以及期望的算法结果</h4>
            				<textarea class="form-control" rows="10" id="rewardInstruction" name="reward_instruction"></textarea>
            				
            				<!--<h4>上传文件</h4>
                            <input type="file">-->
                            
                        </div>
        			   	<div class="form-group">
        			   		<h4>悬赏金额</h4>
        			   		<div>
                				<input type="text"  id="rewardPride" name="reward_pride" placeholder="Enter your bonus（单位：元）"  class=" form-control" onblur="judgeRename()" onfocus="display()">
            				</div>
            			</div>
            			<div class="form-group">
            				<button class="btn btn-primary" onclick="submitForm();">提交问题</button>
                	   	</div>
                	   </div>
                	</div>
                </div><!--
          </form>
--><jsp:include page="<%=M.j_tail%>" />
