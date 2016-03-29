<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="alg.base.service.*" %>
<%@ page language="java" import="alg.base.bean.*" %>
<%@ page language="java" import="alg.base.action.*" %>


<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />
 	
<link rel="stylesheet" href="css/font/iconfont.css">
<link rel="stylesheet" type="text/css" href="resources/css/mese.css">
<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
<style>

        div {
            padding-bottom:20px;
        }
        
        .btn_a {
        	  padding: 3px;
  			  background-color: #F0F0F0;
              margin: 0 4px;
              border: 1px solid #EEE5DE;
        }
        .modal-content{
        	  width: 80%;
        }
        .type-input{
        	  width: 100%;
        }
        .type-add{
        	  float: right;
        }

</style> 
<script>
	

</script>
	

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			 <h1>管理员中心</h1>
			 <hr/>
			 
			 <div class="row">
                
                <div class="bs-example col-lg-12">
				<ul class="nav nav-tabs" style="margin-bottom: 15px;"
					id="nav_tabs_1">
					<li class="active"><a href="#home" data-toggle="tab">日志管理</a>
					</li>
					<li><a href="#typeList" data-toggle="tab">分类管理</a>
					</li>
					<li><a href="#admin-aboutus" data-toggle="tab">关于我们</a>
					</li>
				</ul>
				<div id="myTabContent" class="tab-content col-lg-12">
					<div class="tab-pane fade active in" id="home">
					
					
					<div class="panel-body">
                    	<div id="shieldui-grid1" class="sui-grid sui-grid-core">
                        	<div class="sui-gridheader">
                        		<table class="sui-table sui-non-selectable">
                        		<colgroup><col style="width:70px"><col><col><col style="width:270px"></colgroup>
                        		<thead><tr class="sui-columnheader">
                        			<th data-field="id" class="sui-headercell"><a href="#" class="sui-link">ID</a></th>
                        			<th data-field="name" class="sui-headercell"><a href="#" class="sui-link">Person Name</a></th>
                        			<th data-field="company" class="sui-headercell"><a href="#" class="sui-link">Company Name</a></th>
                        			<th data-field="email" class="sui-headercell"><a href="#" class="sui-link">Email Address</a></th>
                        		</tr></thead>
                        		<tbody class="sui-hide"><tr><td></td><td></td><td></td><td></td></tr></tbody>
                        		</table>
                        	</div>
                        	<div class="sui-gridcontent">
	                        	<table class="sui-table sui-hover sui-selectable">
		                        	<colgroup><col style="width:70px"><col><col><col style="width:270px"></colgroup>
		                        	<tbody>
			                        	<tr class="sui-row"><td class="sui-cell">0</td><td class="sui-cell">Sue Sharpe</td><td class="sui-cell">Mitroc</td><td class="sui-cell">suesharpe@mitroc.com</td></tr>
			                        	<tr class="sui-alt-row"><td class="sui-cell">1</td><td class="sui-cell">Nieves Hubbard</td><td class="sui-cell">Syntac</td><td class="sui-cell">nieveshubbard@syntac.com</td></tr>
			                        	<tr class="sui-row"><td class="sui-cell">2</td><td class="sui-cell">Anastasia Underwood</td><td class="sui-cell">Gallaxia</td><td class="sui-cell">anastasiaunderwood@gallaxia.com</td></tr>
			                        	<tr class="sui-alt-row"><td class="sui-cell">3</td><td class="sui-cell">Maxine Haley</td><td class="sui-cell">Songbird</td><td class="sui-cell">maxinehaley@songbird.com</td></tr>
			                        	<tr class="sui-row"><td class="sui-cell">4</td><td class="sui-cell">Bennett Alvarez</td><td class="sui-cell">Marvane</td><td class="sui-cell">bennettalvarez@marvane.com</td></tr>
			                        	<tr class="sui-alt-row"><td class="sui-cell">5</td><td class="sui-cell">Myrna Ellison</td><td class="sui-cell">Zoxy</td><td class="sui-cell">myrnaellison@zoxy.com</td></tr>
			                        	<tr class="sui-row"><td class="sui-cell">6</td><td class="sui-cell">Karyn Day</td><td class="sui-cell">Apex</td><td class="sui-cell">karynday@apex.com</td></tr>
		                        	</tbody>
	                        	</table>
                        	</div>
                        	<div class="sui-pager sui-pager-core">
	                        	<ul class="sui-pagination">
		                        	<li class="sui-pager-element sui-disabled"><a title="Go to the first page" data-page="1" class="sui-first">«</a></li>
		                        	<li class="sui-pager-element sui-disabled"><a title="Go to the previous page" data-page="0" class="sui-prev">‹</a></li>
		                        	<li class="sui-pager-element"><a data-page="1" class="sui-pager-number sui-selected">1</a></li>
		                        	<li class="sui-pager-element"><a data-page="2" class="sui-pager-number">2</a></li>
		                        	<li class="sui-pager-element"><a data-page="3" class="sui-pager-number">3</a></li>
		                        	<li class="sui-pager-element"><a data-page="4" class="sui-pager-number">4</a></li>
		                        	<li class="sui-pager-element"><a data-page="5">...</a></li>
		                        	<li class="sui-pager-element"><a title="Go to the next page" data-page="2" class="sui-next">›</a></li>
		                        	<li class="sui-pager-element"><a title="Go to the last page" data-page="70" class="sui-last">»</a></li>
	                        	</ul>
	                        	<div class="sui-pager-info-box">1 - 7 of 486 items</div>
                        	</div>
                        </div>Demo Version<a href="http://www.shieldui.com" target="_blank" style="color: rgb(128, 128, 128); text-decoration: none;"> by ShieldUI</a>
                    </div>
					
					
					
					

            		</div>	
					<div class="tab-pane fade" id="typeList"><!--
						<div class="algList"></div>
						<div class="fliper"></div>
                   		<div class="col-lg-6" style="height:800px;positon:relative">
            
            			<div class="alg_fliper"></div>
          				</div>
          				
					-->
					
					<div class="panel-body">
                    	<div id="shieldui-grid1" class="sui-grid sui-grid-core">
                        	<div class="sui-gridheader">
                        		<table class="sui-table sui-non-selectable">
                        		<colgroup><col style="width:70px"><col><col></colgroup>
                        		<thead><tr class="sui-columnheader">
                        			<th data-field="id" class="sui-headercell"><a href="#" class="sui-link">ID</a></th>
                        			<th data-field="name" class="sui-headercell"><a href="#" class="sui-link">分类名</a></th>
                        			<th data-field="company" class="sui-headercell"><a href="#" class="sui-link">操作</a></th>
                        	
                        		</tr></thead>
                        		<tbody class="sui-hide"><tr><td></td><td></td><td></td></tr></tbody>
                        		</table>
                        	</div>
                        	<div class="sui-gridcontent">
	                        	<table class="sui-table sui-hover sui-selectable">
		                        	<colgroup><col style="width:70px"><col><col></colgroup>
		                        	<tbody id="type-tbody">
			                        	 <%-- <tr class="sui-row">
			                        		<td class="sui-cell">0</td>
			                        		<td class="sui-cell">hahah算法</td>
			                        		<td class="sui-cell"><a class="btn_a btn" data-toggle="modal" data-target="#squarespaceModal" class="btn btn-primary center-block" onclick="edit()"><span class="icon iconfont" >&#xe69e;</span>修改</a><a class="btn_a btn" onclick=""><span class="icon iconfont" >&#xe69a;</span>删除</a></td>
			                        	</tr> --%> 
		                        	</tbody>
	                        	</table>
                        	</div>
							<div class="sui-pager sui-pager-core">
	                        	<ul class="sui-pagination type-changepage">
		                        	<li class="sui-pager-element sui-disabled"><a title="Go to the first page" data-page="1" class="sui-first" href="javascript:void(0)" onclick="firstIndex_type()">«</a></li>
		                        	<li class="sui-pager-element sui-disabled"><a title="Go to the previous page" data-page="0" class="sui-prev" href="javascript:void(0)" onclick="preIndex_type()">‹</a></li>
		                        	<li class="sui-pager-element"><a data-page="1" class="sui-pager-number sui-selected" href="javascript:void(0)" onclick="clickIndex_type(1)">1</a></li>
		                        	<li class="sui-pager-element"><a data-page="2" class="sui-pager-number" href="javascript:void(0)" onclick="clickIndex_type(2)">2</a></li>
		                        	<li class="sui-pager-element"><a data-page="3" class="sui-pager-number" href="javascript:void(0)" onclick="clickIndex_type(3)">3</a></li>
		                        	<li class="sui-pager-element"><a title="Go to the next page" data-page="2" class="sui-next" href="javascript:void(0)"  onclick="aftIndex_type()">›</a></li>
		                        	<li class="sui-pager-element"><a title="Go to the last page" data-page="70" class="sui-last" href="javascript:void(0)" onclick="lastIndex_type()">»</a></li>
	                        	</ul>
                        	</div>
                    </div>
                    <br/>
					<button class="btn btn-primary center-block type-add" data-toggle="modal" data-target="#squarespaceModal">添加分类</button>
					
					</div>
					</div>
					
					<div class="tab-pane fade" id="admin-aboutus" >
						<!--悬赏列表-->
						<div class="panel-body">
							<a href="aboutus.jsp">去往关于我们编辑页面：</a>
						</div>       
					</div><!--
					
					<div class="tab-pane fade" id="credits" >
						 <div class="row">
               				 <div class="col-lg-11">
                    			<div >
                        			<div class="panel-body">
                            			<div id="shieldui-grid1"></div>
                        			</div>
                    			</div>
                			</div>
						</div>
	
					</div>
					<div class="tab-pane fade" id="tradeRecord" >
						<div class="row">
               				 <div class="col-lg-11">
                    			<div >
                        			<div class="panel-body">
                            			<div id="shieldui-grid2"></div>
                        			</div>
                    			</div>
                			</div>
						</div>
					</div>
				--></div>
				<hr>
                
            </div>
		</div>
	</div>
</div>
<div class="modal fade alert" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <h3 class="modal-title" id="lineModalLabel">添加分类</h3>
        </div>
        <div class="modal-body">
            <form>
              <div>
                <label for="exampleInputEmail1">分类名</label>
                <input type="text" class="form-control type-input" id="type_text">
              </div>
              <button type="button" class="btn btn-primary center-block" data-dismiss="modal" onclick="addType()">提交</button>
            </form>
        </div>
    </div>
  </div>
</div>

<div class="modal fade alert" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <h3 class="modal-title" id="lineModalLabel">修改分类</h3>
        </div>
        <div class="modal-body">
            <form>
              <div>
              	<input id="typeId" style="visibility: hidden"/>
                <label for="exampleInputEmail1">分类名</label>
                <input type="text" class="form-control type-input" id="modityType_text">
              </div>
              <button type="button" class="btn btn-primary center-block" data-dismiss="modal" onclick="modifyType()">提交</button>
            </form>
        </div>
    </div>
  </div>
</div>
<style>
div {
	padding-bottom: 0;
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
</style>
<script type="text/javascript">
	$(function() {
		$.post("getTypeListAction.action",{},type_callback);
	});
	
	var totalPages;
	var cu_index;
	
	function type_callback(data) {
		var obj=eval('('+data+')');
		var currentIndex = obj.currentIndex;
		var totalPage = obj.totalPage;
		cu_index = currentIndex;
		totalPages = totalPage;
		var typeList = obj.currentList;
		cuIndex_readyfp_a(typeList);
		
		if(totalPages == 2)
		{
			$('.type-changepage li').eq(4).html('');
		}
		if(totalPages == 1)
		{
			$('.type-changepage li').eq(3).html('');
			$('.type-changepage li').eq(4).html('');
			$('.type-changepage li').eq(0).addClass('sui-disabled');
			$('.type-changepage li').eq(1).addClass('sui-disabled');
			$('.type-changepage li').eq(5).addClass('sui-disabled');
			$('.type-changepage li').eq(6).addClass('sui-disabled');
		}
	}
	
	function cuIndex_readyfp_a(obj) {
		$('#type-tbody').html('');
		for(var i = 0; i < obj.length; i++) {
			$('#type-tbody').append('<tr class="sui-row">'
			                        + '<td class="sui-cell">' + (i+1) + '</td>'
			                        + '<td class="sui-cell">' + obj[i].type_name + '</td>'
			                        + '<td class="sui-cell">'
			                        + '<a class="btn_a btn" data-toggle="modal" data-target="#modifyModal" class="btn btn-primary center-block" onclick="editType('+ obj[i].type_id +',\'' + obj[i].type_name + '\')"><span class="icon iconfont" >&#xe69e;</span>修改</a>'
			                        + '<a class="btn_a btn" onclick="deleteType(' + obj[i].type_id + ')"><span class="icon iconfont" >&#xe69a;</span>删除</a>'
			                        + '</td>'
			                        + '</tr>'
            );
		}
		//$('.type-changepage').html('');
		/* $('.type-changepage').append('<li class="sui-pager-element sui-disabled"><a title="Go to the first page" data-page="1" class="sui-first">«</a></li>'
		                        	+ '<li class="sui-pager-element sui-disabled"><a title="Go to the previous page" data-page="0" class="sui-prev">‹</a></li>'
		                        	+ '<li class="sui-pager-element"><a data-page="'+ cu_index +'" class="sui-pager-number sui-selected">1</a></li>'
		                        	+ '<li class="sui-pager-element"><a title="Go to the next page" data-page="2" class="sui-next" href="javascript:void(0)"  onclick="aftIndex_type()">›</a></li>'
		                        	+ '<li class="sui-pager-element"><a title="Go to the last page" data-page="70" class="sui-last">»</a></li>' */
       	//);
	}
	
	function aftIndex_type() {
		var index = cu_index;
		if(index < totalPages) {
			index = index + 1;
		}
		else {
			index = totalPages;
		}
		if(totalPages > 2)
		{
			if(index == 1)
			{
				$('.type-changepage li').eq(2).html('');
				$('.type-changepage li').eq(2).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
				$('.type-changepage li').eq(3).html('');
				$('.type-changepage li').eq(3).append('<a data-page="'+ (index + 1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index+1) + ')">' + (index+1) + '</a></li>');
				$('.type-changepage li').eq(4).html('');
				$('.type-changepage li').eq(4).append('<a data-page="'+ (index + 1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index+2) + ')">' + (index+2) + '</a></li>');
			
			}
			if(index > 1 && index < totalPages)
			{
				$('.type-changepage li').eq(2).html('');
				$('.type-changepage li').eq(2).append('<a data-page="'+ (index-1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-1) + ')">' + (index-1) + '</a></li>');
				$('.type-changepage li').eq(3).html('');
				$('.type-changepage li').eq(3).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
				$('.type-changepage li').eq(4).html('');
				$('.type-changepage li').eq(4).append('<a data-page="'+ (index + 1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index + 1) + ')">' + (index + 1) + '</a></li>');
			}
			if(index == totalPages)
			{
				$('.type-changepage li').eq(2).html('');
				$('.type-changepage li').eq(2).append('<a data-page="'+ (index-2) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-2) + ')">' + (index-2) + '</a></li>');
				$('.type-changepage li').eq(3).html('');
				$('.type-changepage li').eq(3).append('<a data-page="'+ (index-1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-1) + ')">' + (index-1) + '</a></li>');
				$('.type-changepage li').eq(4).html('');
				$('.type-changepage li').eq(4).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
			}
		}
		else if(totalPages == 2)
		{
			$('.type-changepage li').eq(2).html('');
			$('.type-changepage li').eq(3).html('');
			$('.type-changepage li').eq(2).append('<a data-page="'+ (index-1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-1) + ')">' + (index-1) + '</a></li>');
			$('.type-changepage li').eq(3).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
		}
		if(index == totalPages) {
			$('.type-changepage li').eq(5).addClass('sui-disabled');
			$('.type-changepage li').eq(6).addClass('sui-disabled');
		}
		if(index != 1) {
			$('.type-changepage li').eq(0).removeClass('sui-disabled');
			$('.type-changepage li').eq(1).removeClass('sui-disabled');
		}
		
		$.post("getTypeListAction.action",{'currentIndex' : index},type_callback);
	}
	
	function preIndex_type() {
		var index = cu_index;
		if(totalPages == 1)
			return;
		if(index > 1) {
			index = index - 1;
		}
		else {
			index = 1;
		}
		if(index == 1)
		{
			$('.type-changepage li').eq(2).html('');
			$('.type-changepage li').eq(2).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
			$('.type-changepage li').eq(3).html('');
			$('.type-changepage li').eq(3).append('<a data-page="'+ (index + 1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index+1) + ')">' + (index+1) + '</a></li>');
			$('.type-changepage li').eq(4).html('');
			$('.type-changepage li').eq(4).append('<a data-page="'+ (index + 1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index+2) + ')">' + (index+2) + '</a></li>');
		
		}
		if(index > 1 && index < totalPages)
		{
			$('.type-changepage li').eq(2).html('');
			$('.type-changepage li').eq(2).append('<a data-page="'+ (index-1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-1) + ')">' + (index-1) + '</a></li>');
			$('.type-changepage li').eq(3).html('');
			$('.type-changepage li').eq(3).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
			$('.type-changepage li').eq(4).html('');
			$('.type-changepage li').eq(4).append('<a data-page="'+ (index + 1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index + 1) + ')">' + (index + 1) + '</a></li>');
		}
		if(index == totalPages)
		{
			$('.type-changepage li').eq(2).html('');
			$('.type-changepage li').eq(2).append('<a data-page="'+ (index-2) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-2) + ')">' + (index-2) + '</a></li>');
			$('.type-changepage li').eq(3).html('');
			$('.type-changepage li').eq(3).append('<a data-page="'+ (index-1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-1) + ')">' + (index-1) + '</a></li>');
			$('.type-changepage li').eq(4).html('');
			$('.type-changepage li').eq(4).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
		}
		if(index == 1) {
			$('.type-changepage li').eq(0).addClass('sui-disabled');
			$('.type-changepage li').eq(1).addClass('sui-disabled');
		}
		if(index != totalPages) {
			$('.type-changepage li').eq(5).removeClass('sui-disabled');
			$('.type-changepage li').eq(6).removeClass('sui-disabled');
		}
		
		$.post("getTypeListAction.action",{'currentIndex' : index},type_callback);
	}
	
	function lastIndex_type() {
		var index = totalPages;
		if(totalPages > 2)
		{
			$('.type-changepage li').eq(2).html('');
			$('.type-changepage li').eq(2).append('<a data-page="'+ (index-2) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-2) + ')">' + (index-2) + '</a></li>');
			$('.type-changepage li').eq(3).html('');
			$('.type-changepage li').eq(3).append('<a data-page="'+ (index-1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-1) + ')">' + (index-1) + '</a></li>');
			$('.type-changepage li').eq(4).html('');
			$('.type-changepage li').eq(4).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
			$('.type-changepage li').eq(5).addClass('sui-disabled');
			$('.type-changepage li').eq(6).addClass('sui-disabled');
			$('.type-changepage li').eq(0).removeClass('sui-disabled');
			$('.type-changepage li').eq(1).removeClass('sui-disabled');
		}
		
		$.post("getTypeListAction.action",{'currentIndex' : index},type_callback);
	}
	
	function firstIndex_type() {
		var index = 1;
		if(totalPages > 2)
		{
			$('.type-changepage li').eq(2).html('');
			$('.type-changepage li').eq(2).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
			$('.type-changepage li').eq(3).html('');
			$('.type-changepage li').eq(3).append('<a data-page="'+ (index + 1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index+1) + ')">' + (index+1) + '</a></li>');
			$('.type-changepage li').eq(4).html('');
			$('.type-changepage li').eq(4).append('<a data-page="'+ (index + 1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index+2) + ')">' + (index+2) + '</a></li>');
			$('.type-changepage li').eq(5).removeClass('sui-disabled');
			$('.type-changepage li').eq(6).removeClass('sui-disabled');
			$('.type-changepage li').eq(0).addClass('sui-disabled');
			$('.type-changepage li').eq(1).addClass('sui-disabled');
		}
		
		$.post("getTypeListAction.action",{'currentIndex' : index},type_callback);
	}
	
	function clickIndex_type(index) {
		if(index > totalPages)
			return;
		if(totalPages > 2)
		{
			if(index == 1)
			{
				$('.type-changepage li').eq(2).html('');
				$('.type-changepage li').eq(2).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
				$('.type-changepage li').eq(3).html('');
				$('.type-changepage li').eq(3).append('<a data-page="'+ (index + 1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index+1) + ')">' + (index+1) + '</a></li>');
				$('.type-changepage li').eq(4).html('');
				$('.type-changepage li').eq(4).append('<a data-page="'+ (index + 1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index+2) + ')">' + (index+2) + '</a></li>');
				$('.type-changepage li').eq(5).removeClass('sui-disabled');
				$('.type-changepage li').eq(6).removeClass('sui-disabled');
				$('.type-changepage li').eq(0).addClass('sui-disabled');
				$('.type-changepage li').eq(1).addClass('sui-disabled');
			}
			if(index > 1 && index < totalPages)
			{
				$('.type-changepage li').eq(2).html('');
				$('.type-changepage li').eq(2).append('<a data-page="'+ (index-1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-1) + ')">' + (index-1) + '</a></li>');
				$('.type-changepage li').eq(3).html('');
				$('.type-changepage li').eq(3).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
				$('.type-changepage li').eq(4).html('');
				$('.type-changepage li').eq(4).append('<a data-page="'+ (index + 1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index + 1) + ')">' + (index + 1) + '</a></li>');
				$('.type-changepage li').eq(5).removeClass('sui-disabled');
				$('.type-changepage li').eq(6).removeClass('sui-disabled');
				$('.type-changepage li').eq(0).removeClass('sui-disabled');
				$('.type-changepage li').eq(1).removeClass('sui-disabled');
			}
			if(index == totalPages)
			{
				$('.type-changepage li').eq(2).html('');
				$('.type-changepage li').eq(2).append('<a data-page="'+ (index-2) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-2) + ')">' + (index-2) + '</a></li>');
				$('.type-changepage li').eq(3).html('');
				$('.type-changepage li').eq(3).append('<a data-page="'+ (index-1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-1) + ')">' + (index-1) + '</a></li>');
				$('.type-changepage li').eq(4).html('');
				$('.type-changepage li').eq(4).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
				$('.type-changepage li').eq(5).addClass('sui-disabled');
				$('.type-changepage li').eq(6).addClass('sui-disabled');
				$('.type-changepage li').eq(0).removeClass('sui-disabled');
				$('.type-changepage li').eq(1).removeClass('sui-disabled');
			}
		}
		else if(totalPages == 2)
		{
			$('.type-changepage li').eq(2).html('');
			$('.type-changepage li').eq(3).html('');
			if(index == 1)
			{
				$('.type-changepage li').eq(2).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
				$('.type-changepage li').eq(3).append('<a data-page="'+ (index+1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index+1) + ')">' + (index+1) + '</a></li>');
				$('.type-changepage li').eq(5).removeClass('sui-disabled');
				$('.type-changepage li').eq(6).removeClass('sui-disabled');
				$('.type-changepage li').eq(0).addClass('sui-disabled');
				$('.type-changepage li').eq(1).addClass('sui-disabled');
			}
			else
			{
				$('.type-changepage li').eq(2).append('<a data-page="'+ (index-1) +'" class="sui-pager-number" href="javascripe:void(0)" onclick="clickIndex_type(' + (index-1) + ')">' + (index-1) + '</a></li>');
				$('.type-changepage li').eq(3).append('<a data-page="'+ index +'" class="sui-pager-number sui-selected" href="javascripe:void(0)" onclick="clickIndex_type(' + index + ')">' + index + '</a></li>');
				$('.type-changepage li').eq(5).addClass('sui-disabled');
				$('.type-changepage li').eq(6).addClass('sui-disabled');
				$('.type-changepage li').eq(0).removeClass('sui-disabled');
				$('.type-changepage li').eq(1).removeClass('sui-disabled');
			}
		}
		
		$.post("getTypeListAction.action",{'currentIndex' : index},type_callback);
	}
	
	function addType() {
		var type_name = $('#type_text').val();
		$.post("addTypeAction.action",{'type_name' : type_name},addType_callback);
	}
	
	function addType_callback(data) {
		if($.trim(data) == 'success')
		{
			$.messager.show({
					title: 'Message',
					msg: '类型添加成功',
					timeout: 3000,
					showType: 'show'
			});
		}
	}
	
	function modifyType() {
		var type_id = $('#typeId').val();
		var type_name = $('#modityType_text').val();
		
		$.post("modifyTypeAction.action", {'type_id' : type_id, 'type_name' : type_name}, modifyType_callback);
	}
	
	function modifyType_callback(data) {
		if($.trim(data) == 'success')
		{
			clickIndex_type(cu_index);
			$.messager.show({
					title: 'Message',
					msg: '类型修改成功',
					timeout: 3000,
					showType: 'show'
			});
		}
	}	
	
	function deleteType(type_id) {
		//alert(type_name);
		$.post("deleteTypeAction.action", {'type_id' : type_id}, deleteType_callback);
	}
	
	function deleteType_callbak(data) {
		if($.trim(data) == "success")
		{
			clickIndex_type(cu_index);
			$.messager.show({
					title: 'Message',
					msg: '类型删除成功',
					timeout: 3000,
					showType: 'show'
			});
		}
	}
	
	function editType(typeid, typename){
		$('#typeId').val(typeid);
		$('#modityType_text').val(typename);
	}
</script>
<jsp:include page="<%=M.j_tail%>" />
