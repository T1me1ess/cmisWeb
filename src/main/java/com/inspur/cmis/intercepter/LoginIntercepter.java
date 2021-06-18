package com.inspur.cmis.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.inspur.cmis.pojo.User;

public class LoginIntercepter implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean flag=false;
		System.out.println("=============拦截器运行============");
		//拦截未登录的用户（登录时将user存放在session中）
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		if(user==null) {
			//如果user为空证明未登录，强制跳转到登录页面
			response.sendRedirect("/cmisWeb/login.jsp");
		         }
		else {
			flag=true;
		}
		return flag;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
