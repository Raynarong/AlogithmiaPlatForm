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
<link rel="stylesheet" type="text/css" href="resources/css/mese.css">
<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/jquery.metadata.js" type="text/javascript"></script>
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
</style>

<script type="text/javascript">

	$(function(){
	
	$("#feedback_form").validate({

	rules : {
				name : {
					required : true
				},
				email : {
					required : true,
					email : true
				},
				phone : {
					required : true
				}
			},
			messages : {
				name : {
					required : "请输入姓名"
				},
				email : {
					required : "请输入Email地址",
					email : "请输入正确的email地址"
				},
				phone : {
					required : "请输入电话号码",
					manlength : "电话号码输入不正确",
					minlength : "电话号码输入不正确"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
		
	});
</script>



          
              <div class="container">

				<div class="page-header">
				    <h1>意见反馈 <small>如果你有什么问题请联系我们</small></h1>
				</div>

<!-- Contact Form - START -->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
                <form class="form-horizontal" id="feedback_form" method="post" action="feedbackAction.action">
                    <fieldset>
                        <legend class="text-center header">反馈内容</legend>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="lname" name="name" type="text" placeholder="Name" class="form-control required">
                            </div>
                        </div>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-envelope-o bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="email" name="email" type="text" placeholder="Email Address" class="form-control required email">
                            </div>
                        </div>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-phone-square bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="phone" name="phone" type="text" placeholder="Phone" class="form-control required">
                            </div>
                        </div>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
                            <div class="col-md-8">
                                <textarea class="form-control" id="message" name="message" placeholder="Enter your massage for us here. We will get back to you within 2 business days." rows="7"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary btn-lg">提交</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
	$(function(){
		var flag = '<%=request.getParameter("flag")%>';
		//alert(flag);
		if(flag == 'true')
		{
			$.messager.show({
				title: 'Message',
				msg: '您的反馈已提交成功',
				timeout: 3000,
				showType: 'show'
			});
		}
		
	

	});

</script>

<style>
    .header {
        color: #36A0FF;
        font-size: 27px;
        padding: 10px;
    }

    .bigicon {
        font-size: 35px;
        color: #36A0FF;
    }
</style>

<!-- Contact Form - END -->

</div>

<jsp:include page="<%=M.j_tail%>" />
