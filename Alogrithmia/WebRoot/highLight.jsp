<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'hightLight.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
		
	<style type="text/css" media="screen">
    body {
    margin:0;
    padding:0;
    }

    #editor {
    	width:100%;
    	height:70%;
        margin: 0;
        position: fixed;
        left:0;
        top:0;
    }
    
     div.console1,div.console2,div.console3 { word-wrap: break-word; }
      /* First console */
      div.console1 { font-size: 14px}
     div.console1 div.jquery-console-inner
       { width:auto; height:90%; background:#333; padding:0;margin:10px;
       
         overflow:auto }
      div.console1 div.jquery-console-prompt-box
       { color:#fff; font-family:monospace; }
      div.console1 div.jquery-console-focus span.jquery-console-cursor
       { background:#fefefe; color:#333; font-weight:bold }
      div.console1 div.jquery-console-message-error
       { color:#ef0505; font-family:sans-serif; font-weight:bold;
         padding:0.1em; }
      div.console1 div.jquery-console-message-value
       { color:#1ad027; font-family:monospace;
         padding:0.1em; }
      div.console1 div.jquery-console-message-type
       { color:#52666f; font-family:monospace;
         padding:0.1em; }
      div.console1 span.jquery-console-prompt-label { font-weight:bold }
       div.console1 { height:28%; width:100%; position: fixed; left:0; bottom:0;}
    
    
    
  	</style>
  </head>
  	
  <body>
  	
  	<div id="editor">function foo(items) {
    var i;
    for (i = 0; i &lt; items.length; i++) {
        alert("Ace Rocks " + items[i]);
    }
	}	
	</div>
  
  	<script src="src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
	<script>
    var editor = ace.edit("editor");
    editor.setTheme("ace/theme/twilight");
    editor.getSession().setMode("ace/mode/javascript");
	</script>
  
  
	<script type="text/javascript" src="console/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="console/jquery.console.js"></script>
	<script type="text/javascript">
      $(document).ready(function(){
         /* First console */
         var console1 = $('<div class="console1">');
         $('body').append(console1);
         var controller1 = console1.console({
           promptLabel: 'Demo> ',
           commandValidate:function(line){
             if (line == "") return false;
             else return true;
           },
           commandHandle:function(line){
               return [{msg:"=> [12,42]",
                        className:"jquery-console-message-value"},
                       {msg:":: [a]",
                        className:"jquery-console-message-type"}]
           },
           autofocus:true,
           animateScroll:true,
           promptHistory:true,
           charInsertTrigger:function(keycode,line){
              // Let you type until you press a-z
              // Never allow zero.
              return !line.match(/[a-z]+/) && keycode != '0'.charCodeAt(0);
           }
         });
    });
    </script>  
  	 
  </body>
</html>
