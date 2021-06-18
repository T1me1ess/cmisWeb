package com.inspur.cmis.controller;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.UserService;
import com.inspur.cmis.service.impl.UserServiceImpl;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/loginController")
	public ModelAndView login(User user,HttpSession session) {
	   ModelAndView mv=new ModelAndView();
	   User ck_user= null;
		if(user!=null)
		{   ck_user=userService.getUser(user);}
		if(ck_user!=null) {
        //登录成功后修改最后登录的时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date=new Date();
			String lastTime=df.format(date);
			ck_user.setLastTime(lastTime);
			userService.updateLastTime(ck_user);
			session.setAttribute("user", ck_user);
			mv.setViewName("main.jsp");
			
		}else {
			mv.addObject("message","用户名密码错误，请重新输入！");
			mv.setViewName("login.jsp");
		}
		//判断时间
		GregorianCalendar ca = new GregorianCalendar();  
		if(ca.get(GregorianCalendar.AM_PM)==0) {
			session.setAttribute("time", "上午好");		
		}  else {
			session.setAttribute("time", "下午好");
		}
		return mv;
	}

}
