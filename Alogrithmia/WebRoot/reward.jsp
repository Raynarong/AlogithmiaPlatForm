<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="alg.base.service.*" %>
<%@ page import="alg.base.bean.*" %>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />


  <script >
  $(function() {
		$.post('bonusActionFetch_j', {}, cuIndex_ready);

	});

	var total_pages;
	var cu_index;

	function cuIndex_ready(data) {
		var obj = eval('(' + data + ')');
		var currentIndex = obj.currentIndex;
		var totalpage = obj.totalPage;
		cu_index = currentIndex;
		total_pages =totalpage;
		var bonusList = obj.cuArrBs;
		cuIndex_readyfp(bonusList);
	}
	function cuIndex_readyfp(obj) {
		for ( var i = 0; i < obj.length; i++) {
		$('.bonusList').append(//当前页算法列表
				 '<hr>'
				 +' <h4><a href="rewardView.jsp?bonus_id='+obj[i].bonus_id+'" style="text-decoration:none">'+obj[i].bonus_title+'</a>'
				 +' <small>requested by &nbsp&nbsp<a href="userCenter.jsp?username='+obj[i].user_name+'">'+ obj[i].user_name+'</a></small>&nbsp&nbsp'
				 +'<small> ￥'+obj[i].bonus_pride+'</small>&nbsp&nbsp '
				 +'<small>'+obj[i].bonus_time+'</small> '
				 +'</h4>'+'<p>'+obj[i].bonus_instruction+'</p>'
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
		$.post('bonusActionFetch_j',{'currentIndex':index},callback_pre);
	}
	
	function callback_pre(data){
		var obj = eval('('+data+')');
		var BsList = obj.cuArrBs;
		cu_index = obj.currentIndex;
		$('.bonusList').html('');
		for(var i=0;i<BsList.length;i++){
		alert(BsListp[i].bonus_time);
			//替換掉原來的內容
			$('.bonusList').append(
					 '<hr>'
					 +' <h4><a href="rewardView.jsp?bonus_id='+BsList[i].bonus_id+'" style="text-decoration:none">'+BsList[i].bonus_title+'</a>'
					 +' <small><a href="userCenter.jsp?username='+BsList[i].user_name+'">requested by &nbsp&nbsp&nbsp&nbsp'+ BsList[i].user_name+'</a></small>&nbsp&nbsp&nbsp&nbsp'
					 +'<small>￥'+BsList[i].bonus_pride+'</small> &nbsp&nbsp&nbsp&nbsp'
					 +'<small>'+BsList[i].bonus_time+'</small>'
					 +'</h4>'+'<p>'+BsList[i].bonus_instruction+'</p>'
					 );
		}
		$('.fliper').html(//翻页按钮
				'<div class="fanye" style="margin:10px,20px">'
				+'<a href="javascript:void(0)"  onclick="preIndex()"> 上一页 </a>'
				+'<small>第 '+cu_index+' 页</small>'
				+'<a href="javascript:void(0)"  onclick="aftIndex()">下一页 </a></div>'
				
		);
	}
	function aftIndex(){//下一页
		var index = cu_index;
		var totalPage = total_pages;
		if(index>=totalPage){index=totalPage;}else{index=index+1;}
		$.post('bonusActionFetch_j',{'currentIndex':index},callback_pre);
	}
	
	function callback_aft(data){
		var obj = eval('('+data+')');
		var BsList = obj.cuArrBs;
		cu_index = obj.currentIndex;
		$('.bonusList').html('');
		for(var i=0;i<BsList.length;i++){
			//替換掉原來的內容
			$('.bonusList').append(
					 '<hr>'
					 +' <h4><a href="algoView.jsp" style="text-decoration:none">'+BsList[i].bonus_title+'</a>'
					 +' <small><a href="userCenter.jsp?username='+BsList[i].user_name+'">requested by'+ BsList[i].user_name+'</a></small>'
					 +'<small>￥'+BsList[i].bonus_pride+'</small> '
				 +'<small>'+obj[i].bonus_time+'</small> '
					 +'</h4>'+'<p>'+BsList[i].bonus_instruction+'</p>'
					 );
		}
		$('.fliper').html(//翻页按钮
				'<div class="fanye" style="margin:10px,20px">'
				+'<a href="javascript:void(0)"  onclick="preIndex()"> 上一页 </a>'
				+'<small>第 '+cu_index+' 页</small>'
				+'<a href="javascript:void(0)"  onclick="aftIndex()">下一页 </a></div>'
				
		);
	}
	
//搜索悬赏
function sub_search(){
	$('.bonusList').empty();
	var input = $('#searchWord').val();
	//alert(input);
	$.post('SearchBonusAction',{'searchWord':input},shearch_result);
}
function shearch_result(data){
	var obj = eval('(' + data + ')');
		var currentIndex = obj.currentIndex;
		var totalpage = obj.totalPage;
		cu_index = currentIndex;
		total_pages =totalpage;
		var bonusList = obj.cuArrBs;
		cuIndex_search(bonusList);
}
function cuIndex_search(obj){
	for ( var i = 0; i < obj.length; i++) {
		$('.bonusList').append(//当前页算法列表
				 '<hr>'
				 +' <h4><a href="rewardView.jsp?bonus_id='+obj[i].bonus_id+'" style="text-decoration:none">'+obj[i].bonus_title+'</a>'
				 +' <small>requested by &nbsp&nbsp<a href="userCenter.jsp?username='+obj[i].user_name+'">'+ obj[i].user_name+'</a></small>&nbsp&nbsp'
				 +'<small> ￥'+obj[i].bonus_pride+'</small>&nbsp&nbsp '
				 +'<small>'+obj[i].bonus_time+'</small> '
				 +'</h4>'+'<p>'+obj[i].bonus_instruction+'</p>'
		);
		}
}
  </script>
  

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <!-- 创建悬赏 --><!--
                       <h3>提问悬赏</h3>
                        <p>提问悬赏为用户提供自由提问功能，任何用户可以在此发布在本网站为搜索到的算法，并设置合理价格，等待其他用户为您解决问题。</p>
                         <a href="createReward.jsp" class="btn btn-primary">创建问题</a>
                    <hr>

                    --><!-- 提问搜索和列表 -->
                    <div class="well">
                        <h3>悬赏搜索</h3>
                        <div class="form-group" >
                                <input type="search" class="form-control search" name="search" id="searchWord" value="输入算法关键字" 
                                onfocus="if (value =='输入算法关键字'){value =''}" onblur="if (value ==''){value='输入算法关键字'}"
                                onkeypress="if(event.keyCode==13){btn.click();}">
                            </div>
                            <button type="submit" class="btn btn-primary" name="btn" id="btn" onclick="sub_search();">搜索</button>
                       </div>
                    <!--悬赏列表-->
                    <div class="bonusList"></div>
                    <!-- 翻页 -->
                    <div class="fliper"></div>
                </div>
            </div>
        </div>
<jsp:include page="<%=M.j_tail%>" />
