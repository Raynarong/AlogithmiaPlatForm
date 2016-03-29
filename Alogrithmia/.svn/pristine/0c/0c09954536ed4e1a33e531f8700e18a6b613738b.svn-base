<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="alg.base.service.*" %>
<%@ page language="java" import="alg.base.bean.*" %>

<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />
	<script >
	 $(function() {
			$.post('algthmActionFetch_j', {}, cuIndex_ready_a);
			$.post('bonusActionFetch_j', {}, cuIndex_ready_b);
		});

		var total_pages_a;
		var total_pages_b;
		var cu_index_a;
		var cu_index_b;

		function cuIndex_ready_a(data){
			var obj=eval('('+data+')');
			var currentIndex = obj.currentIndex;
			var totalPage = obj.totalPage;
			cu_index_a = currentIndex;
			total_pages_a = totalPage;
			var algList = obj.cuArrAlgs;
			cuIndex_readyfp_a(algList);
		}
		function cuIndex_readyfp_a(obj){
			for(var i=0;i<obj.length;i++){
				$('.algList').append(
        			'<a href="algoView.jsp?alg_id='+obj[i].algorithm_id+'" class="list-group-item">'
        			+'<h4>'+obj[i].algorithm_name
        			+'<small> '+obj[i].user_name+'</small>'
        			+'<small> '+obj[i].vist_times+'人访问</small></h4>'
        			+'<p>'+obj[i].algorithm_describe+'</p></a>'
						);
			}
			$('.alg_fliper').html(//alg翻页
					'<div class="fanye" style="margin:10px,20px">'
					+'<a href="javascript:void(0)"  onclick="preIndex_a()"> 上一页  </a>'
					+'<small> 第 '+cu_index_a+' 页 </small>'
					+'<a href="javascript:void(0)"  onclick="aftIndex_a()"> 下一页  </a></div>'
					);
		}
		
		function preIndex_a(){
			var index = cu_index_a;
			if(index<=1){index=1;}else{index=index-1;}
			$.post('algthmActionFetch_j', {'currentIndex':index}, callback_pre_a);
		}
		function callback_pre_a(data){
			var obj = eval('('+data+')');
			var currentIndex = obj.currentIndex;
			var totalPage = obj.totalPage;
			cu_index_a = currentIndex;
			total_pages_a = totalPage;
			var algList = obj.cuArrAlgs;
			callback_prefp_a(algList);
		}
		function callback_prefp_a(obj){
			$('.algList').html('');
			for(var i=0;i<obj.length;i++){
				$('.algList').append(
	        			'<a href="algoView.jsp?alg_id='+obj[i].algorithm_id+'" class="list-group-item">'
	        			+'<h4>'+obj[i].algorithm_name
	        			+'<small> '+obj[i].user_name+'</small>'
	        			+'<small> '+obj[i].vist_times+'人访问</small></h4>'
	        			+'<p>'+obj[i].algorithm_describe+'</p></a>'
							);
			}
			$('.alg_fliper').html(//alg翻页
					'<div class="fanye" style="margin:10px,20px">'
					+'<a href="javascript:void(0)"  onclick="preIndex_a()"> 上一页  </a>'
					+'<small> 第 '+cu_index_a+' 页 </small>'
					+'<a href="javascript:void(0)"  onclick="aftIndex_a()"> 下一页  </a></div>'
					);
		}
		function aftIndex_a(){
			var index = cu_index_a;
			if(index>=total_pages_a){index=total_pages_a;}else{index=index+1;}
			$.post('algthmActionFetch_j', {'currentIndex':index}, callback_aft_a);
		}
		function callback_aft_a(data){
			var obj = eval('('+data+')');
			var currentIndex = obj.currentIndex;
			var totalPage = obj.totalPage;
			var algList = obj.cuArrAlgs;
			cu_index_a = currentIndex;
			total_pages_a = totalPage;
			callback_aftfp_a(algList);
		}
		function callback_aftfp_a(obj){
			$('.algList').html('');
			for(var i=0;i<obj.length;i++){
				$('.algList').append(
	        			'<a href="algoView.jsp?alg_id='+obj[i].algorithm_id+'" class="list-group-item">'
	        			+'<h4>'+obj[i].algorithm_name
	        			+'<small> '+obj[i].user_name+'</small>'
	        			+'<small> '+obj[i].vist_times+'人访问</small></h4>'
	        			+'<p>'+obj[i].algorithm_describe+'</p></a>'
							);
			}
			$('.alg_fliper').html(//alg翻页
					'<div class="fanye" style="margin:10px,20px">'
					+'<a href="javascript:void(0)"  onclick="preIndex_a()"> 上一页  </a>'
					+'<small> 第 '+cu_index_a+' 页 </small>'
					+'<a href="javascript:void(0)"  onclick="aftIndex_a()"> 下一页  </a></div>'
					);
		}
		function cuIndex_ready_b(data) {
			var obj = eval('(' + data + ')');
			var currentIndex = obj.currentIndex;
			var totalPage = obj.totalPage;
			cu_index_b = currentIndex;
			total_pages_b =totalPage;
			var bonusList = obj.cuArrBs;
			cuIndex_readyfp_b(bonusList);
		}
		function cuIndex_readyfp_b(obj) {
			for ( var i = 0; i < obj.length; i++) {
			$('.bonusList').append(//当前页悬赏列表
					
					'<a href="rewardView.jsp?bonus_id='+obj[i].bonus_id+'" class="list-group-item">'
					+'<h4>'+obj[i].bonus_title+''
					+'<small>requested by '+obj[i].user_name+'</small>'
					+'<small>￥'+obj[i].bonus_pride+'</small>'
					+'</h4>'+'<p>'+obj[i].bonus_instruction+'</p>'+'</a>'
					 
			);
			}
			
			$('.bonus_fliper').html(//翻页按钮
					'<div class="fanye" style="margin:10px,20px">'
					+'<a href="javascript:void(0)"  onclick="preIndex_b()"> 上一页  </a>'
					+'<small> 第 '+cu_index_b+' 页 </small>'
					+'<a href="javascript:void(0)"  onclick="aftIndex_b()"> 下一页  </a></div>'
					
			);
		}
		
		function preIndex_b(){//上一页
			var index = cu_index_b;
			if(index<=1){index=1;}else{index=index-1;}
			$.post('bonusActionFetch_j',{'currentIndex':index},callback_pre_b);
		}
		
		function callback_pre_b(data){
			var obj = eval('('+data+')');
			var BsList = obj.cuArrBs;
			cu_index_b = obj.currentIndex;
			callback_prefp_b(BsList);
		}
		function callback_prefp_b(obj){
			$('.bonusList').html('');
			for ( var i = 0; i < obj.length; i++) {
				$('.bonusList').append(//当前页算法列表
						
						'<a href="rewardView.jsp?bonus_id='+obj[i].bonus_id+'" class="list-group-item">'
						+'<h4>'+obj[i].bonus_title+''
						+'<small>requested by '+obj[i].user_name+'</small>'
						+'<small>￥'+obj[i].bonus_pride+'</small>'
						+'</h4>'+'<p>'+obj[i].bonus_instruction+'</p>'+'</a>'
						 
				);
				}
				
				$('.bonus_fliper').html(//翻页按钮
						'<div class="fanye" style="margin:10px,20px">'
						+'<a href="javascript:void(0)"  onclick="preIndex_b()"> 上一页  </a>'
						+'<small> 第 '+cu_index_b+' 页 </small>'
						+'<a href="javascript:void(0)"  onclick="aftIndex_b()"> 下一页  </a></div>'
						
				);
		}
		
		function aftIndex_b(){//下一页
			var index = cu_index_b;
			var totalPage = total_pages_b;
			if(index>=totalPage){index=totalPage;}else{index=index+1;}
			$.post('bonusActionFetch_j',{'currentIndex':index},callback_aft_b);
		}
		
		function callback_aft_b(data){
			var obj = eval('('+data+')');
			var BsList = obj.cuArrBs;
			cu_index_b = obj.currentIndex;
			callback_atffp_b(BsList);
		}
		function callback_atffp_b(obj){
			$('.bonusList').html('');
			for ( var i = 0; i < obj.length; i++) {
				$('.bonusList').append(//当前页算法列表
						'<a href="rewardView.jsp?bonus_id='+obj[i].bonus_id+'" class="list-group-item">'
						+'<h4>'+obj[i].bonus_title+''
						+'<small>requested by '+obj[i].user_name+'</small>'
						+'<small>￥'+obj[i].bonus_pride+'</small>'
						+'</h4>'+'<p>'+obj[i].bonus_instruction+'</p>'+'</a>'
				);
				}
				$('.bonus_fliper').html(//翻页按钮
						'<div class="fanye" style="margin:10px,20px">'
						+'<a href="javascript:void(0)"  onclick="preIndex_b()"> 上一页  </a>'
						+'<small> 第 '+cu_index_b+' 页 </small>'
						+'<a href="javascript:void(0)"  onclick="aftIndex_b()"> 下一页  </a></div>'
						
				);
		}
	
	</script>

  <%
  	ArrayList<Algorithm> cuArrAlg = (ArrayList<Algorithm>)request.getAttribute("cuArrAlgs");
  	ArrayList<Bonus> cuArrBs = (ArrayList<Bonus>)request.getAttribute("cuArrBs");
  	int totalPage_a = (Integer)request.getAttribute("totalPage_a");
  	int totalPage_b = (Integer)request.getAttribute("totalPage_b");
  	int currentIndex_a =(Integer)request.getAttribute("currentIndex_a");
  	int currentIndex_b =(Integer)request.getAttribute("currentIndex_b");
  %>
	
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <div class="alert alert-success alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        欢迎使用算法交易服务平台，在这里您既可以发布算法，也可以找到直接应用与工程的算法......
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6" style="height:800px;position:relative">
            		<div class="bs-example">
              			<div class="list-group">
                			<a href="reward.jsp" class="list-group-item active text-center">提问悬赏</a>
                			<!-- bonus列表 -->
                			<div class="bonusList"></div>
                			<%
                		//	for(Bonus bs:cuArrBs){
                				%>
                			<%--<a href="algoView.jsp?alg_id='+obj[i].algorithm_id+'" class="list-group-item">
                				<h4><%=bs.getBonus_title() %>
                    			<small>requested by <%=bs.getUserName() %></small>
                    			<small>￥<%=bs.getBonus_pride() %></small>
                    			</h4>
                    			<p><%=bs.getBonus_instruction() %></p>
                			</a>
                			--%><%
                		//	}
                			%>
                			
              			</div>
            		</div>
            		<br>
            		<!-- bonus翻页 -->
                	<div class="bonus_fliper"></div>
            		<%--<div class="fanye" style="bottom:0;position:absolute">
            		<a href="indexActionFetch?currentIndex_b=<%=(currentIndex_b<=1)?1:(currentIndex_b-1) %>&currentIndex_a=<%=currentIndex_a %>" name="zuo"> 上一页 </a>
            		<small>第<%=currentIndex_b %>页</small>
            		<a href="indexActionFetch?currentIndex_b=<%=(currentIndex_b>=totalPage_b)?totalPage_b:(currentIndex_b+1) %>&currentIndex_a=<%=currentIndex_a %>" name="you"> 下一页</a>
           			</div>
          		--%></div>
          		<div class="col-lg-6" style="height:800px;positon:relative">
            		<div class="bs-example">
              			<div class="list-group">
                			<a href="search.jsp" class="list-group-item active text-center">算法列表</a>
              			<!-- 算法列表 -->
              			<div class="algList"></div><%--
                			<%
                			for(Algorithm alg :cuArrAlg){
                				%>
                			<a href="algoView.jsp?alg_id='+obj[i].algorithm_id+'" class="list-group-item">
                				<h4><%=alg.getAlgorithm_name() %>
                    			<small><%=alg.getUser_name() %>作者</small>
                    			<small>被访问<%=alg.getVist_times() %>次</small>
                    			</h4>
                    			<p><%=alg.getAlgorithm_describe() %></p>
                			</a>
                			
                			<%
                			}
                			%>
                			
              			--%></div>
            		</div>
            		<br>
            		<!-- alg翻页 -->
            		<div class="alg_fliper"></div><%--
            		<div class="fanye" style="position:absolute;bottom:0">
            		<a href="indexActionFetch?currentIndex_a=<%=(currentIndex_a<=1)?1:(currentIndex_a-1) %>&currentIndex_b=<%=currentIndex_b %>" name="zuo"> 上一页 </a>
            		<small>第<%=currentIndex_a %>页</small>
            		<a href="indexActionFetch?currentIndex_a=<%=(currentIndex_a>=totalPage_a)?totalPage_a:(currentIndex_a+1) %>&currentIndex_b=<%=currentIndex_b %>" name="you"> 下一页</a>
           			</div>
          		--%></div>
            </div>
        </div>
        
<jsp:include page="<%=M.j_tail%>" />

