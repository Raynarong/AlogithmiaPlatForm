<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="alg.base.bean.*"%>
<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />

	<link rel="stylesheet" type="text/css" href="resources/css/mese.css">
	<link rel="stylesheet" type="text/css" href="resources/css/jquery.autocomplete.css">
	<script type="text/javascript" src="console/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="console/jquery.console.js"></script>
	<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.autocomplete.js"></script>
	<link rel="stylesheet" href="css/font/iconfont.css">
	
<style type="text/css" media="screen">

div.console1,div.console2,div.console3 {
	word-wrap: break-word;
}

/* First console */
div.console1 {
	font-size: 14px
}

div.console1 div.jquery-console-inner {
	width: auto;
	height: 90%;
	background: #333;
	padding: 0;
	margin-top: 5px;
	overflow: auto;
}

div.console1 div.jquery-console-prompt-box {
	color: #fff;
	font-family: monospace;
}

div.console1 div.jquery-console-focus span.jquery-console-cursor {
	background: #fefefe;
	color: #333;
	font-weight: bold
}

div.console1 div.jquery-console-message-error {
	color: #ef0505;
	font-family: sans-serif;
	font-weight: bold;
	padding: 0.1em;
}

div.console1 div.jquery-console-message-value {
	color: #1ad027;
	font-family: monospace;
	padding: 0.1em;
}

div.console1 div.jquery-console-message-type {
	color: #52666f;
	font-family: monospace;
	padding: 0.1em;
}

div.console1 span.jquery-console-prompt-label {
	font-weight: bold
}

div.console1 {
	height: 25%;
	width: 100%;
	position: relative;
	left: 0;
	bottom: 0;
}
.describe{
	display: inline-block;
	margin-right:10px;
}

.input{
	border: solid 1px gray;
	width:100%;
}
.edit{
	display: none;
}
.taginput{
	display: none;
}
.tagtitle{
	display: inline-block;
}
.addicon{
	text-decoration: none;
}
a:hover{
	text-decoration: none;
}
.tagedit{
	width: 75%;
}
.taginput button{
	padding: 3px; 
}
.iconfont {
	visibility: hidden;
}
.alg_type{
	display: inline-block;
	height: 35px;
    width: 75%;
}
.type-btn{
	padding: 3px;
}
.comment-time{
	float: right;
}
</style>	
<script type="text/javascript">

	$(function(){
		var info = '<%=request.getParameter("alg_id")%>';
		$.post('limitsControlAction.action',
			{'id' : info},
			limits_callback);
	});
	setTimeout(limits_callback, 1000);
	function limits_callback(data) {
		if(data == "true")
		{
		//alert(1);
			$('#isEditor').val(data);
			$('.iconfont').css('visibility','visible');
		}
	}
	

</script>

<script>

	$(function() {

		var info = $('.hide_d').attr('value');
		$.post('algthmActionFetch_Byid', {
			'alg_id' : info
		}, panel_ready);
		//alert(info);
	});

	
	function panel_ready(data) {
		var obj = eval('(' + data + ')');
		//alert(obj);
		var alg = obj.alg;
		var tagArr = obj.tagArr;
		var apiArr = obj.apiArr;
		//var comArr = obj.comArr;
		panelBody(alg);
		panelTags(tagArr);
		mainDetail(alg);
		apiDetail(apiArr);
		//commentDetail(comArr);
		tabDetail(alg);
	}
	function panelBody(obj) {
		var algBean = obj;
		var open;
		if (algBean.algorithm_open == 1) {
			open = '在线使用/离线使用/开放源码';
		} else {
			open = '在线使用/离线使用';
			$('#viewsource_div').hide();
		}
		$('.panel-body').prepend(
				'<p>版本</p>' + '<p>version' + algBean.version + '</p><hr>'
						+ '<p>访问次数</p>' + '<p>' + (algBean.vist_times)
						+ ' times</p><hr>' + '<p>权限</p>' + '<p>' + open
						+ '</p><hr>' + '<p>付费</p>'
						//		+'<p>'+algBean.algorithm.pay+'</p><hr>'  //这个问题如何快速发现？	1出问题根本就不提示啊				
						+ '<p>' + algBean.algorithm_pay + '</p><hr>'
						+ '<p>输入/输出类型</p>' + '<p>输入：' + algBean.input_type
						+ '</p>' + '<p>输出：' + algBean.output_type + '</p><hr>'
						+ '<p>算法类型</p>'
						+ '<select class="form-control alg_type">'
                        + '</select>'
                        + '<button id="select_button" type="submit" class="btn btn-primary type-btn iconfont" onclick="select_submit();">Submit</button>' 
						+ '<hr>'
						+ '<p class="tagtitle">标签</p><a class="icon iconfont addicon" href="javascript:showinput();">&#xe6b9;</a>'
						+ '<div class="taginput">'
						+ '<input class="tagedit">'
						+ '<button type="submit" class="btn btn-primary" onclick="submit_tag()">Submit</button>'
						+ '</div>'
						+ '<div class="tip"></div>');

	}
	function panelTags(obj) {
		for ( var i = 0; i < obj.length; i++) {
			$('.list-unstyled').append('<li>' + obj[i] + '<a id='+ i +' class="icon iconfont" href="javascript:void(0);" onclick="deletetag(\'' + obj[i] + '\');" >&#xe69a;</a></li>');
		}
	}

	/**
	*删除标签
	*/
	function deletetag(obj)
	{
		var info = $('.hide_d').attr('value');
		$.post("deleteTagAction.action",
			{
				"id" : info,
				"tagName" : obj
			},
			delete_callback
		);
		
		
		function delete_callback(data) {
			if(data == "success" )
			{
				$('.list-unstyled li:contains(\"' + obj +'\")').remove();
			}
		}
	}

	/**
	*添加标签
	*/
	function submit_tag() {
		var info = $('.hide_d').attr('value');
		var tagName = $(".tagedit").val();
		$.post("addTagAction.action",
			{
				"id" : info,
				"tagName" : tagName
			},
			addTag_callback
		);
		
		function addTag_callback(data) {
			if(data == "success")
			{
				$('.list-unstyled').append('<li>' + tagName + '<a class="icon iconfont" href="javascript:void(0);" style="visibility: visible" onclick="deletetag(\'' + tagName + '\');">&#xe69a;</a></li>');
			}
		}
		
		$('.taginput').css('display','none');
	}

	function mainDetail(obj) {//算法描述
		
		console.log("obj.input_instruction:"+obj.input_instruction + obj.input_instance);

		$('.well_1').prepend(
				'<div id="algodescribe_div">'
				 +'<h3 class="describe">算法描述</h3>' 
					 +'<a class="icon iconfont" href="javascript:edit(\'algodescribe_div\')">&#xe69e;</a>'
				 	 +'<p class="text">' + obj.algorithm_describe + '</p>'
			    	 +'<div class="edit">'
						 +'<textarea id="algodescribe_textarea" class="input form-control input-sm myinput"></textarea>'
						 +'<button type="submit" class="btn btn-primary" onclick="submit_edit(\'algodescribe_div\')">Submit</button><button type="submit" class="btn btn-default" onclick="cancel_edit(\'algodescribe_div\')">Cancel</button>'
					 +'</div>'
				 +'</div>'
				 +'<div id="inputdescribe_div">'
				 +'<h3 class="describe">输入说明</h3>' 
			 		 +'<a class="icon iconfont" href="javascript:edit(\'inputdescribe_div\')">&#xe69e;</a>'
				 	 +'<p class="text">' + obj.input_instruction + '</p>'
			    	 +'<div class="edit">'
						 +'<textarea id="inputdescribe_textarea" class="input form-control input-sm myinput"></textarea>'
						 +'<button type="submit" class="btn btn-primary" onclick="submit_edit(\'inputdescribe_div\')">Submit</button><button type="submit" class="btn btn-default" onclick="cancel_edit(\'inputdescribe_div\')">Cancel</button>'
					 +'</div>'
				+'</div>');
		$('.alg_inpIns').append('' +JSON.stringify(obj.input_instance)+'');
		$('.alg_outIns').append('' + JSON.stringify(obj.output_instance)+'');

	}
	function apiDetail(obj) {
		//alert($('#home').attr('shu'));//必须取id才能够获取到$('#home').attr('shu')
		$('#nav_tabs_1').append(
				'<li class="active"><a href="#home" data-toggle="tab">'
						/*+ obj[0].lang_type + '</a></li>');*/
						+'java</a></li>'
						+'<li><a href="#api_js" data-toggle="tab">'
						+'javascript</a></li>');
/*		for ( var i = 1; i < obj.length; i++) {
			$('#nav_tabs_1').append(
					'<li><a href="#profile" data-toggle="tab">'
							+ obj[i].lang_type + '</a></li>');
		}*/
		$('#home').append('点击链接获取jar包   <a href="FileDownload.action?number=1">' + obj[0].api_content + '</a>');
		$('#api_js').append('点击链接获取js包   <a href="FileDownload.action?number=2">' + 'algorithm.js' + '</a>');
		
/*		for ( var i = 1; i < obj.length; i++) {
			if(obj[i].lang_type=="java"){
			$('.tab-content').append('<div class="tab-pane fade" id="profile">'//这个地方的id似乎是写死的，那么如果还有多个API的使用方法怎么办
					+ '<a href="userAPI/test.js">' + obj[i].api_content + '</a>' + 123456);
			}
			if(obj[i].lang_type=="c"){
			$('.tab-content').append('<div class="tab-pane fade" id="profile">'//这个地方的id似乎是写死的，那么如果还有多个API的使用方法怎么办
					+ '<a href="userAPI/test.h">' + obj[i].api_content + '</a>');
			}
		}*/
	}
	/**
	*设置tab面板的详细信息
	*/
	function tabDetail(obj) {
		var info = $('.hide_d').attr('value');
		$.post('setTabDetail.action',
			{'alg_id' : info},
			call_settab
		);
		
		function call_settab(data){
			setTabDetail(obj, data);	
		}
	}
	function setTabDetail(obj,data){
		var url = '<%= session.getAttribute("client_url") %>';
		$('#home').append('<br><br>' + 'import com.test.client.TestClient;' + '<br><br>'
							+ 'TestClient testClient = new TestClient('
							+ '"' + url + '/AlogServer/servlet/HelloworldServlet", '
							+ '"' + data + '.' + obj.algorithm_name + '.' + obj.algorithm_name + '", '
							+ '"[' + obj.input_instance + ']");<br>'
							+ 'String result = testClient.callTest();<br>'
							+ 'System.out.println(result);'
		);
		
		$('#api_js').append(
	
							/*"&lt;script&gt;"*/
							'<br><br>&lt;script type="text/javascript" src="algorithm.js"&gt;&lt;\/script&gt;'
							+'<br>'
							+'&lt;script&gt;'
							+'<br>'
							+' var rpc = new jsonrpc.JsonRpc("' + url + '/AlogServer/servlet/HelloworldServlet");'
							+'<br>'
							+'rpc.loading.bind(function(){ console.log(\'loading...\'); });'
							+'<br>'
							+'rpc.loaded.bind(function(){ console.log(\'done!\'); });'
							+'<br>'
							+'rpc.unhandledFailure.bind(function(){ console.log(\'an rpc call failed, and has not  failure callback defined\'); });'
							+'<br>'
							+'rpc.call(\'invokeMethod\', \'' + data + '.' + obj.algorithm_name + '.' + obj.algorithm_name + '\',\'[' + obj.input_instance + ']\', function (result) {'
							+'<br>'
							+'console.log(\'Return value is:\' + result);'
							+'<br>'
							+'});'
							+'<br>'
							+'&lt;\/scr'+'ipt&gt;'			
		);
	}
	
//添加评价
	function sub_comment() {
	var alg_id = $('.hide_d').attr('value');
	var user_name = $('#hide_usnname').attr('value');
	var user_id = $('#hide_usid').attr('value');
	var content = $('#com_text').val();
	var time = getTime();
	
		if (user_name!="null") {//判断是否已经登录
			//alert(user_name);
			$.post('comtActionAdd', {
				'algorithm_id' : alg_id,
				'reviewer_id' : user_id,
				'flag' : 0,
				'review_content' : content,
				'review_time' : time,
				'respond_id' : 0
			}, addInPage);
		}else{
		
			alert("请先登录");
		}

	function addInPage(data) {
		//从返回的data判断是否插入成功
		var flag = eval('(' + data + ')');
		if (flag != 0) {
			$('#com_text').val('');
			$('#add_well')
					.append(
									'<p><b>'
									+ user_name
									+ '</a><small>&nbsp&nbsp&nbsp&nbsp&nbsp'
									+ time
									+ '</small>&nbsp&nbsp&nbsp&nbsp&nbsp'
									+ content
									+ '</b></p>');
		}
	}
	}
	function getTime() {
		var mydate = new Date();
		var str = "" + mydate.getFullYear() + "-";
		str += (mydate.getMonth() + 1) + "-";
		str += mydate.getDate() + " " + mydate.getHours() + ':'
				+ mydate.getMinutes() + ':' + mydate.getSeconds();
		return str;
	}
	
	
	
	
//控制台测试
	var str="";
	var algoId = <%= request.getParameter("alg_id")%>
	$(document).ready(function() {
		/* First console */
		var console1 = $('<div class="console1" id="console1">');
		$('#console_test').append(console1);
		var controller1 = console1.console({
			promptLabel : 'Demo> ',
			commandValidate : function(line) {
				if (line == "")
					return false;
				else
					return true;
			},
			commandHandle : function(line) {
				//alert(line);
				$.ajax({
				type: "GET",
				url: "testActionOnline.action",
				data: {"line": line, "requestSource": "algoAdd", "algoId":algoId},
				dataType: "html",
				async: false,
				success: function(returnedData){
					str = returnedData;
					}
				});
				return [ {
					msg : str,
					className : "jquery-console-message-value"
				}, {
					msg : "",
					className : "jquery-console-message-type"
				} ]
			},
			autofocus : true,
			animateScroll : true,
			promptHistory : true
		});
	});
	
	function viewSource() {
		
	}

//评价显示
	
var total_pages;
var cu_index;
var cureview = new Array();
var id_well;
	
$(function() {
	var alg_id = $('.hide_d').attr('value');
	$.post('commentListAction',{algorithm_id:alg_id},comment_ready);
	//alert(alg_id);

});
function comment_ready(data) {
	var obj = eval('(' + data + ')');
	console.log("commet:==="+data);
	var currentIndex = obj.currentIndex;
	var totalpage = obj.totalPage;
 	cu_index = currentIndex;
	total_pages =totalpage;
	var cuArrCom = obj.cuArrCom;
	cuIndex_readyfp(cuArrCom);
}
function cuIndex_readyfp(obj) {

//	console.log("obj==="+JSON.stringify(obj));
	for ( var i = 0; i < obj.length; i++) {
	id_well = obj[i].review_id;
	cureview[id_well] = obj[i];

	$('#comment_well').append(//当前页评价列表
		 '<div class="well" id="well'+id_well+'"><p id="'+id_well+'" onclick="respond(this);">'
		 						/*	(('aa'=='aa')&& ($('#isEditor').val()=="true"))*/
		 						    + (((obj[i].flag==0)&&($('#isEditor').val()=="true")&&(obj[i].reviewer_id!=$('#hide_usid').val())) ? '<b>' : '')
									+ obj[i].reviewer_name
									+ '</a><small class="comment-time">&nbsp&nbsp&nbsp&nbsp&nbsp'
									+ obj[i].review_time
									+ '</small>&nbsp&nbsp&nbsp&nbsp&nbsp'
									+ obj[i].review_content
									+ (((obj[i].flag==0)&&($('#isEditor').val()=="true")&&(obj[i].reviewer_id!=$('#hide_usid').val())) ? '</b>' : '')
									+ '</p>'
									+ '</div><hr>');
	}
	
}

//添加回复
function respond(ob) {  
	var user_name = $('#hide_usnname').attr('value');
//	alert(user_name);
	if (user_name!="null"){
        var text = prompt("回复", ""); //将输入的内容赋给变量 name ，  
 		var id_well=$(ob).attr("id");
  		//alert(cureview[1]);
  		//alert(id_well);
  		//alert(text);
        //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值  
        if (text)//如果返回的有内容  
        {  
        	var alg_id = $('.hide_d').attr('value');
//			var user_name = $('#hide_usnname').attr('value');
			var user_id = $('#hide_usid').attr('value');
//			alert(user_id);
			var reviewer_id = cureview[id_well].reviewer_id;
			var reviewer_name = cureview[id_well].reviewer_name;
			var review_id = cureview[id_well].review_id;
			var time = getTime(); 
			var flag = 0; 
//			alert(reviewer_name);
        
        	$.post('respondActionAdd', {
				'algorithm_id' : alg_id,
				'reviewer_id' : reviewer_id,
				'responder_id': user_id,
				'flag' : 0,
				'respond_content' : text,
				'respond_time' : time,
				'review_id' : review_id
			}, addInComment); 
		} 
	}
     else{
      	alert("请先登录");
     }
		function addInComment(data){
		//从返回的data判断是否插入成功
			var flag = eval('(' + data + ')');
			if (flag != 0) {
				$('#com_text').val('');
				$('#well'+review_id+'')
					.append(
									'<p>'
									+ user_name
									+ '<small>&nbsp&nbsp回复</small>&nbsp&nbsp'
									+ reviewer_name
									+ '<small class="comment-time">&nbsp&nbsp&nbsp&nbsp&nbsp'
									+ time
									+ '</small>&nbsp&nbsp&nbsp&nbsp&nbsp'
									+ text
									+ '</p>');
			}
		}
}

//回复显示

$(function() {
	var alg_id = $('.hide_d').attr('value');
	$.post('RespondListAction',{algorithm_id:alg_id},respond_ready);
	//alert(alg_id);

});
function respond_ready(data) {
	var obj = eval('(' + data + ')');
	var currentIndex = obj.currentIndex;
	var totalpage = obj.totalPage;
 	cu_index = currentIndex;
	total_pages =totalpage;
	var cuArrCom = obj.cuArrCom;
	cuIndex_readyRespond(cuArrCom);
}
function cuIndex_readyRespond(obj) {
	for ( var i = 0; i < obj.length; i++) {
		 $('#well'+obj[i].review_id+'').append(
									'<p><span id="'+obj[i].responer_id+'" onclick="subRespond1(this,'+obj[i].review_id+');">'
									+ obj[i].responer_name
									+ '</span><small>&nbsp&nbsp回复</small>&nbsp&nbsp<span id="'+obj[i].reviewer_id+'" onclick="subRespond2(this,'+obj[i].review_id+');">'
									+ obj[i].reviewer_name
									+ '</span><small class="comment-time">&nbsp&nbsp&nbsp&nbsp&nbsp'
									+ obj[i].respond_time
									+ '</small>&nbsp&nbsp&nbsp&nbsp&nbsp'
									+ obj[i].respond_content
									+ '</p>');
	}
}
	
//在回复中进行回复，通过识别鼠标点击用户来识别回复目标1.responder；
function subRespond1(ob,review_id) {  
	var user_name = $('#hide_usnname').attr('value');
	if (user_name!="null"){
        var text = prompt("回复", ""); //将输入的内容赋给变量 name ，  
 		var reviewer_id=$(ob).attr("id");
        //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值  
        if (text)//如果返回的有内容  
        {  
        	var alg_id = $('.hide_d').attr('value');
			var user_id = $('#hide_usid').attr('value');
			var time = getTime(); 
			var flag = 0; 
        
        	$.post('respondActionAdd', {
				'algorithm_id' : alg_id,
				'reviewer_id' : reviewer_id,
				'responder_id': user_id,
				'flag' : 0,
				'respond_content' : text,
				'respond_time' : time,
				'review_id' : review_id
			}, addInComment); 
		} 
	}
     else{
      	alert("请先登录");
     }
		function addInComment(data){
		//从返回的data判断是否插入成功
			var flag = eval('(' + data + ')');
			if (flag != 0) {
				alert("回复成功");
				location.reload();
			}
			else{alert("回复失败");}
		}
}

//在回复中进行回复，通过识别鼠标点击用户来识别回复目标2.reviewer；
function subRespond2(ob,review_id) {  
	var user_name = $('#hide_usnname').attr('value');
	if (user_name!="null"){
        var text = prompt("回复", ""); //将输入的内容赋给变量 name ，  
 		var reviewer_id=$(ob).attr("id");
        //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值  
        if (text)//如果返回的有内容  
        {  
        	var alg_id = $('.hide_d').attr('value');
			var user_id = $('#hide_usid').attr('value');
			var time = getTime(); 
			var flag = 0; 
        
        	$.post('respondActionAdd', {
				'algorithm_id' : alg_id,
				'reviewer_id' : reviewer_id,
				'responder_id': user_id,
				'flag' : 0,
				'respond_content' : text,
				'respond_time' : time,
				'review_id' : review_id
			}, addInComment); 
		} 
	}
     else{
      	alert("请先登录");
     }
		function addInComment(data){
		//从返回的data判断是否插入成功
			var flag = eval('(' + data + ')');
			if (flag != 0) {
				alert("回复成功");
				location.reload();
			}
			else{alert("回复失败");}
		}
}

var reme_inputExam = "";
function edit(divid){

	console.log($('#'+divid+' .text').css('display'));
	// $('#'+divid ".text").css();
	$("#" + divid + " .input").val($("#" + divid + " .text").text());
	$("#" + divid + " .alg_inpIns").removeAttr("disabled");
	reme_inputExam = $("#" + divid + " .alg_inpIns").val();
	if($('#'+divid+' .edit').css('display')=='block'){
		//$('#'+divid+' .text') ? $('#'+divid+' .text').css('display','block'):'';
		$('#'+divid+' .text').css('display','block');
		$('#'+divid+' .edit').css('display','none');
	}else{
		//$('#'+divid+' .text') ? $('#'+divid+' .text').css('display','none'):'';
		$('#'+divid+' .text').css('display','none');
		$('#'+divid+' .edit').css('display','block');
	}
	
}

function showinput(){
	if($('.taginput').css('display')=='block'){
		$('.taginput').css('display','none');
	}else{
		$('.taginput').css('display','block');
		$('.tagedit').val("");
	}
}

function submit_edit(divid){
	var alg_id = $('.hide_d').attr('value');
	var editKey = "";
	var editValue = $("#" + divid + " .myinput").val();
	if(divid == "algodescribe_div")
	{
		editKey = "description";
		$("#" + divid + " .text").text($("#" + divid + " .myinput").val());
	}
	else if(divid == "inputdescribe_div")
	{
		editKey = "inputDescription";
		$("#" + divid + " .text").text($("#" + divid + " .myinput").val());
	}
	else if(divid == "input_div")
	{
		editKey = "inputInstance";
		//$("#" + divid + " .")
		$("#" + divid + " .myinput").attr("disabled", "disabled");
	}
	//alert("editKey:" + editKey  + "\neditValue:" + editValue);
 	$.post("editAlgoAction.action",
	{
		"id" : alg_id,
		"editKey" : editKey,
		"editValue" : editValue
	},
	edit_callback
	);
	$('#'+divid+' .text').css('display','block');
	$('#'+divid+' .edit').css('display','none');
	
	function edit_callback(data){
		if(divid == "input_div")
		{
			$("#" + divid + " .alg_outIns").val(data);
			return;
		}
		$.messager.show({
				title: 'Message',
				msg: data,
				timeout: 3000,
				showType: 'show'
			});
	}
}

function cancel_edit(divid){
	//alert(divid);
	$('#'+divid+' .text').css('display','block');
	$('#'+divid+' .edit').css('display','none');
	$("#" + divid + " .alg_inpIns").attr("disabled", "disabled");
	$("#" + divid + " .alg_inpIns").val(reme_inputExam);
}

	var tagIdList = new Array();
	var tagNameList = new Array();	
	$(function() {
		$.post("showTagAction.action",
			{},
			showTag_callback,
			"json"
		);
		function showTag_callback(data) {
			console.log(data);
			$.each(data, function(i, tag) {
				tagIdList[i] = tag.id;
				tagNameList[i] = tag.tagName;
			});
		//alert(tagIdList + "\n" + tagNameList);
		var words = ['at', 'boat', 'bear', 'chief', 'dog', 'drink', 'elephant', 'fruit', 'grave','hotel', 'illness', 'London', 'motorbike'];
		$(".tagedit").autocomplete(tagNameList,{
                    minChars: 0, //双击空白文本框时显示全部提示数据
                    formatItem: function (data, i, total) {
                        return "<I>" + data[0] + "</I>"; //改变匹配数据显示的格式
                    },
                    formatMatch: function (data, i, total) {
                        return data[0];
                    },
                    formatResult: function (data) {
                        return data[0];
                    },
                    max: 8
                }).result(SearchCallback); 
                function SearchCallback(event, data, formatted) {
                    //$(".tip").show().html("您的选择是：" + (!data ? "空" : formatted));
                }
		}
		
		
	});

</script>
<script type="text/javascript">
	$(function(){
		var info = '<%=request.getParameter("alg_id")%>';
		$.post('limitsControlAction.action',
			{'id' : info},
			limits_callback);
	});
	setTimeout(limits_callback, 1000);
	function limits_callback(data) {
		if(data == "true")
		{
		//alert(1);
			$('#isEditor').val(data);
			$('.iconfont').css('visibility','visible');
		}
	}
</script>

 <div class="hide_d" value="<%=request.getParameter("alg_id")%>">
	<form action="#" class="hide_element">
		<input type="hidden" id="hide_usnname"
			value="<%=(String) session.getAttribute("user")%>">
		<input
			type="hidden" id="hide_usid"
			value="<%=(Integer)session.getAttribute("id")%>">
		<input type="hidden" id="isEditor">
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

							<div class="listTagView">
								<ul class="list-unstyled ">
								</ul>
							</div>
							<hr>
						</div>
						<div class="text-center" id="viewsource_div">
							<a href="viewSourceAction.action?algorithm_id=<%=request.getParameter("alg_id")%>" class="btn btn-primary">查看源代码</a>
							<a href="deleteAlgoAction.action?id=<%=request.getParameter("alg_id")%>" class="btn btn-primary">删除算法</a>
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-9">
			<!-- 搜索算法 -->
			<div class="well">
				<div class="well_1">
				
<!-- 				<div id="algodescribe_div">
				
					<h3 class="describe">算法描述</h3>
					<a class="icon iconfont" href="javascript:edit('algodescribe_div')">&#xe69e;</a>
					<p class="text">Dijkstra算法是典型最短路算法，用于计算一个节点到其他所有节点的最短路径。主要特点是以起始点为中心向外层层扩展，直到扩展到终点为止，得出最短径的最优解。</p>
					<div class="edit">
						<textarea class="input form-control input-sm"></textarea>
						<button type="submit" class="btn btn-primary">Submit</button><button type="submit" class="btn btn-default">Cancle</button>
					</div>
				</div>
				<div id="inputdescribe_div">
					<h3 class="describe">输入说明</h3><a class="icon iconfont" href="javascript:edit('inputdescribe_div')">&#xe69e;</a>
					<p class="text">顶点坐标，邻居点坐标，起始点坐标，终点坐标</p> 
					<div class="edit">
						<textarea class="input form-control input-sm"></textarea>
						<button type="submit" class="btn btn-primary">Submit</button><button type="submit" class="btn btn-default">Cancle</button>
					</div>
				</div> -->
				
					<table id="input_div" cellspacing="15px" cellpadding="5px" class="well_table">
						<tr>
							<th>输入实例<a class="icon iconfont" href="javascript:edit('input_div')">&#xe69e;</a></th>
							<th>输出实例</th>
						</tr>
						<tr>
							<td><textarea name="inputExam" id="inputInstance"
									style="height:90px; width:300px; background-color:#ECECEC; border:0px"
									class="alg_inpIns myinput" disabled="disabled"></textarea>
								
							</td>
							<td><textarea name="inputExam"
									style="height:90px; width:300px; background-color:#ECECEC; border:0px"
									class="alg_outIns"></textarea>
							</td>
						</tr>
						<tr>
							<td>
							<div class="edit">
								<button type="submit" class="btn btn-primary" onclick="submit_edit('input_div')">Submit</button><button type="submit" class="btn btn-default" onclick="cancel_edit('input_div')">Cancel</button>
							</div>
							</td>
							<td>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<hr>

			<!-- 测试 -->
			<h3>在线测试</h3>
			<p>在控制台中输入测试数据：</p>
			<div id="console_test"></div>
			<hr>
			<h3>API使用方法</h3>
			<!-- API usage example -->
			<div class="bs-example">
				<ul class="nav nav-tabs" style="margin-bottom: 15px;"
					id="nav_tabs_1">
					<!-- <li class="active"><a href="#home" data-toggle="tab">Javascript</a>
					</li>
					<li><a href="#profile" data-toggle="tab">C++</a>
					</li>
					<li><a href="#cusage" data-toggle="tab">C</a>
					</li> -->
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade active in" id="home" shu="shuixng">
						<!-- <p>Raw denim you probably haven't heard of them jean shorts
							Austin. Nesciunt tofu stumptown aliqua, retro synth master
							cleanse. Mustache cliche tempor, williamsburg carles vegan
							helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher
							synth. Cosby sweater eu banh mi, qui irure terry richardson ex
							squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis
							cardigan american apparel, butcher voluptate nisi qui.</p> -->
					</div>
					<div class="tab-pane fade" id="api_js"></div>
					<!-- <div class="tab-pane fade" id="profile">
						<p>Food truck fixie locavore, accusamus mcsweeney's marfa
							nulla single-origin coffee squid. Exercitation +1 labore velit,
							blog sartorial PBR leggings next level wes anderson artisan four
							loko farm-to-table craft beer twee. Qui photo booth letterpress,
							commodo enim craft beer mlkshk aliquip jean shorts ullamco ad
							vinyl cillum PBR. Homo nostrud organic, assumenda labore
							aesthetic magna delectus mollit.</p>
					</div> -->
					<!-- <div class="tab-pane fade" id="cusage">
						<p>Etsy mixtape wayfarers, ethical wes anderson tofu before
							they sold out mcsweeney's organic lomo retro fanny pack lo-fi
							farm-to-table readymade. Messenger bag gentrify pitchfork
							tattooed craft beer, iphone skateboard locavore carles etsy
							salvia banksy hoodie helvetica. DIY synth PBR banksy irony.
							Leggings gentrify squid 8-bit cred pitchfork.</p>
					</div> -->
				</div>
				<hr>

				<!--评价 -->
				<h3>评价反馈</h3>
				<form role="form">
					<div class="form-group">
						<input type="text" class="form-control" id="com_text"
							name="review">
					</div>
					<button type="button" class="btn btn-primary"
						onclick="sub_comment()">评价</button>
				</form>
				<div class="well" id="comment_well">
					<div class="well" id="add_well"></div>
					
				</div>
			</div>
		</div>
	</div>
	<script>
		
		var setFlag = function (){
			var reg = new RegExp("(^|&)"+ "flag" +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
			var r = window.location.search.substr(1).match(reg);
			if(r != null){
				$.post('setFlag.action',{algorithm_id:'<%=request.getParameter("alg_id")%>'},null);
			}
		}
		/*window.onload = setFlag;*/
		setTimeout(setFlag, 20 );
		
	window.onload = function(){
	var info = '<%=request.getParameter("alg_id")%>';
	$.post('limitsControlAction.action',
		{'id' : info},
		limits_callback);
	}
	setTimeout(limits_callback, 1000);
	function limits_callback(data) {
		//alert(data);
		var obj = eval('(' + data + ')');
		var flag = obj.flag;
		var type_name = obj.type_name;
		var map = obj.type_map;
		//alert(map);
		//alert(map.length);
		//alert(type_name);
		if(flag == "true")
		{
			$('.iconfont').css('visibility','visible');
			$.each(map, function(i, type){
				$('select').append('<option>' + type + '</option>');
			});
			$('select option:contains(\"' + type_name + '\")').attr('selected', true);
		}
		else
		{
			$('select').remove();
			$('#select_button').remove();
			$('p:contains("算法类型")').after('<p>' + type_name + '</p>');
		}
	}
	
	function select_submit() {
		var info = '<%=request.getParameter("alg_id")%>';
		var selectValue = $('select option:selected').text();
		//alert(selectValue);
		$.post("setSelectAction.action",
			{
				"id" : info,
				"type" : selectValue
			},
			setSelect_callback);
	}
	
	function setSelect_callback(data) {
		if(data == "success")
		{
			$.messager.show({
				title: 'Message',
				msg: "算法类型更新成功",
				timeout: 3000,
				showType: 'show'
			});
		}
	}

	</script>

	<jsp:include page="<%=M.j_tail%>" />