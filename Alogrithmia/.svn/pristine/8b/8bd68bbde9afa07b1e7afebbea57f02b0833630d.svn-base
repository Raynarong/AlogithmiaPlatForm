<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="alg.base.service.*" %>
<%@ page import="alg.base.bean.*" %>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>


<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />


<script src="js/dropzone.js"></script>
<link rel="stylesheet" href="css/dropzone.css">
<link rel="stylesheet" href="css/font/iconfont.css">
<style>

a:hover{
	text-decoration:none;
	cursor: pointer;
}
a{
	text-decoration:none;
	color:#555555;
}
li{
	text-decoration:none;
	list-style-type:none;
	line-height: 30px;
}
.center {
    margin-top:50px;   
}

.modal-header {
    padding-bottom: 5px;
}

.modal-footer {
        padding: 0;
}
    
.modal-footer .btn-group button {
    height:40px;
    border-top-left-radius : 0;
    border-top-right-radius : 0;
    border: none;
}
    
.modal-footer .btn-group:last-child > button {
    border-right: 0;
}
.btn{
	display: inline-block;
}

.form-control{
	width: 100%;
}
h3{
	font-weight : bold;
}
.editor{
	display: none;
	
}
.content{
	display: static;
}
.icon{
	display: inline-block;
	padding-left: 10px;
}
.admin{}
</style>
	<link rel="stylesheet" href="css/font/iconfont.css">
	<link rel="stylesheet" href="themes/default/default.css" />
	<link rel="stylesheet" href="plugins/code/prettify.css" />
	<script charset="utf-8" src="js/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="lang/zh-CN.js"></script>
	<script charset="utf-8" src="plugins/code/prettify.js"></script>
	<script> 
	
		var editor1;

		KindEditor.ready(function(K) {
				editor1 = K.create('textarea[name="content1"]', {
				cssPath : 'plugins/code/prettify.css',
				uploadJson : 'jsp/upload_json.jsp',
				fileManagerJson : 'jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					/* K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					}); */
				}
			});
			prettyPrint();
		});
		
		function edit(){
			
			editor1.html($('.content').html());
			if($('.content').css('display')=="block"){
				$('.content').css('display','none');
				$('.editor').css('display','block');
			}else{
				$('.content').css('display','block');
				$('.editor').css('display','none');
			}
		
		}
		
		function submit_content() {
			var html = editor1.html();
			$.post("aboutUsAction.action", {'about_text' : html}, aboutUs_callback);
			//$('.content').css('display','block');
			//$('.editor').css('display','none');
		}
		
		function aboutUs_callback(data) {
			location.reload();
		}
		
		$(function() {
			$.post("loadAboutUsAction.action", {}, loadAboutUs_callback);
		});
		
		function loadAboutUs_callback(data) {
			$('.content').html('');
			$('.content').html(data);
		}
	</script>
	
     <div class="container">
      

            <div class="row">
            <h2>平台简介<a class="admin icon iconfont" href="javascript:edit();">&#xe69e;</a></h2>
            <hr/>
                  <div id="editor" class="editor"> 
        <%=htmlData%>
		<form name="example" method="post" action="">
			<textarea name="content1" cols="100" rows="8" style="width:100%;height:500px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
			<br />
			<input type="button" name="button" value="提交内容" onclick="submit_content()"/>
		</form>
	 </div>    
	<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>
                <div class="col-lg-12">
                    <!-- 提问搜索和列表 -->
                    <div class="well content" >
                      <!-- <p>
                      	<h3>1.平台简介</h3>
                    	在软件开发的过程中，算法是很重要的组成部分。然而有些计算机科学研究人员花费数年开发的算法，尽管对IT企业很有用，却在学术范围以外罕有人见。这不得不说是一种资源浪费。因此，设计与实现一个算法交易服务平台将是一件十分有意义的工作。算法开发者可算法交易服务平台以将自己的算法发布到平台上，并且指定算法的使用成本。而用户则可以根据自己的需求在平台上搜索特定的算法，一旦搜索到自己需要的算法，仅仅添加几行代码，通过调用API，就可以获得理想的结果。平台以这种模式让算法作者将自己的智慧成果运用到实际应用中，并拿到钱，同时也能让其他没有微软、Google 那么多资源的公司更容易进入算法开发的世界里，为开发找到最佳的解决方案，实现算法开发者与用户的双赢。
                      </p>
                   	
                      <p>
                      	<h3>2.支持的语言</h3>
                      	 本平台支持的语言服务端有java语言、客户端有js语言、java语言、直接发包。
                      </p>
                      <p>
                      	<h3>3.支持的输入类型</h3>
                      	 本平台支持的算法输入类型有：基本类型、Map、多维数组。
                      </p>
                      <P>
                      	<h3>4.评价算法</h3>
                      	登录用户可以对算法进行评价，我们很欢迎你的评价，这是对我们平台上算法的直接反馈。                      
                      </P>
                      <p>
                         <h3>5.提交算法</h3>
                        <p> 登录后的用户有添加算法的权限。</p><p>添加算法的步骤:</p>
                        <p> 创建算法，按照示例代码完善apply方法，算法需要有输入值和返回值。</p>
                        <p>    点击保存算法之后，在下次登录账号时，会有上次编辑的算法出现。</p>
                        <p>编译算法，点击编译算法按钮会返回编译当前算法的结果（成功或者错误提示）。</p>
                        <p>发布算法，算法编译成功后发布按钮激活，发布后成功后的算法可以出现在用户可见的算法列表中。</p>
                        <p>编辑算法详情，算法发布后，算法作者可以到算法详情页面编辑算法的描述、输入示例、输入说明、分类、标签等信息。</p>
                      </p>
                      <p>
                      	<h3>6.关于数据集合 </h3>
                      	<p>
                      		当算法要求的输入输出的据量很大时，我们希望将数据上传给数据集合，返回的数据也返回到数据集合中，之后用户再到数据集合中下载数据文件。
                      	</p>
                      </p>
                      <p>
                        <h3>7.关于依赖jar包</h3>
                        若上传有jar包依赖的算法，在算法编辑页面点击添加算法按钮，上传要依赖的jar包，再编辑算法即可。
                      </p> -->
                      
                    </div>
                </div>

            </div>
        </div>
<jsp:include page="<%=M.j_tail%>" />
