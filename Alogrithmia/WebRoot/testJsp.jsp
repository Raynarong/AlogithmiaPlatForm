<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="context.M"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<jsp:include page="<%=M.j_head%>">
	<jsp:param name="page-title" value="Scale Manage" />
</jsp:include>
<jsp:include page="<%=M.j_left%>" /><!--

    <style>

        div {
            padding-bottom:20px;
        }

    </style>


  -->
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
                <p class="help-block">
                    algo：//renee//..
                </p>
            </div>
        </div>
        <div>
            <label for="password" class="col-md-2">
                	语言:
            </label>
            <div class="col-md-9">
                <select name="country" id="country" class="form-control">
                    <option>--请选择--</option>
                    <option>Java</option>
                    <option>C++</option>
                    <option>C</option>
                </select>
            </div>
        </div>
        <div>
            <label for="root" class="col-md-2">
                	源代码:
            </label>
            <div class="col-md-10">
                <label class="radio">
                    <input type="radio" name="sourceCode_yes" id="Radio1" value="root" checked>
                    	开源
                </label>
                <label class="radio">
                    <input type="radio" name="sourceCode_no" id="Radio2" value="unroot">
                    	不开源
                </label>
            </div>             
        </div>
        <div>
            <label for="root" class="col-md-2">
                	使用方式:
            </label>
            <div class="col-md-10">
                <label class="checkbox">
                    <input type="checkbox" name="usageOnline" id="checkbox1" value="usageOnline" checked>
                    	在线使用
                </label>
                <label class="checkbox">
                    <input type="checkbox" name="usageOutline" id="checkbox2" value="usageOutline">
                    	离线下载
                </label>
            </div>             
        </div>
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-10">
                <button type="submit" class="btn btn-primary" onclick="javascript:window.location.href='algoAdd.jsp'">
                    	创建算法
                </button>
            </div>
        </div>
    





<jsp:include page="<%=M.j_tail%>" />