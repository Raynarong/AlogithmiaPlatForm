package com.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class addCenterFilter implements Filter {

   
    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub

    }

    
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        // 获得在下面代码中要用的request,response,session对象
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();

        // 获得用户请求的URI
        String path = servletRequest.getRequestURI();
        //System.out.println(path);
        
        // 从session里取员工工号信息
        String user = (String) session.getAttribute("user");

        /*创建类Constants.java，里面写的是无需过滤的页面
        for (int i = 0; i < Constants.NoFilter_Pages.length; i++) {

            if (path.indexOf(Constants.NoFilter_Pages[i]) > -1) {
                chain.doFilter(servletRequest, servletResponse);
                return;
            }
        }*/
        
        // 个人中心和添加算法需要过滤
        if(!(path.indexOf("/userCenter.jsp") > -1||path.indexOf("/addAlgorithm.jsp")>-1||path.indexOf("/algoAdd.jsp")>-1||path.indexOf("/feedback.jsp")>-1||path.indexOf("/dataCollection.jsp")>-1)) {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }

        // 判断如果没有取到员工信息,就跳转到登陆页面
        if (user == null || "".equals(user)) {
            // 跳转到登陆页面
            servletResponse.sendRedirect("/Alogrithmia/Signup.jsp");
        } else {
            // 已经登陆,继续此次请求
            chain.doFilter(request,  response);
        }
     
       /* if (path.indexOf("conn") > -1) {
            // request.getRequestURI()格式应该形如：/st/servlet/jqueryAjax，
            // 其中st是项目名，servlet是所有servlet都增加的前缀，用于能够判断出是servlet。
            // if只判断请求uri是否包含/servlet/，如果包含则处理；
        	System.out.println("监听");
            RequestDispatcher rdsp = request.getRequestDispatcher(path);
            rdsp.forward(request,  response);
        } else {
            chain.doFilter(request,  response);
        }*/
    }

   
    public void destroy() {
        // TODO Auto-generated method stub

    }

}
