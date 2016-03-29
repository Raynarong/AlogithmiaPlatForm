<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="alg.base.service.*" %>
<%@ page import="alg.base.bean.*" %>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />


<script src="js/dropzone.js"></script>
<script type="text/javascript" src="console/jquery-2.1.1.min.js"></script>
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
.at_page_init{
	visibility: hidden;
}
.but_div{
	  text-align: right;
}

</style>
<script src="js/dropzone.js"></script>
<script>
/*	$("#dropz").dropzone({
	    addedfile: function() {
	        // actions...
	    }
	});*/
    $(function(){
    	$.post("showCollectionAction.action",
    		{},
    		showCollection
    	);
    	
    	function showCollection(data) {
    		var obj = eval('(' + data + ')');
    		$.each(obj, function(i, collections) {
    			$('#collections li:last').before('<li><a href="javascript:showFileTable(\'' + collections.collectionName + '\',\'' + collections.collectionid + '\');">' + collections.collectionName + '</a></li>');
    		});
    	}
    });
    
     function showFileTable(obj, id) {
    	var user_name = '<%= session.getAttribute("user") %>';
    	$('#introduction').remove();
    	$('.at_page_init').css('visibility','visible');
    	$('.panel-title').html('<i class="fa fa-bar-chart-o"></i> ' + user_name + '/' + obj);
    	$('.panel-title').attr('value', id);
    	$('.panel-title').attr('name', obj);
    	$.post("showFileListAction.action",
    		{"collectionName" : obj},
    		showTable
    	);
    	
    	function showTable(data) {
    		var obj = eval('(' + data + ')');
    		$('.sui-gridcontent tbody > tr').remove();
			$.each(obj, function(i, file) {
				$('.sui-gridcontent tbody').append('<tr class="sui-row"><td class="sui-cell">' + (i+1) + '</td>'
        			+ '<td class="sui-cell">'
        			+ '<a href="downloadFileAction.action?fileName='+ file.filename + '&collectionId='+ file.collectionid +'">' + file.filename + '</a></td>'
        			+ '<td class="sui-cell">' + file.url + '</td>'
        			+ '<td class="sui-cell">'
        			+ '<a href="javascript:deleteItem(\'' + file.filename + '\', \'' + file.collectionid + '\', ' + i + ');"><i class="icon iconfont">&#xe69d;</i></a></td></tr>');
			});
    	}
    }
    
    function deleteItem(name, collectionId, id) {
    	$.post("deleteFileAction.action",
    		{
    			"collectionId" : collectionId,
    			"fileFileName" : name
    		},
    		deleteItem_callback);
    		
    	function deleteItem_callback(data) {
    		/* var obj = eval('(' + data + ')');
    		alert(obj.fileFileName); */
    		//alert(id);
    		//$('.sui-gridcontent tbody tr:eq(' + id + ')').remove();
    		var c_name = $('.panel-title').attr('name');
    		var c_id = $('.panel-title').attr('value');
    		showFileTable(c_name, c_id);
    	}
    }
    

</script>
        <div class="container">
            <div class="row">
            <h2>数据集合</h2>
            <hr/>
                <div class="col-lg-3">
                	

                    <!-- 提问搜索和列表 -->
                    <div class="well">
                        <h3>我的数据集合</h3>
                        <ul id="collections">
                    		<!-- <li><a>第一个数据集合</a></li>
                    		<li><a>第二个数据集合</a></li> -->
                    		<li><a class="icon iconfont" data-toggle="modal" data-target="#squarespaceModal">&#xe6b9;添加数据集合</a></li>
                    	</ul>
                    	
                    </div>

                    <!-- 翻页 -->
                    <div class="fliper"></div>

                   
					<hr><br>
                </div>
                <div class="col-lg-9">
                	<div id="introduction" class="well dz-message needsclick">
                		数据集合让平台的数据添加和删除变得简单<br>
                	</div>
                 	<div id="myfile" class="well at_page_init">
	                 	<div class="panel panel-primary">
	                        <div class="panel-heading">
	                            <h3 class="panel-title" value="1234"><i class="fa fa-bar-chart-o"></i> 数据集合  </h3>
	                        </div>
	                        <div class="panel-body">
	                            <div id="shieldui-grid1" class="sui-grid sui-grid-core">
		                            <div class="sui-gridheader">
			                            <table class="sui-table sui-non-selectable">
			                            	<colgroup><col style="width:70px"><col><col><col style="width:270px"></colgroup>
			                            	<thead>
				                            	<tr class="sui-columnheader">
					                            	<th data-field="id" class="sui-headercell"><a href="#" class="sui-link">ID</a></th>
					                            	<th data-field="name" class="sui-headercell"><a href="#" class="sui-link">文件名</a></th>
					                            	<th data-field="company" class="sui-headercell"><a href="#" class="sui-link">路径</a></th>
					                            	<th data-field="email" class="sui-headercell"><a href="#" class="sui-link">操作</a></th>
					                            </tr>
			                            	</thead>
			                            	<tbody class="sui-hide">
			                            		<tr>
			                            			<td></td>
			                            			<td></td>
			                            			<td></td>
			                            			<td></td>
			                            		</tr>
			                            	</tbody>
			                            </table>
		                            </div>
		                            <div class="sui-gridcontent">
		                            	<table class="sui-table sui-hover sui-selectable">
		                            		<colgroup><col style="width:70px"><col><col><col style="width:270px"></colgroup>
		                            		<tbody id="content">
		                            			<!-- <tr class="sui-row"><td class="sui-cell">0</td><td class="sui-cell"><a href="javascript:void(0);">Sue Sharpe</a></td><td class="sui-cell">Mitroc</td><td class="sui-cell"><a><i class="icon iconfont">&#xe69d;</i></a></td></tr> -->
		                            		</tbody>
		                            	</table>
		                            </div>
	                           </div>
	                        </div>
	                    </div>
                 	</div>

                 	<!-- <form action="" method="post" enctype="multipart/form-data">
   						 <input type="file" name="file">
					</form> -->

                 	<div id="dropz" class="well at_page_init">
                 		拖拽文件到这里
                 		<form action="/" method="post" enctype="multipart/form-data" class="dropzone needsclick dz-clickable" id="demo_upload">
						  <div class="dz-message needsclick">
						    Drop files here or click to upload.<br>

						  </div><!--
						  
						  
						  <div class="dz-preview dz-file-preview dz-processing dz-success dz-complete">
						      <div class="dz-image"><img data-dz-thumbnail=""></div>
						
						      <div class="dz-details">
						        <div class="dz-size"><span data-dz-size=""><strong>39</strong> b</span></div>
						        <div class="dz-filename"><span data-dz-name="">新建文本文档 (2).txt</span></div>
						      </div>
						      <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress="" style="width: 100%;"></span></div>
						      <div class="dz-error-message"><span data-dz-errormessage=""></span></div>
						
						
						
						      <div class="dz-success-mark">
						
						        <svg width="54px" height="54px" viewBox="0 0 54 54" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">
						           Generator: Sketch 3.2.1 (9971) - http://www.bohemiancoding.com/sketch 
						          <title>Check</title>
						          <desc>Created with Sketch.</desc>
						          <defs></defs>
						          <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" sketch:type="MSPage">
						              <path d="M23.5,31.8431458 L17.5852419,25.9283877 C16.0248253,24.3679711 13.4910294,24.366835 11.9289322,25.9289322 C10.3700136,27.4878508 10.3665912,30.0234455 11.9283877,31.5852419 L20.4147581,40.0716123 C20.5133999,40.1702541 20.6159315,40.2626649 20.7218615,40.3488435 C22.2835669,41.8725651 24.794234,41.8626202 26.3461564,40.3106978 L43.3106978,23.3461564 C44.8771021,21.7797521 44.8758057,19.2483887 43.3137085,17.6862915 C41.7547899,16.1273729 39.2176035,16.1255422 37.6538436,17.6893022 L23.5,31.8431458 Z M27,53 C41.3594035,53 53,41.3594035 53,27 C53,12.6405965 41.3594035,1 27,1 C12.6405965,1 1,12.6405965 1,27 C1,41.3594035 12.6405965,53 27,53 Z" id="Oval-2" stroke-opacity="0.198794158" stroke="#747474" fill-opacity="0.816519475" fill="#FFFFFF" sketch:type="MSShapeGroup"></path>
						          </g>
						        </svg>
						      
						      </div>
						      <div class="dz-error-mark">
						
						        <svg width="54px" height="54px" viewBox="0 0 54 54" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">
						             Generator: Sketch 3.2.1 (9971) - http://www.bohemiancoding.com/sketch 
						            <title>error</title>
						            <desc>Created with Sketch.</desc>
						            <defs></defs>
						            <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" sketch:type="MSPage">
						                <g id="Check-+-Oval-2" sketch:type="MSLayerGroup" stroke="#747474" stroke-opacity="0.198794158" fill="#FFFFFF" fill-opacity="0.816519475">
						                    <path d="M32.6568542,29 L38.3106978,23.3461564 C39.8771021,21.7797521 39.8758057,19.2483887 38.3137085,17.6862915 C36.7547899,16.1273729 34.2176035,16.1255422 32.6538436,17.6893022 L27,23.3431458 L21.3461564,17.6893022 C19.7823965,16.1255422 17.2452101,16.1273729 15.6862915,17.6862915 C14.1241943,19.2483887 14.1228979,21.7797521 15.6893022,23.3461564 L21.3431458,29 L15.6893022,34.6538436 C14.1228979,36.2202479 14.1241943,38.7516113 15.6862915,40.3137085 C17.2452101,41.8726271 19.7823965,41.8744578 21.3461564,40.3106978 L27,34.6568542 L32.6538436,40.3106978 C34.2176035,41.8744578 36.7547899,41.8726271 38.3137085,40.3137085 C39.8758057,38.7516113 39.8771021,36.2202479 38.3106978,34.6538436 L32.6568542,29 Z M27,53 C41.3594035,53 53,41.3594035 53,27 C53,12.6405965 41.3594035,1 27,1 C12.6405965,1 1,12.6405965 1,27 C1,41.3594035 12.6405965,53 27,53 Z" id="Oval-2" sketch:type="MSShapeGroup"></path>
						                </g>
						            </g>
						        </svg>
						
						      </div>
						
						
						    </div>
						--></form>
                 	</div>
                 	<div class="but_div at_page_init">
                 		<button type="button" class="btn btn-primary right-block" data-toggle="modal" data-target="#deleteCollectionModal">删除集合</button>
                 	</div>
                </div>
            </div>
        </div>
<div class="modal fade alert" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <h3 class="modal-title" id="lineModalLabel">添加数据集合</h3>
        </div>
        <div class="modal-body">
            <!-- <form id=""> -->
              <div class="form-group">
                <label for="exampleInputEmail1">集合名称</label>
                <input type="text" class="form-control colName" id="collectionName" placeholder="Enter name">
              </div>
              
              <button type="button" class="btn btn-primary center-block" data-dismiss="modal" onclick="submit_collection();">提交</button>
              <button type="button" class="btn btn-primary center-block" data-dismiss="modal">取消</button>
           <!-- </form> -->
        </div>
    </div>
  </div>
</div>

<div class="modal fade alert" id="deleteCollectionModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <h3 class="modal-title" id="lineModalLabel">警告</h3>
        </div>
        <div class="modal-body">
            <!-- <form id=""> -->
              <div class="form-group">
                <label for="exampleInputEmail1">删除数据集合将删除集合中的所有文件，是否继续</label>
              </div>
              
              <button type="button" class="btn btn-primary center-block" data-dismiss="modal" onclick="submit_deleteCollection();">确定</button>
              <button type="button" class="btn btn-primary center-block" data-dismiss="modal">取消</button>
           <!-- </form> -->
        </div>
    </div>
  </div>
</div>
<script>

	function submit_deleteCollection() {
		var collectionId = $('.panel-title').attr('value');
		var collectionName = $('.panel-title').attr('name');
		$.post("deleteCollectionAction.action",
			{
				"collectionId" : collectionId,
				"collectionName" : collectionName
			},
			deleteCollection_callback);
			
		function deleteCollection_callback(data) {
			location.reload();
		}
	}
	
	function submit_collection() {
		var collectionName = $('#collectionName').val();
 		$.post("addCollectionAction.action",
			{"collectionName" : collectionName},
			addCollectionName_callback
		);
		function addCollectionName_callback(data) {
			var collection = eval('(' + data + ')');
			if(collection.flag == "success")
			{
				$('#collections li:last').before('<li><a href="javascript:showFileTable(\'' + collection.collectionName + '\',\'' + collection.collectionId + '\');">' + collection.collectionName + '</a></li>');
			}
		}
		return false;
	}
	
	$("#demo_upload").dropzone({
        url: "uploadFileAction.action",
        maxFiles: 10,
        maxFilesize: 512,
        acceptedFiles: ".js,.obj,.dae,.txt",
        init: function(){
        	this.on("success", function(file, data) {
        		//alert(data);
        		var obj = eval('(' + data + ')');
        		//alert(obj.url + '\n' + obj.collectionName + '\n' + obj.collectionId + '\n' + obj.flag);
        		if("true" == obj.flag)
        		{
	        		var i = $('.sui-gridcontent tbody > tr').length;
	        	 	$('.sui-gridcontent tbody').append('<tr class="sui-row"><td class="sui-cell">' + (i+1) + '</td>'
        			+ '<td class="sui-cell">'
        			+ '<a href="downloadFileAction.action?fileName='+ file.name + '&collectionId='+ obj.collectionId +'">' + file.name + '</a></td>'
        			+ '<td class="sui-cell">' + obj.url + '</td>'
        			+ '<td class="sui-cell">'
        			+ '<a><i class="icon iconfont">&#xe69d;</i></a></td></tr>');
        		
       			}
        	});
        	this.on("error", function(file) {
                alert("文件上传失败！");
            });
            this.on("sending", function(file, xhr, formData) {
            	var collectionId = $('.panel-title').attr('value');
            	var collectionName = $('.panel-title').attr('name');
            	formData.append("collectionId", collectionId);
            	formData.append("collectionName", collectionName);
            });
        }
	});
	
</script>
<jsp:include page="<%=M.j_tail%>" />
