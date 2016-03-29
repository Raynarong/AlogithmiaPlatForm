<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="alg.base.bean.*" %>
<%@ page import="context.M"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<script>
   var sessionId;
   $(function(){
      var v="<%=session.getAttribute("user")%>";
      var level = "<%=session.getAttribute("level")%>";
      console.log(v);
      console.log('level=='+level);
	   if(v!="null"){
		   $('#out').css('display','block');
		   $('#in').css('display','none');
		  /* $('.dropdown-toggle').attr('value',v);*/
		/* document.getElementById("dp").innerText=v;*/
			$('#dp').append(v);
			$('#add').show();
			$('#sign').hide();
			$('#register').hide();
			$('#user').show();
			$('#message').show();
			$('#datacollection').show();
			$('#aboutus').show();
			$('#feedback').show();
			$('#login').hide();
			
			$('#adminCenter').hide();
			$('.admin').hide();
			sessionId=<%=session.getAttribute("id")%>;
			
			if(level == 1){   //管理员
 				$('#adminCenter').show();
 				$('.admin').show();
		
			}
	   }
	   else{
		   $('#out').css('display','none');
		   $('#in').css('display','block');
		   $('#add').hide();
		   $('#user').hide();
		   $('#dp').append("请登录");
		   $('#message').hide();
		   $('#datacollection').hide();
		   $('#aboutus').show();
		   $('#feedback').hide();
		   $('#adminCenter').hide();
		   $('#login').show();
		   $('.admin').hide();
		   
		  
	   }
	   

   });
   
function signOut(){
	 var url="clear_session.action";
	 $.post(url,location.reload());
}

var numberData;
$( function(){
$("#showMes").one("click",function showList(){
     $('#reminder').text(numberData+"个消息");
     $.post('message_list.action', {},handleshow);
});
}
)
/*function showList(){
     $.post('message_list.action', {},handleshow);
	
// $(".dropdown-toggle").dropdown('toggle');

}*/

function handleshow(data){
	var obj=eval('('+data+')');
	var commentList=obj.comment;
	 handleshowComment(commentList);
	var respondList=obj.respond;
	 showRespond(respondList);

}
function handleshowComment(data){
	for(var i=0;i<data.length;i++){
	 console.log("suanfaid:"+data[i].algorithm_id);
	 $(".dropdown-header").append('<li class="message-preview">'
		 +'<a href="algoView.jsp?alg_id='+data[i].algorithm_id+'&flag=1"> <span class="avatar"><i'
		 +'="fa fa-bell"></i> </span> <span class="message">'+data[i].reviewer_name+'评论了你</span> </a>'
		 +'</li>'
		 +'<li class="divider"></li>');
	}
}

function showRespond(data){
	for(var i=0;i<data.length;i++){
	
	 $(".dropdown-header").append('<li class="message-preview">'
		 +'<a href="algoView.jsp?alg_id='+data[i].algorithm_id+'&flag=1"> <span class="avatar"><i'
		 +'="fa fa-bell"></i> </span> <span class="message">'+data[i].reviewer_name+'回复了你</span> </a>'
		 +'</li>'
		 +'<li class="divider"></li>');
	}
}
//消息推送
 $(function () {

     var url="message_number.action";
     
      $.get(url,  

              function (data) {

               //   $("#logs").append("[data: " + data + " ]<br/>");
                      $('#number').text(data);
                      
                      $('#reminder').text(""+data+"个消息");
                  //    $('#reminder').text(data+"个消息");
                  numberData=data;
          });
 
    	 JS.Engine.on(

		{
			hello : function(cometUser) {//侦听一个channel
			if(cometUser==sessionId){
			   numberData = numberData*1+1;
			    $('#number').text(numberData);
            $('#reminder').text(""+numberData+"个消息");
			   
			}

				
			}
		});
		JS.Engine.start('conn');

	})
    
    
	
function userCenter(){
	var username="<%=session.getAttribute("user")%>";
	var url="userCenter.jsp?username="+username;
	$("#user").attr("href",url);
}
</script>

		<div id="wrapper" style="width:100%;">
		
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">算法交易服务平台</a>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li>
						<a href="index.jsp"><i class="fa fa-bullseye"></i> 首页</a>
					</li>
					<li>
						<a onclick="userCenter();" href="" id="user"><i class="fa fa-tasks"  ></i>个人中心</a>
					</li>
					<li>
						<a href="search.jsp"><i class="fa fa-table"></i> 搜索算法</a>
					</li>
					<li id="add" >
						<a href="addAlgorithm.jsp"><i class="fa fa-tasks"></i> 添加算法</a>
					</li>
					<li id="">
						<a href="reward.jsp"><i class="fa fa-list-ul"></i> 提问悬赏</a>
					</li>
					<li id="datacollection">
						<a href="dataCollection.jsp"><i class="fa fa-list-ul"></i> 数据集合</a>
					</li>
					<li id="login">
						<a href="Signup.jsp"><i class="fa fa-list-ol"></i> 登录</a>
					</li>
					<li>
						<a href="register.jsp" id="register"><i class="fa fa-font"></i> 注册</a>
					</li>
					<li id="aboutus">
						<a href="aboutus.jsp"><i class="fa fa-globe"></i> 关于我们</a>
					</li>
					<li id="feedback">
						<a href="feedback.jsp"><i class="fa fa-list-ol"></i> 意见反馈</a>
					</li>
					<li id="adminCenter">
						<a href="adminCenter.jsp"><i class="fa fa-list-ol"></i> 管理员中心</a>
					</li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right navbar-user" >
					<li class="dropdown messages-dropdown" id="message">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"  id="showMes"><i
							class="fa fa-envelope"></i> 消息 <span class="badge" id="number"></span> <b
							class="caret"></b> </a>
						<ul class="dropdown-menu">
							<li class="dropdown-header" id="reminder">
							</li>
							<!--<li class="message-preview">
								<a href="#"> <span class="avatar"><i
										class="fa fa-bell"></i> </span> <span class="message">消息1</span> </a>
							</li>
							<li class="divider"></li>
							<li class="message-preview">
								<a href="#"> <span class="avatar"><i
										class="fa fa-bell"></i> </span> <span class="message">消息2</span> </a>
							</li>
						--></ul>
					</li>

					<li class="dropdown user-dropdown" >
						<a class="dropdown-toggle" data-toggle="dropdown" id="down" ><i
							class="fa fa-user" id="dp"></i><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="divider"></li>
							
							<li id="out" >
								<a href="Signup.jsp" onclick="signOut()"><i class="fa fa-power-off"></i> 退出</a>
							</li >
							<li id="in" >
								<a  href="Signup.jsp"><i class="fa fa-power-off" ></i> 登录</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			</nav>
		<div>


