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
</style>		
			
				<link rel="stylesheet" type="text/css" href="resources/css/easyui.css">
				<script type="text/javascript" src="console/jquery-2.1.1.min.js"></script>
				<script type="text/javascript" src="console/jquery.console.js"></script>
				<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
			
			  <link rel="stylesheet" type="text/css" media="all" href="css/style.css">
			  <script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
				<script type="text/javascript" src="js/ajaxfileupload.js"></script>
			
			<div id="page-wrapper" class="padding-top:0;">
				<div>
					<span class="input-group-btn">
						<button class="btn btn-sm btn-primary" type="button"  href="#loginmodal" class="flatbtn" id="modaltrigger">
							依赖包
						</button> 
						<button class="btn btn-sm btn-primary" type="button" href="#runInputFileModal" class="flatbtn" id="runInputFile" >
							运行
						</button>	
					</span>
				</div>

				<div id="editor" style="height:60%;">package <%= session.getAttribute("user_name") %>.<%=session.getAttribute("algorithm_name") %>;
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
	var editor = ace.edit("editor");
	editor.setTheme("ace/theme/twilight");
	editor.getSession().setMode("ace/mode/" + '<%= session.getAttribute("algorithm_lang")%>');
	editor.on("change", function(){
		$("#save").attr("disabled", false);
	});
	editor.setReadOnly(true);
	//editor.setValue('<%= request.getParameter("str")%>');
	
 $(function()
	{
		$.post("getAlogCodeAction.action",
				{},
				call_code
		);
		
		function call_code(data)
		{
			//alert(data);
			data = data.replace(new RegExp("<br>", "gm"),'\n');
			editor.setValue(data);
		}
	});
	
	
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
					type: "GET",
					url: "testAction.action",
					data: {"line": line, "requestSource": "viewSource", "user_name": '<%= request.getParameter("user_name")%>'},
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
    <h1>算法依赖包</h1>
    <form id="loginform" name="loginform" method="post" action="index.html">
          <label for="description">包名称:</label>
      <textarea type="text" name="description" class="txtfield" tabindex="1"  id="description" readonly></textarea>

      <div class="center"><input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="close" tabindex="3"></div>
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
  
<script type="text/javascript">
$(function(){
  $('#loginform').submit(function(e){
	
    return false;
  });
  
  $(function(){
  	$.post("readJarAction.action",
  		{"algorithm_id": '<%= session.getAttribute("algorithm_id")%>'},
  		call_jar
  	);
  	
  	function call_jar(data)
  	{
  		$("#description").val(data);
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
  
	  	
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
  $('#runInputFile').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
});
</script>

			</div>
<jsp:include page="<%=M.j_tail%>" />

