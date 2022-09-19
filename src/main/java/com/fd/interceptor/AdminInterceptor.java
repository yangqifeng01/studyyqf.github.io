package com.fd.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor{
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println("interceptor_______");
		if(request.getSession().getAttribute("user") != null || request.getSession().getAttribute("normalUser") !=null){
			return true;
		}
		if(request.getRequestURI().contains("/admin/login")){
			return true;
		}
		//重定可以，请求转发不行？
		response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
		return false;
	}
	
}
