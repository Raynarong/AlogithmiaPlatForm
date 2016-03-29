<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="alg.base.service.*" %>
<%@ page language="java" import="alg.base.bean.*" %>

<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" />
	<script type="text/javascript">
	
		function update()
		{
			var description = $("#description").val();
			var inputDescription = $("#inputDescription").val();
			var inputType = $("#inputType").val();
			var outputType = $("#outputType").val();
			var inputInstance = $("#inputInstance").val();
			var outputInstance = $("#outputInstance").val();
			var pay = $("#pay").val();
			var id = <%= request.getParameter("id") %>;
			
			alert(id);
			
			/* alert(description);
			alert(inputDescription);
			alert(inputType);
			alert(outputType);
			alert(inputInstance);
			alert(outputInstance);
			alert(pay); */
			
			$.post("publishAlgoAction.action",
				{
					"description" : description,
					"inputDescription" : inputDescription,
					"inputType" : inputType,
					"outputType" : outputType,
					"inputInstance" : inputInstance,
					"outputInstance" : outputInstance,
					"pay" : pay,
					"id" : id	
				},
				callback);
				
			function callback(data){
					
			}
		}
	
	
	
	</script>
	
	
	
	
	     <div id="page-wrapper">
           <div class="row">

                <div class="col-lg-12 text-center v-center">

                    <h2>登录</h2>
                    <br>
                    <br>
                    <form name="form1" id="form1" class="col-lg-12" action="login.action">
                        <div class="input-group" style="width: 340px; text-align: center; margin: 0 auto; border-radius: 4px;">
                            <input class="form-control input-lg" title="Confidential signup."
                                placeholder="输入账号" type="text" name="username" id="name" style="border-radius:6px;">
                        </div>
                        <br>
                        <br>
                        <div class="input-group" style="width: 340px; text-align: center; margin: 0 auto;">
                            <input class="form-control input-lg" title="Confidential signup."
                                placeholder="输入密码" name="password" id="password" type="password">
                            <span class="input-group-btn">
                                <button class="btn btn-lg btn-primary" type="button" onclick="login2()">进入</button></span>
                        </div>
                    </form>
                    <br>
                    <p><a href="#">忘记密码？</a></p>
                </div>
            </div>
        </div>



    算法描述
    <textarea rows="5" cols="20" id="description"></textarea><br>
    输入说明
    <textarea rows="5" cols="20" id="inputDescription"></textarea><br><br>
    输入类型
    <input type="text" id="inputType"><br><br>
    输出类型
    <input type="text" id="outputType"><br><br>
    输入实例
    <input type="text" id="inputInstance"><br><br>
    输出实例
    <input type="text" id="outputInstance"><br><br>
    付费
    <input type="text" id="pay"><br>
    
    <input type="button" value="submit" onclick="update();"> 
    
<jsp:include page="<%=M.j_tail%>" />
