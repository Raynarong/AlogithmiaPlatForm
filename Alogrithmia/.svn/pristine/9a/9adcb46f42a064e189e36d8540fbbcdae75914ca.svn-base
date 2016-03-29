<%@page import="alg.base.bean.usersbean"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />
    
    <style>

        div {
            padding-bottom:20px;
        }

    </style>
	
	<script type="text/javascript">

		$(function(){
			query_length();
			//var user = '<%= session.getAttribute("uesr") %>';
			//alert(user);
			function query_length(){
				$.post("getAlgoLengthAction.action", {}, callback);
			}
			
			function callback(data){
				$("#algo_id").text(data);
			}
		});
		
		function createAlgo(){
			var algoname = $("#username").val();
			var country = $("#country").val();
			var radio = $("#radio input[name='sourceCode']:checked").val();
			
			var str = ""
			if(algoname == "")
			{
				alert("算法名称不能为空！");
				return;
			}
			else if(algoname.length > 30)
			{
				alert("输入过长！");
				return;
			}
			else
			{
				var reg1 = /^[A-Za-z]+$/;
				var reg2 = /\_/;
				str = algoname.substring(0, 1);
				//alert(str);
				if(!reg1.test(str) && !reg2.test(str))
				{
					alert("算法名称必须以字母或下划线开始");
					return;
				}
			}
			
			var flag = false;
			$.ajax({
				type : "post",
				url : "checkAlgoAction.action",
				data : {"algoname" : algoname},
				dataType : "text",
				async : false,
				success : function (data){
					if(data == "true")
					{
						flag = true;
					}
					else
					{
						flag = false;
					}
					//alert(flag);
				} 
			});
			if(flag)
			{
				alert("算法重名，请重新输入！");
				return;
			}
			
			if(radio == "root")
			{
				radio = 1;
			}
			else
			{
				radio = 0;
			}
			var checkedNum = 0;
			if(($("#checkbox1").is(":checked")) && ($("#checkbox2").is(":checked")))
			{
				checkedNum = 2;
			}
			else if(($("#checkbox1").is(":checked")) && !($("#checkbox2").is(":checked")))
			{
				checkedNum = 1;
			}
			else if(!($("#checkbox1").is(":checked")) && ($("#checkbox2").is(":checked")))
			{
				checkedNum = 0;
			}
			//alert(checkedNum);
			
			$.post("setAlgoAction.action",
				{
					"algoname" : algoname,
					"country" : country,
					"radio" : radio,
					"checkedNum" : checkedNum
				},
				change
			);
			function change(data){
				if(data != '0')
				{
					var id = $("#algo_id").text();
					window.location.href = "algoAdd.jsp";
				}
				else
				{
					location.reload(true);
				}
			}
		}
		
	</script>
	
  </head>
  
      <div class="row text-center">
            <h2>添加算法</h2>
        </div>
        <div>
            <label for="username" class="col-md-2">
                	算法名称：
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" id="username" placeholder="Enter Name">
            </div>
        </div>        
        <div>
            <label for="emailaddress" class="col-md-2">
               	 算法id:
            </label>
            <div class="col-md-9">
                <p class="help-block" id="algo_id">
                </p>
            </div>
        </div>
        <div>
            <label for="password" class="col-md-2">
                	语言:
            </label>
            <div class="col-md-9">
                <select name="country" id="country" class="form-control">
                    <!-- <option>--请选择--</option> -->
                    <option>java</option>
                    <!--  <option>C++</option>-->
                    <!--  <option>C</option>-->
                </select>
            </div>
        </div>
        <div>
            <label for="root" class="col-md-2">
                	源代码:
            </label>
            <div class="col-md-10" id="radio">
                <label class="radio">
                    <input type="radio" name="sourceCode" id="Radio1" value="root" checked>
                    	开源
                </label>
                <label class="radio">
                    <input type="radio" name="sourceCode" id="Radio2" value="unroot">
                    	不开源
                </label>
            </div>             
        </div>
        <div>
            <label for="root" class="col-md-2">
                	使用方式:
            </label>
            <div class="col-md-10" id="checkBox">
                <label class="checkbox">
                    <input type="checkbox" name="usageOnline" id="checkbox1" value="usageOnline" checked>
                    	在线使用
                </label><!--
                <label class="checkbox">
                    <input type="checkbox" name="usageOutline" id="checkbox2" value="usageOutline">
                    	离线下载
                </label>
            --></div>             
        </div>
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-10">
           	 	<button type="submit" class="btn btn-primary" onclick="createAlgo();">
                <!-- <button type="submit" class="btn btn-primary" onclick="javascript:window.location.href='algoAdd.jsp'"> -->
                    	创建算法
                </button>
            </div>
        </div>
    </div>  
<jsp:include page="<%=M.j_tail%>" />