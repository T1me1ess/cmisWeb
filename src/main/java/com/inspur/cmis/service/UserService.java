package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.pojo.UserExt;

@Resource
public interface UserService {
    //登录验证
	public User getUser(User user);
	//用户默认查询或者根据序号和用户名查询
	public List<User> getUserList(Map map);
	
	//批量删除用户
	public void deleteUsers(int userIds[]);
	//对用户进行的操作
	public void operateUsers(Map map);
    //增加用户
	public void addUser(User user);
	//校对用户名是否已经存在
	public List<User> getUserByUserName(String username);
	//修改选择用户的信息
	public void updateUsers(User user);
	//用户登录后修改最后登录时间
	public void updateLastTime(User user);
	//导入
	public void importUser(List<User> userList);
		
	public List<UserExt> userStat();
}
