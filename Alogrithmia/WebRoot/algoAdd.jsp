<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />
		
		<style>
div {
	padding-bottom: 5px;
}
</style>

		<style type="text/css" media="screen">
#editor {
	width: 100%;
	height: 70%;
	margin: 0;
	position: relative;
	left: 0;
	top: 0;
}

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
#loginmodal,#addJarModal,#addInputFileModal,#runInputFileModal{
  width: 40%;
  padding: 5px 20px;
  background: #f3f6fa;
  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;
  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
}
</style>		
			
				<link rel="stylesheet" type="text/css" href="resources/css/easyui.css">
<!-- 			<script type="text/javascript" src="resources/js/jquery-1.2.6.pack.js"></script>
 -->				<script type="text/javascript" src="console/jquery-2.1.1.min.js"></script>
				<script type="text/javascript" src="console/jquery.console.js"></script>
				<!-- <script type="text/javascript" src="resources/js/jquery-2.1.4.js"></script> -->
				<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
				<!-- <script type="text/javascript" src="resources/js/jquery.messager.js"></script> -->
			
			  <link rel="stylesheet" type="text/css" media="all" href="css/style.css">
			  <script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
				<script type="text/javascript" src="js/ajaxfileupload.js"></script>
			
			<div id="page-wrapper" class="padding-top:0;">
				<div>
					<span class="input-group-btn">
						<button class="btn btn-sm btn-primary" type="button" id="save" disabled="disabled" onclick="save_compileSubmit();">
							保存
						</button>
						<button class="btn btn-sm btn-primary" type="button" id="compile" onclick="save_compileSubmit();">
							编译
						</button>
						<button class="btn btn-sm btn-primary" type="button" href="#addJarModal" class="flatbtn" id="addjar" >
							添加依赖包
						</button><!--
						<button class="btn btn-sm btn-primary" type="button" href="#addInputFileModal" class="flatbtn" id="addInputFile" >
							添加文件数据
						</button>
						--><!--
						<button class="btn btn-sm btn-primary" type="button" href="#addInputFile" class="flatbtn" id="addInputFile" >
							添加文件数据
						</button>
						--><!--<button class="btn btn-sm btn-primary" type="button" href="#runInputFileModal" class="flatbtn" id="runInputFile" >
							运行
						</button>
						--><button class="btn btn-sm btn-primary" type="button"  href="#loginmodal" class="flatbtn" id="modaltrigger">
							发布
						</button> 
						<button class="btn btn-sm btn-primary" type="button" class="flatbtn" onclick="toEdit()">
							编辑详情
						</button>
						</span>
				</div>

				<div id="editor" style="height:60%;">package <%= session.getAttribute("user") %>.<%=session.getAttribute("algorithm_name") %>;
public class <%=session.getAttribute("algorithm_name") %> {
	public int apply(int a,int b){
		System.out.println(a+b);
		return a+b;	
	}
}
				</div>

				<script src="src-noconflict/ace.js" type="text/javascript"
					charset="utf-8"></script>
<script>
	var base64EncodeChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	var base64DecodeChars = new Array(
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,
	52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,
	-1,	 0, 1, 2, 3,  4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
	15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,
	-1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
	41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1);
function base64encode(str) {
	var out, i, len;
	var c1, c2, c3;
	len = str.length;
	i = 0;
	out = "";
 	while(i < len) {
 c1 = str.charCodeAt(i++) & 0xff;
 if(i == len)
 {
	out += base64EncodeChars.charAt(c1 >> 2);
	out += base64EncodeChars.charAt((c1 & 0x3) << 4);
	out += "==";
	break;
 }
 c2 = str.charCodeAt(i++);
 if(i == len)
 {
	out += base64EncodeChars.charAt(c1 >> 2);
	out += base64EncodeChars.charAt(((c1 & 0x3)<< 4) | ((c2 & 0xF0) >> 4));
	out += base64EncodeChars.charAt((c2 & 0xF) << 2);
	out += "=";
	break;
 }
 c3 = str.charCodeAt(i++);
 out += base64EncodeChars.charAt(c1 >> 2);
 out += base64EncodeChars.charAt(((c1 & 0x3)<< 4) | ((c2 & 0xF0) >> 4));
 out += base64EncodeChars.charAt(((c2 & 0xF) << 2) | ((c3 & 0xC0) >>6));
 out += base64EncodeChars.charAt(c3 & 0x3F);
	}
	return out;
}

function base64decode(str) {
	var c1, c2, c3, c4;
	var i, len, out;
	len = str.length;
	i = 0;
	out = "";
	while(i < len) {
 /* c1 */
 do {
	c1 = base64DecodeChars[str.charCodeAt(i++) & 0xff];
 } while(i < len && c1 == -1);
 if(c1 == -1)
	break;
 /* c2 */
 do {
	 c2 = base64DecodeChars[str.charCodeAt(i++) & 0xff];
 } while(i < len && c2 == -1);
 if(c2 == -1)
	 break;
 out += String.fromCharCode((c1 << 2) | ((c2 & 0x30) >> 4));
 /* c3 */
 do {
	c3 = str.charCodeAt(i++) & 0xff;
	if(c3 == 61)
 return out;
	c3 = base64DecodeChars[c3];
 } while(i < len && c3 == -1);
 if(c3 == -1)
	 break;
 out += String.fromCharCode(((c2 & 0XF) << 4) | ((c3 & 0x3C) >> 2));
 /* c4 */
 do {
	 c4 = str.charCodeAt(i++) & 0xff;
	 if(c4 == 61)
 return out;
	c4 = base64DecodeChars[c4];
 } while(i < len && c4 == -1);
 if(c4 == -1)
	break;
 out += String.fromCharCode(((c3 & 0x03) << 6) | c4);
	}
	return out;
}
function utf16to8(str) {
	var out, i, len, c;
	out = "";
	len = str.length;
	for(i = 0; i < len; i++) {
 c = str.charCodeAt(i);
 if ((c >= 0x0001) && (c <= 0x007F)) {
	 out += str.charAt(i);
 } else if (c > 0x07FF) {
	 out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
	 out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));
	 out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));
 } else {
	 out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));
	 out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));
 }
	}
	return out;
}
function utf8to16(str) {
	var out, i, len, c;
	var char2, char3;
	out = "";
	len = str.length;
	i = 0;
	while(i < len) {
 c = str.charCodeAt(i++);
 switch(c >> 4)
 {
  case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7:
	 // 0xxxxxxx
	 out += str.charAt(i-1);
	 break;
 case 12: case 13:
	 // 110x xxxx 10xx xxxx
	 char2 = str.charCodeAt(i++);
	 out += String.fromCharCode(((c & 0x1F) << 6) | (char2 & 0x3F));
	break;
    case 14:
	 // 1110 xxxx 10xx xxxx 10xx xxxx
	 char2 = str.charCodeAt(i++);
	 char3 = str.charCodeAt(i++);
	 out += String.fromCharCode(((c & 0x0F) << 12) |
		((char2 & 0x3F) << 6) |
		((char3 & 0x3F) << 0));
	 break;
 }
	}
	return out;
}


	var editor = ace.edit("editor");
	editor.setTheme("ace/theme/twilight");
	if("" != '<%= session.getAttribute("algorithm_lang")%>' && 'null' != '<%= session.getAttribute("algorithm_lang")%>')
	{
		editor.getSession().setMode("ace/mode/" + '<%= session.getAttribute("algorithm_lang")%>');
	}
	else
	{
		editor.getSession().setMode("ace/mode/java");
	}
	editor.on("change", function(){
		$("#save").attr("disabled", false);
	});
	
 $(function()
	{
		var user_name = '<%= session.getAttribute("user") %>';
		var algorithm_name = '<%= session.getAttribute("algorithm_name") %>';
		var flag = '<%= request.getParameter("flag") %>';
		if(flag == "modi")
		{
			$.post("getAlogCodeAction.action",
				{},
				call_code
			);
		
			function call_code(data)
			{
				data = data.replace(new RegExp("<br>", "gm"),'\n');
				editor.setValue(data);
			}
		}
	});
	
	function save_compileSubmit(evt)
	{
		var buttonId = window.event?event.srcElement:evt.target;
		if(buttonId.id == "compile")
		{
			//document.getElementById("save").disabled = true;
			$("#save").attr("disabled", true);
		}
		
		var submitData = base64encode(utf16to8(editor.getValue()));
		
		$.ajax({
			type: "POST",
				url: "saveCompile.action",
				data: {"editor": submitData, "buttonId": buttonId.id},
				dataType: "text",
				success: function(returnedData){
					if(buttonId.id == "save")
					{
						$.messager.show({
							title:'Message',
							msg:returnedData,
							timeout:3000,
							showType:'show'
						});
					}
					else if(buttonId.id == "compile")
					{
						//$("#console1 div").remove(".jquery-console-prompt-box");
						$("#console1 span[class='jquery-console-prompt-label']:last").before('<div class="jquery-console-message jquery-console-message-value" style="">' + returnedData + '<br></div>');
						//$("#console1 div[class='jquery-console-prompt-box']:last").append('<div class="jquery-console-message jquery-console-message-value" style="">' + returnedData + '<br></div>');
					}
				}
		});
		
	} 
	
	function toEdit(){
		var id = <%= session.getAttribute("algorithm_id") %>;
		window.location.href= "algoView.jsp?alg_id=" + id;
	}
	
</script>


			
	<script type="text/javascript">
	
	var str="";
	
	$(document).ready(function() {
		/* First console */
		var console1 = $('<div class="console1" id="console1">');
		$('#page-wrapper').append(console1);
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
				if(line == 'clear')
				{
					$("#console1 .jquery-console-inner").children("div").remove();
					str = "";
					/* $("#console1 .jquery-console-inner").append('<div class="jquery-console-prompt-box">' +
						'<span class="jquery-console-prompt-label" style="display: inline;">Demo&gt;&nbsp;</span>' +
						'<span class="jquery-console-prompt"><span class="jquery-console-cursor">&nbsp;</span></span></div>');	 */			
				}
				else
				{
					$.ajax({
					type: "POST",
					url: "testAction.action",
					data: {"line": line, "requestSource": "algoAdd"},
					dataType: "html",
					async: false,
					success: function(returnedData){
						str = returnedData;
						}
					});
				}
				
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
	

</script>


 <div id="loginmodal" style="display:none;margin-top:-10px;">
    <h1>算法发布</h1>
    <form id="loginform" name="loginform" method="post" action="index.html"><!--
          <label for="description">算法描述:</label>
      <textarea type="text" name="description" class="txtfield" tabindex="1"  id="description"></textarea>
          <label for="inputDescription">输入说明:</label>
      <textarea type="text" name="inputDescription" id="inputDescription" class="txtfield" tabindex="1" ></textarea>
          <label for="inputType">输入类型:</label>
      <input type="text" id="inputType" class="txtfield" tabindex="2" name="inputType">
          <label for="outputType">输出类型:</label>
      <input type="text" id="outputType" class="txtfield" tabindex="2" name="inputInstance">
          <label for="inputInstance">输入实例:</label>
      <input type="text" id="inputInstance" class="txtfield" tabindex="2" name="inputInstance">
          <label for="outputInstance">输出实例:</label>
      <input type="text" name="outputInstance" id="outputInstance" class="txtfield" tabindex="2">
      	  --><label for="pay">付费:</label>
      <input type="text" name="pay" id="pay" class="txtfield" tabindex="2">

      <div class="center"><input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="发布" tabindex="3"></div>
    </form>
    
    
  </div>
  
   <div id="addInputFileModal" style="display:none;margin-top:-10px;">
    <h1>输入文件</h1>
    <form id="addInputFileform" name="addInputFileform" method="post" action="" enctype="multipart/form-data">
          <label for="inputfile">添加输入文件:</label>
      <input type="file" name="file" id="inputfile1" class="txtfield" tabindex="1" >
      	  <div>
          <label for="deletefile">选择删除文件:</label>
          	<select name="deletefile" id="deletefile" class="txtfield" tabindex="2">
              	</select>
   		      <input type="button" name="deleteInputBtn" id="deleteInputBtn" class="flatbtn-blu hidemodal" value="delete" tabindex="3">
      	  </div>
          <label for="uploadedfile">已添加文件:</label>
      <textarea name="uploadedfile" class="txtfield" tabindex="1"  id="uploadedfile" readonly></textarea>

      <div class="center">
      	<input type="submit" name="addInputBtn" id="addInputBtn" class="flatbtn-blu hidemodal" value="submit" tabindex="3">
      	<input type="button" name="cancel" id="cancelBtn" class="flatbtn-blu hidemodal" value="cancel" tabindex="4">
      </div>
    </form>
 </div>
  
  <div id="runInputFileModal" style="display:none;margin-top:-10px;">
    <h1>测试运行</h1>
    <form id="runInputFileform" name="runInputFileform" method="post" action="" >
          <label for="selectfile">选择测试文件:</label>
          <select name="selectfile" id="selectfile" class="txtfield" tabindex="2">
              	</select>
          <label for="runuploadedfile">已添加文件:</label>
      <textarea name="runuploadedfile" class="txtfield" tabindex="1"  id="runuploadedfile" readonly></textarea>

      <div class="center">
      	<input type="submit" name="runInputBtn" id="runInputBtn" class="flatbtn-blu hidemodal" value="submit" tabindex="3">
      	<input type="button" name="cancel" id="cancelBtn" class="flatbtn-blu hidemodal" value="cancel" tabindex="4"> 
      </div>
    </form>
  </div>
  
  
  <div id="addJarModal" style="display:none;margin-top:-10px;">
    <h1>添加Jar包</h1>
    <form id="addJarform" name="addJarform" method="post" action="" enctype="multipart/form-data">
          <label for="file">添加文件1:</label>
      <input type="file" name="file" id="file1" class="txtfield" tabindex="1" >
      
		
      <div class="center">
      	<input type="button" name="addbtn" id="addbtn" class="flatbtn-blu" value="Add file" tabindex="3">
      	<input type="submit" name="addJarbtn" id="addJarbtn" class="flatbtn-blu hidemodal" value="submit" tabindex="3">
      </div>
    </form>
  </div>
  
<script type="text/javascript">
$(function(){
  $('#loginform').submit(function(e){
  	var description = $("#description").val();
	var inputDescription = $("#inputDescription").val();
	var inputType = $("#inputType").val();
	var outputType = $("#outputType").val();
	var inputInstance = $("#inputInstance").val();
	var outputInstance = $("#outputInstance").val();
	var pay = $("#pay").val();
	var id = <%= session.getAttribute("algorithm_id") %>;
	
	//判断是否为double
	function checkIsDouble(checkNum) {
		var reg=/^[-\+]?\d+(\.\d+)?$/;
		if(reg.test(checkNum)){
			return true;
		}
		return false;
	}
	
	var checkPay = checkIsDouble(pay);
	if(checkPay == false)
	{
		alert("付费输入不正确");
		$("#pay").val("");
		return false;
	}
	
	$.post("publishAlgoAction.action",
		{
/*			"description" : description,
			"inputDescription" : inputDescription,
			"inputType" : inputType,
			"outputType" : outputType,
			"inputInstance" : inputInstance,
			"outputInstance" : outputInstance,*/
			"pay" : pay,
			"id" : id
		},
		publishCallback);
				
	function publishCallback(data){
		$.messager.show({
			title: 'Message',
			msg: data,
			timeout: 3000,
			showType: 'show'
		});
	}
	
    return false;
  });
  
  $('#addJarform').submit(function(e){
  	var files = [];
	var len = $("#addJarform > input[type=file]").length;
	for(var i = 0; i < len; i++)
	{
		files[i] = 'file' + (i + 1);
	}
	$.ajaxFileUpload(
	{
		url : 'addJarAction',
		secureuri : false,
		fileElementId : files,
		dataType : 'json',
		success : function(data, status){
			var str = data.algorithm_jar;
			str += '<br>添加成功';
			$.messager.show({
				title: 'Message',
				msg: str,
				timeout: 3000,
				showType: 'show'
			});
		}
	});
	  	
  	return false;
  });
  
  $('#addbtn').click(function(){
  	var i = $("#addJarform > input[type=file]").length + 1;
  	$("#addJarform > input:last").after('<label for="addfile">添加文件' + i + ':</label><input type="file" name="file" id="file' + i + '" class="txtfield" tabindex="1" >');
  });
  
  $('#addInputFileform').submit(function(){
  	
  	var files = [];
  	var len = $("#addInputFileform > input[type=file]").length;
  	for(var i = 0;i < len; i++)
  	{
  		files[i] = 'inputfile1';
  	}
  	alert(len);
  	$.ajaxFileUpload(
  	{
  		url : 'addInputFileAction',
  		secureuri : false,
  		fileElementId : files,
  		dataType : 'json',
  		success : function(data, status){
  			$.messager.show({
				title: 'Message',
				msg: "文件添加成功",
				timeout: 3000,
				showType: 'show'
			});
  		}
  	}
  	);
  	
  	return false;
  });
  
  $("#addInputFile").click(function(){
  	
  	
  	$.post("readInputFileAction.action",
  		{},
  		call_inputFile
  	);
  	
  	
  	
  	function call_inputFile(data)
  	{
  		var list = data.split(';');
  		var mySelect = document.getElementById("deletefile");
  		mySelect.options.length = 0;
  		var i = 0;
  		for(i=0; i < list.length; i++)
  		{
  			str = list[i];
  			var op = new Option(str, i);
  			mySelect.add(op);
  		}
  		$("#uploadedfile").val(data);
  	}
  });
  
  $('#runInputFileform').submit(function(){
  	
  	var selectFile = $("#selectfile").find('option:selected').text();
  	var runFlie = $("#runuploadedfile").val();
  	
  	if(runFlie.includes(selectFile))
  	{
  		$.post("runInputFile.action",
  			{"selectFile" : selectFile},
  			call_runInputFile
  		);
  		
  		function call_runInputFile(data)
  		{
  			$("#console1 div[class='jquery-console-prompt-box']:last").prepend('<div class="jquery-console-message jquery-console-message-value" style="">' + data + '<br></div>');
  		}
  	}
  	else
  	{
  		alert("请选择已上传文件");
  	}
  	
  	return false;
  });
  
  $("#runInputFile").click(function(){
  	$.post("readInputFileAction.action",
  		{},
  		call_runInputFile
  	);
  	
  	function call_runInputFile(data)
  	{
  		var list = data.split(';');
  		var mySelect = document.getElementById("selectfile");
  		mySelect.options.length = 0;
  		var i = 0;
  		for(i=0; i < list.length; i++)
  		{
  			str = list[i];
  			var op = new Option(str, i);
  			mySelect.add(op);
  		}
  		$("#runuploadedfile").val(data);
  	}
  });
  
  $("#deleteInputBtn").click(function(){
  	
  	var deleteFile = $('#deletefile').find('option:selected').text();
  	//alert(deleteFile);
  	
  	if(deleteFile == null || deleteFile == '')
  	{
  		alert("输入不能为空");
  	}
  	else
  	{
  		alert(deleteFile);
  		$.post("deleteInputFile.action",
  			{"deleteFile" : deleteFile},
  			call_deleteInputFile
  		);
  		
  		function call_deleteInputFile(data)
  		{
  			if(data == "success")
  			{
  				alert("删除文件成功");
  			}
  			else
  			{
  				alert("删除文件失败");
  			}
  		}
  	}
  });
  
  $('#addjar').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
  $('#addInputFile').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
  $('#runInputFile').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
});
</script>

			</div>
<jsp:include page="<%=M.j_tail%>" />

