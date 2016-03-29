<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="alg.base.service.*" %>
<%@ page language="java" import="alg.base.bean.*" %>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />

  <script>
$(function() {
	<%String type = request.getParameter("typename");%>
	var algType= <%=type%>;
	var url="TypeSearchAction";
	var param="algType="+algType;
	
	$.get(url,param,cuIndex_ready);
});
function cuIndex_ready(data) {
	var obj = eval('(' + data + ')');
	var currentIndex = obj.currentIndex;
	var totalpage = obj.totalPage;
	cu_index = currentIndex;
	total_pages =totalpage;
	var algsList = obj.cuArrAlgs;
	cuIndex_readyfp(algsList);
}
function cuIndex_readyfp(obj) {
	for ( var i = 0; i < obj.length; i++) {

	$('.algList').append(//当前页算法列表
			'<h3><a href="algoView.jsp?alg_id='+obj[i].algorithm_id+'" style="text-decoration:none">'
			+obj[i].algorithm_name+'</a><small> <a href="#">'
			+obj[i].user_name+'</a></small> <small>'+obj[i].vist_times+'人访问</small></h3>'
			+'<p>'+obj[i].algorithm_describe+'</p>'
	);
	}
	
	$('.fliper').html(//翻页按钮
			'<div class="fanye" style="margin:10px,20px">'
			+'<a href="javascript:void(0)"  onclick="preIndex()"> 上一页  </a>'
			+'<small> 第 '+cu_index+' 页 </small>'
			+'<a href="javascript:void(0)"  onclick="aftIndex()"> 下一页  </a></div>'
			
	);
}

function preIndex(){//上一页
	var index = cu_index;
	if(index<=1){index=1;}else{index=index-1;}
	$.post('TypeSearchAction',{currentIndex:index},callback_pre);
}
function callback_pre(data){
	var obj = eval('('+data+')');
	var algList = obj.cuArrAlgs;
	cu_index = obj.currentIndex;
	$('.algList').html('');
	for(var i=0;i<algList.length;i++){
		//替換掉原來的內容
		$('.algList').append(
				'<h3><a href="algoView.jsp?alg_id='+algList[i].algorithm_id+'" style="text-decoration:none">'
				+algList[i].algorithm_name+'</a><small> <a href="#">'
				+algList[i].user_name+'</a></small> <small>'+algList[i].vist_times+'人访问</small></h3>'
				+'<p>'+algList[i].algorithm_describe+'</p>'
				);
	}
	$('.fliper').html(//翻页按钮
			'<div class="fanye" style="margin:10px,20px">'
			+'<a href="javascript:void(0)"  onclick="preIndex()"> 上一页 </a>'
			+'<small>第 '+cu_index+' 页</small>'
			+'<a href="javascript:void(0)"  onclick="aftIndex()">下一页 </a></div>'
			
	);
}
function aftIndex(){
	var index = cu_index;
	var totalPage = total_pages;
	if(index>=totalPage){index=totalPage;}else{index=index+1;}
	$.post('TypeSearchAction',{currentIndex:index},callback_aft);
}
function callback_aft(data){
	var obj = eval('('+data+')');
	var algList = obj.cuArrAlgs;
	cu_index =  obj.currentIndex;
	$('.algList').html('');
	for(var i=0;i<algList.length;i++){
		//替換掉原來的內容
		$('.algList').append(
				'<h3><a href="algoView.jsp?alg_id='+algList[i].algorithm_id+'" style="text-decoration:none">'
				+algList[i].algorithm_name+'</a><small> <a href="#">'
				+algList[i].user_name+'</a></small> <small>'+algList[i].vist_times+'人访问</small></h3>'
				+'<p>'+algList[i].algorithm_describe+'</p>'
				);
	}
	$('.fliper').html(//翻页按钮
			'<div class="fanye" style="margin:10px,20px">'
			+'<a href="javascript:void(0)"  onclick="preIndex()"> 上一页 </a>'
			+'<small>第 '+cu_index+' 页</small>'
			+'<a href="javascript:void(0)"  onclick="aftIndex()">下一页 </a></div>'
			
	);
}


//搜索算法

function searchResult(){
	$('.algList').empty();
	<%String typeName = request.getParameter("typename");%>
	var algType= <%=typeName%>;
	var input = document.getElementById("searchKeywords");
	var searchAlgo = input.value;
	$.post('SearchAlgoInTypesAction', {'searchAlgo':searchAlgo,'algType':algType}, cuIndex_search);

}
var total_pages;
var cu_index;

function cuIndex_search(data) {
	var obj = eval('(' + data + ')');
	var currentIndex = obj.currentIndex;
	var totalpage = obj.totalPage;
	cu_index = currentIndex;
	total_pages =totalpage;
	//alert(total_pages);
	var algsList = obj.cuArrAlgs;
	cuIndex_readyView(algsList);
}

function cuIndex_readyView(obj) {
	for ( var i = 0; i < obj.length; i++) {
	$('.algList').append(//当前页算法列表
			'<h3><a href="algoView.jsp?alg_id='+obj[i].algorithm_id+'" style="text-decoration:none">'
			+obj[i].algorithm_name+'</a><small> <a href="#">'
			+obj[i].user_name+'</a></small> <small>'+obj[i].vist_times+'人访问</small></h3>'
			+'<p>'+obj[i].algorithm_describe+'</p>'
	);
	}
	
	$('.fliper').html(//翻页按钮
			'<div class="fanye" style="margin:10px,20px">'
			+'<a href="javascript:void(0)"  onclick="pre2Index()"> 上一页  </a>'
			+'<small> 第 '+cu_index+' 页 </small>'
			+'<a href="javascript:void(0)"  onclick="aft2Index()"> 下一页  </a></div>'
			
	);
}

function pre2Index(){//上一页
	var input = document.getElementById("searchKeywords");
	var searchAlgo = input.value;
	var index = cu_index;
	if(index<=1){index=1;}else{index=index-1;}
	//alert(searchAlgo);
	//alert(index);
	$.post('SearchAlgoInTypesAction',{'searchAlgo':searchAlgo,'currentIndex':index},callback_pre2);
}
function callback_pre2(data){
	var obj = eval('('+data+')');
	var algList = obj.cuArrAlgs;
	cu_index = obj.currentIndex;
	$('.algList').html('');
	for(var i=0;i<algList.length;i++){
		//替換掉原來的內容
		$('.algList').append(
				'<h3><a href="algoView.jsp?alg_id='+algList[i].algorithm_id+'" style="text-decoration:none">'
				+algList[i].algorithm_name+'</a><small> <a href="#">'
				+algList[i].user_name+'</a></small> <small>'+algList[i].vist_times+'人访问</small></h3>'
				+'<p>'+algList[i].algorithm_describe+'</p>'
				);
	}
	$('.fliper').html(//翻页按钮
			'<div class="fanye" style="margin:10px,20px">'
			+'<a href="javascript:void(0)"  onclick="pre2Index()"> 上一页 </a>'
			+'<small>第 '+cu_index+' 页</small>'
			+'<a href="javascript:void(0)"  onclick="aft2Index()">下一页 </a></div>'
			
	);
}

function aft2Index(){
	var input = document.getElementById("searchKeywords");
	var searchAlgo = input.value;
	//alert(searchAlgo);
	var index = cu_index;
	var totalPage = total_pages;
	//alert(totalPage);
	if(index>=totalPage){index=totalPage;}else{index=index+1;}
	$.post('SearchAlgoInTypesAction',{'searchAlgo':searchAlgo,'currentIndex':index},callback_aft2);
}

function callback_aft2(data){
	var obj = eval('('+data+')');
	var algList = obj.cuArrAlgs;
	cu_index =  obj.currentIndex;
	$('.algList').html('');
	for(var i=0;i<algList.length;i++){
		//替換掉原來的內容
		$('.algList').append(
				'<h3><a href="algoView.jsp?alg_id='+algList[i].algorithm_id+'" style="text-decoration:none">'
				+algList[i].algorithm_name+'</a><small> <a href="#">'
				+algList[i].user_name+'</a></small> <small>'+algList[i].vist_times+'人访问</small></h3>'
				+'<p>'+algList[i].algorithm_describe+'</p>'
				);
	}
	$('.fliper').html(//翻页按钮
			'<div class="fanye" style="margin:10px,20px">'
			+'<a href="javascript:void(0)"  onclick="pre2Index()"> 上一页 </a>'
			+'<small>第 '+cu_index+' 页</small>'
			+'<a href="javascript:void(0)"  onclick="aft2Index()">下一页 </a></div>'
			
	);
}
</script>

        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <!-- 搜索算法 -->
                    <div class="well">
                        <h2>搜索算法</h2>
                        <form role="form">
                            <div class="form-group">
                                <input type="search" class="form-control search " name="searchKeywords" value="输入算法关键字" id="searchKeywords"
                                onfocus="if (value =='输入算法关键字'){value =''}" onblur="if (value ==''){value='输入算法关键字'}">
                            </div>
                     
                        <input type="button" class="btn btn-primary" onclick="searchResult();"value="搜索">
                        </form>
                    </div>
                    <hr>
					<!-- 算法列表 -->
					<div class="algList"></div>
					<div class="fliper"></div>
                  
			<br>
			<hr>
                </div>
            </div>
        </div>
<jsp:include page="<%=M.j_tail%>" />