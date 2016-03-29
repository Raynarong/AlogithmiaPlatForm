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
 
<style>
        div {
            padding-bottom:20px;
        }
        .mine{}
</style> 
       
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			 <h1>个人中心</h1>
			 <div class="row">
                <div class="col-lg-3">
                    <div class="panel panel-default ">
                        <div class="panel-body alert-info">
                            <div class="col-xs-5">
                                <i class="fa fa-truck fa-5x"></i>
                            </div>
                            <div class="col-xs-5 text-right">
                                <p class="alerts-heading" id=interview></p>
                                <p class="alerts-text">来访</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="panel panel-default ">
                        <div class="panel-body alert-info">
                            <div class="col-xs-5">
                                <i class="fa fa-money fa-5x"></i>
                            </div>
                            <div class="col-xs-5 text-right">
                                <p class="alerts-heading">0</p>
                                <p class="alerts-text">积分</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="panel panel-default ">
                        <div class="panel-body alert-info">
                            <div class="col-xs-5">
                                <i class="fa fa-download fa-5x"></i>
                            </div>
                            <div class="col-xs-5 text-right">
                                <p class="alerts-heading">1</p>
                                <p class="alerts-text">API使用</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="bs-example col-lg-12">
				<ul class="nav nav-tabs" style="margin-bottom: 15px;"
					id="nav_tabs_1">
					<li class="active"><a href="#home" data-toggle="tab">个人资料</a>
					</li>
					<li><a href="#algoList" data-toggle="tab">我的算法</a>
					</li>
					<li><a href="#bonusList" data-toggle="tab">我的悬赏</a>
					</li>
					<li><a href="#credits" data-toggle="tab">我的积分</a>
					</li>
					<li ><a href="#tradeRecord" data-toggle="tab"  >交易记录</a>
					</li>
				</ul>
				<div id="myTabContent" class="tab-content col-lg-12">
					<div class="tab-pane fade active in" id="home">

				  <form id="signupForm" method="post" action="">
        					<div>
            					<label for="username" class="col-md-1">
                					用户名：
            					</label>
            					<div class="col-md-11">
                					<input type="text"  id="username" name="user_name"  class=" form-control" value="<%=session.getAttribute("user") %>"  required  onblur="judgeRename()" >

            					</div>

							</div>        
        					<div>
            					<label for="emailaddress" class="col-md-1">
               	 					邮箱:
            					</label>
            					<div class="col-md-11">
                					<input type="email" id="emailaddress" name="user_mail"   class=" form-control" value="<%=session.getAttribute("mail") %>" required>
            					</div>
        				    </div>
        					<div class="mine">
            					<label for="password" class="col-md-1">
                					密码:
            					</label>
            					<div class="col-md-11">
                					<input type="button" class="btn btn-default" value="修改密码" 
									onClick="javascript:window.open('userUpdate.jsp','修改密码','width=400,height=350,top=200px,left=600px,toolbar=no,menubar=no,status=no,resizable=no,scrollbars=no,location=no');return false;">
               					</div>
        					</div>
        			<hr/>
        			<div class="row mine">
            				<div class="col-md-5">
            				</div>
            			<div class="col-md-5">
                			<button type="submit" class="btn btn-primary">
                    			保存
                			</button>
            			</div>
        			</div>
        			</form> 
            		</div>	
					<div class="tab-pane fade" id="algoList">
						<div class="algList"></div>
						<div class="fliper"></div>
                   		<div class="col-lg-6" style="height:800px;positon:relative">
            		<!--<div class="bs-example">
              			<div class="list-group">
                		</div>
            		</div>
            		--><br>
            		<!-- alg翻页 -->
            		<div class="alg_fliper"></div>
          		</div>
					</div>
					<div class="tab-pane fade" id="bonusList" >
						<!--悬赏列表-->
						<div class="mine">
							<h3>提问悬赏</h3>
                        	<p>提问悬赏为用户提供自由提问功能，任何用户可以在此发布在本网站为搜索到的算法，并设置合理价格，等待其他用户为您解决问题。</p>
                        	<a href="createReward.jsp" class="btn btn-primary">创建问题</a>
                         </div>
                         <p></p>
                   	 	<div class="bonusList"></div>
                   	 	
                    	<!-- 翻页 -->
                    	<div class="bonus_fliper"></div>
                    
                   
						<hr><%--
            			<div class="fanye" style="margin:">
            			<a href="bonusActionFetch?currentIndex=<%=(currentIndex<=1)?1:(currentIndex-1) %>" name="zuo"> 上一页 </a>
            			<small>第<%=currentIndex %>页</small>
            			<a href="bonusActionFetch?currentIndex=<%=(currentIndex>=totalPage)?totalPage:(currentIndex+1) %>" name="you"> 下一页</a>
            			</div>
            			--%><br>
					</div>
					
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
						<div class="col-md-2 text-left">
								<input type="button" class="btn btn-primary" value="积分充值" 
								onClick="javascript:window.open('buyCredits.jsp','积分充值','width=260,height=300,top=200px,left=600px,toolbar=no,menubar=no,status=no,resizable=yes,scrollbars=no,location=no');return false;">				
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
				</div>
				<hr>
                
            </div>
		</div>
	</div>
</div>
<jsp:include page="<%=M.j_tail%>" />
 <script type="text/javascript">
 
var username = location.search.substr(1).split('=')[1];
var user = "<%=session.getAttribute("user")%>";
console.log("user === "+user);
 if(username == user){
 	$(".mine").show();
 }else{
 	$(".mine").hide();
 }
 
function judgeRename(){
var user_name=trim($('#username').val());
var myReg=/^[a-zA-Z][a-zA-Z0-9_]*$/;
var ur="<%=session.getAttribute("user") %>";
if(user_name!=""){

if(myReg.test(user_name)){}
else{
alert("请输入以字母开头的包含字母数字下划线的用户名");
}
}
else{
$('#username').val(ur);
}


if(user_name!=ur){
var url='loginJudgeName.action';
var parameters={
'user_name':user_name
};
$.post(url,parameters,resultHandle,'html');
}
}
function trim(str)
	{
		return str.replace(/^\s*|\s*$/g, '');
	}
function resultHandle(value){
var val=trim(value);
if(val!=''){
alert("用户名重复");
}
else{

}
}


$("#signupForm").submit(function(){

  var username=$("#username").val();
  var emailaddress=$("#emailaddress").val();
 $.ajax({
  url: "changeInfor.action",
  dataType: "html",
  data:{
  user_name:username,
  user_mail:emailaddress
  },
  success: function(){
    alert("修改成功");
    
  }
});
 });

     var redata;
     var credit;
    $(function(){ 
        $.ajaxSetup({
          async:false
             });
      $.post("showTraderecord.action",{},handle,'html' );
         function handle(value){
                  redata= eval("("+value+")");  
                  return redata;
                    }
           }),
         
         $(function(){ 
        $.ajaxSetup({
          async:false
             });
             
      $.post("showCreditRecord.action",{},handle1,'html' );
         function handle1(value){
                  credit= eval("("+value+")");  
                  
                    }
           }),
        $(function () {
              
 			$("#shieldui-grid1").shieldGrid({
                dataSource: {
                    data: credit
                },
                
                sorting: {
                    multiple: true
                },
                paging: {
                    pageSize: 7,
                    pageLinksCount: 4
                },
                selection: {
                    type: "row",
                    multiple: true,
                    toggle: false
                },
                columns: [
                    { field: "id", width: "70px", title: "序号" },
                    { field: "algorithm_name", title: "算法名称" },
                    { field: "trade_credit", title: "花费积分" },
                    { field: "trade_time", title: "时间", width: "200px" }
                ]
            });
            
          
	     
	  
            $("#shieldui-grid2").shieldGrid({
          
                dataSource: {
                    data: redata
                },
                sorting: {
                    multiple: true
                },
                paging: {
                    pageSize: 7,
                    pageLinksCount: 4
                },
                selection: {
                    type: "row",
                    multiple: true,
                    toggle: false
                },
                columns: [
                    { field: "id", width: "70px", title: "序号" },
                    { field: "algo", title: "交易项目" },
                    { field: "tradeMoney", title: "交易金额" },
                    { field: "tradeTime", title: "交易时间",format: "{0:d}",  width: "200px" }
                ]
            });
        });
      $(function(){
      $.post("totalVisitor.action",{} ,interview);
      function interview(value){
      $('#interview').text(value);
      }
      
      })

 $(function() {
			$.post('algthmActionFetch_User', {}, cuIndex_ready_a);
			$.post('bonusActionFetch_User', {}, cuIndex_ready_b);
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
			$.post('algthmActionFetch_User', {'currentIndex':index}, callback_pre_a);
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
			$.post('algthmActionFetch_User', {'currentIndex':index}, callback_aft_a);
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
			$('.bonusList').append(//当前页算法列表
					
					'<a href="algoView.jsp?alg_id='+obj[i].algorithm_id+'" class="list-group-item">'
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
			$.post('bonusActionFetch_User',{'currentIndex':index},callback_pre_b);
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
						
						'<a href="algoView.jsp?alg_id='+obj[i].algorithm_id+'" class="list-group-item">'
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
			$.post('bonusActionFetch_User',{'currentIndex':index},callback_aft_b);
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
						'<a href="algoView.jsp?alg_id='+obj[i].algorithm_id+'" class="list-group-item">'
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
