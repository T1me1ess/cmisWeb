package com.inspur.cmis.controller;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.pojo.UserExt;
import com.inspur.cmis.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	/*方法可以实现：
	 * 1.查询所用的用户（以分页的的形式展示出来）
	 * 2.根据用户的Id或者name查询用户相关的信息
	 */
	@RequestMapping("/userInfoList")
	public String userInfoList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1")int pn) {
		
		//获取前台传递的参数（userId和username是通过request来获取的，分页的页码是通过参数绑定实现的，默认值为1）
		String userId=request.getParameter("userId");
		String username=request.getParameter("username");
		Map map=new HashMap<String,String>();
		map.put("userId", userId);
		map.put("username", username);
		
		//使用PageHelper的方法展示出第几页的数据和每页数据的条数（将sql语句改造成分页的sql语句）
		PageHelper.startPage(pn, 5);
		
		//进行数据查询（或根据id、name查询，或查询全部）
		List<User> userList=userService.getUserList(map);
		
		//创建pageInfo类，将list转换为分页的list（封装的pageInfo里面有很多分页的相关信息）
		PageInfo<User> pageInfo=new PageInfo(userList,userList.size());
		
		//pageInfo中有list属性
		model.addAttribute("pageInfo",pageInfo);
		//model.addAttribute("userList",userList);
		model.addAttribute("userId", userId);
		model.addAttribute("username",username);
		for (User user : userList) {
			if(user.getIsEnable().equals("T"))
			{user.setIsEnable("启用");}
			else {
				user.setIsEnable("禁用");
			}
		}
		return "/user/userInfo.jsp";
		
	}
	
	//添加用户
	@RequestMapping("/userInfoAdd")
	public String userInfoAdd(User user,Model model) {
		/*设置注册的时间
		 * 1.设置日期格式
		 * 2.获取当前时间
		 * */
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String registerTime=df.format(date);
		// new Date()为获取当前系统时间
		user.setRegisterTime(registerTime);
		//设置其他的信息
		user.setLastTime("2020-03-01");
		user.setIsEnable("T");
		
		userService.addUser(user);
		model.addAttribute("success", "保存成功");
		model.addAttribute("addUser", user);
		model.addAttribute("flag", "1");
		
		return "/user/userInfoAdd.jsp";
	}
	
	
	//根据id批量删除用户
	@RequestMapping("/deleteUsers")
	public String deleteUsers(String userIds) {
		String userId[]=userIds.split(",");
		int user_ids[]=new int[userId.length];
		for(int i=0;i<userId.length;i++) {
			user_ids[i]=Integer.parseInt(userId[i]);}
		userService.deleteUsers(user_ids);
	return "redirect:userInfoList";
	}
	
	
	
	//对用户的操作
	@RequestMapping("/operateUsers")
	public String operateUsers(String tag,String userIds) {
		
		String userId[]=userIds.split(",");
		int user_ids[]=new int[userId.length];
		for(int i=0;i<userId.length;i++) {
			user_ids[i]=Integer.parseInt(userId[i]);}
		Map map=new HashMap();
		map.put("tag", Integer.parseInt(tag));
		map.put("userIds", user_ids);
		userService.operateUsers(map);
	return "redirect:userInfoList";
	}
	
	
	//校对是否用户名已经存在
	@RequestMapping("/checkUser")
    @ResponseBody
    public Map checkUser(String username) {
        System.out.println("前台Ajax传递过来的参数: " +username);
        List<User> selectUser = userService.getUserByUserName(username);
		Map map = new HashMap();
		map.put("selectUser", selectUser);
		if (selectUser.size() >= 1) {
			map.put("msg", "已存在该用户");
		}
		System.out.println("map==="+map);
		return map;

	}

	
	//修改选定的用户信息
    @RequestMapping("/updateUser")
    public String updateUsers(Model model,User user) {
    	
    	//展示选择用户的原信息
    	Map map=new HashMap();
    	map.put("userId", user.getUserId());
    	List<User> old_users=userService.getUserList(map);
    	User old_user=old_users.get(0);
    	model.addAttribute("User", old_user);
    	System.out.print("userid====================================================="+user.getUserId()+"===================================");
    	if(user.getUsername()!=null) {
    	//对提交的用户进行信息的修改
    	userService.updateUsers(user);
    	model.addAttribute("message", "修改成功");
    	List<User> new_users=userService.getUserList(map);
    	User new_user=new_users.get(0);
    	model.addAttribute("User", new_user);
    	System.out.print("=======SEX======="+new_user.getSex()+"=========================");
    	
    	}
    	
		return "/user/userInfoUpdate.jsp";
		
    }
       @RequestMapping("/userStat")	
	   @ResponseBody
	   public List<UserExt> userStat(){
		   List<UserExt> userList= userService.userStat();
		   return userList;
	   }
    	

		
		
		
}
