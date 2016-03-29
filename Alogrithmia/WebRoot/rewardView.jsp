<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="alg.base.bean.*"%>
<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />

<style>
.center {
    margin-top:10px;   
}

.modal-header {
    padding-bottom: 5px;
}

.modal-footer {
        padding: 0;
}
    
.modal-footer .btn-group button {
    height:30px;
    border-top-left-radius : 0;
    border-top-right-radius : 0;
    border: none;
}
    
.modal-footer .btn-group:last-child > button {
    border-right: 0;
}
</style>

<script>
	$(function() {
		var info = $('.hide_d').attr('value');
		$.post('BonusActionFetch_Byid', {
			'bonus_id' : info
		}, panel_ready);
		//alert(info);
	});
	function panel_ready(data) {
		var obj = eval('(' + data + ')');
		//alert(obj);
		var bonus = obj.bonus;
		panelBody(bonus);
		mainDetail(bonus);
	}
	function panelBody(obj) {
		var bonusBean = obj;
		$('.panel-body').prepend(
				'<p>算法标题</p>' + '<p>' + bonusBean.bonus_title + '</p><hr>'
			  + '<p>悬赏金额</p>' + '<p>' + bonusBean.bonus_pride+'</p><hr>');
	}
	function mainDetail(obj) {//算法描述

		$('.well_1').prepend(
				'<h3>算法描述</h3>' + '<p>' + obj.bonus_instruction + '</p>');
	}

//回复悬赏
function responds(){
	$('#userAlg_list').empty();
	var user_id = $("#hide_usid").val();
	//alert(user_id);
	if(user_id!="null"){
		$.post('userAlgoListAction',{'user_id':user_id},showSelect);
	}else{
		alert("请登录");
	}
}
function showSelect(data){
	var obj = eval('(' + data + ')');
	//alert(obj);
	var arrAlgName = obj.arrAlg;
	select_alg(arrAlgName);
}
function select_alg(obj){
	for(i=0;i<obj.length;i++){
		$("#userAlg_list").append(
			'<option>'+obj[i].algorithm_name+'</option>'
		);
	}
}
function sub_respond(){
	var algo_name = $('#userAlg_list option:selected') .val();
	//alert(algo_name);
	var user_name = $('#hide_usname').val();
	var user_id = $("#hide_usid").val();
	var bonus_id = $('.hide_d').attr('value');
	var time = getTime();
	var p = {'algo_name':algo_name,
			'user_name':user_name,
			'user_id':user_id,
			'bonus_id':bonus_id,
			'time':time}
	$.post('respondBonusAction',p,showAlgoList);
}
function showAlgoList(data){
	var obj = eval('(' + data + ')');
	//alert(obj);
	console.log("data=="+data);
	var alg = obj.alg;
	algList(alg);
	location.reload();
}
function algList(obj){
	$('#respond_well').append(//当前页算法列表
			'<h3><a href="algoView.jsp?alg_id='+obj.algorithm_id+'" style="text-decoration:none">'
			+obj.algorithm_name+'</a><small> <a href="#">'
			+obj.user_name+'</a></small> <small>'+obj.vist_times+'人访问</small></h3>'
			+'<p>'+obj.algorithm_describe+'</p>'
	);
}

//获取当前时间
function getTime() {
		var mydate = new Date();
		var str = "" + mydate.getFullYear() + "-";
		str += (mydate.getMonth() + 1) + "-";
		str += mydate.getDate() + " " + mydate.getHours() + ':'
				+ mydate.getMinutes() + ':' + mydate.getSeconds();
		return str;
}

//悬赏回复列表显示
$(function() {
		var info = $('.hide_d').attr('value');
		$.post('BonusRespondActionFetch_Byid', {
			'bonus_id' : info
		}, respond_list);
		//alert(info);
	});	
function respond_list(data){
	var obj = eval('(' + data + ')');
	//alert(obj);
	var currentIndex = obj.currentIndex;
	var totalpage = obj.totalPage;
	cu_index = currentIndex;
	total_pages =totalpage;
	var algsList = obj.cuArrAlgs;
	cuIndex_readyfp(algsList);
}
function cuIndex_readyfp(obj) {
	for ( var i = 0; i < obj.length; i++) {

	$('#respond_well').append(//当前页算法列表
			'<h3><a href="algoView.jsp?alg_id='+obj[i].algorithm_id+'" style="text-decoration:none">'
			+obj[i].algorithm_name+'</a><small> <a href="#">'
			+obj[i].user_name+'</a></small> <small>'+obj[i].vist_times+'人访问</small></h3>'
			+'<p>'+obj[i].algorithm_describe+'</p>'
	);
	}
}
	
</script>

 <div class="hide_d" value="<%=request.getParameter("bonus_id")%>">
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
		<div class="col-sm-3">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">作者</h3>
						</div>
						<div class="panel-body">
							<hr>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-9">
			<!-- 悬赏详情 -->
			<div class="well">
				<div class="well_1">
				</div>
				<hr>
				<div class="center">
					<button data-toggle="modal" data-target="#squarespaceModal" class="btn btn-primary center-block" onclick="responds()">回复</button>
				</div>
			</div>
			<hr>
			<!--回复列表 -->	
			<div class="well" id="respond_well">
			
			</div>
		</div>
	</div>
</div>
<!-- 模态框 -->
<div class="modal fade alert" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <h3 class="modal-title" id="lineModalLabel">选择自己的算法提交</h3>
        </div>
        <div class="modal-body">
        	<select class="form-control" id="userAlg_list">
                                <!--<option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>-->
            </select>
            <hr>
              <button type="submit" class="btn btn-primary center-block" onclick="sub_respond()">确定</button>
        </div>
    </div>
  </div>
</div>
	<jsp:include page="<%=M.j_tail%>" />