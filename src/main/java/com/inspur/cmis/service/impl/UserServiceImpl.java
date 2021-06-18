package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.UserMapper;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.pojo.UserExt;
import com.inspur.cmis.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	//用户登录查询：根据用户名和密码查询
	@Override
	public User getUser(User user) {
      
		return userMapper.getUser(user);
	}

	//用户的默认查询
	@Override
	public List<User> getUserList(Map map) {
		List<User> userList=userMapper.getUserList(map);
		return userList;
	}

	//对用户的操作
	@Override
	public void operateUsers(Map map) {
		// TODO Auto-generated method stub
      userMapper.operateUsers(map);		
	}


	//批量删除用户
	@Override
	public void deleteUsers(int[] userIds) {
		// TODO Auto-generated method stub
		userMapper.deleteUsers(userIds);
		
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
	}

	@Override
	public List<User> getUserByUserName(String username) {
		// TODO Auto-generated method stub
		List<User> list=userMapper.getUserByUserName(username);
		return list;
	}

	@Override
	public void updateUsers(User user) {
		// TODO Auto-generated method stub
		userMapper.updateUsers(user);
	}

	@Override
	public void updateLastTime(User user) {
		// TODO Auto-generated method stub
		userMapper.updateLastTime(user);
		
	}
	/**
	 * 批量导入客户经理同时导入用户信息
	 */
	public void importUser(List<User> userList) {
		userMapper.importUser(userList);
	}
	public List<UserExt> userStat() {
		return userMapper.userStat();
	}
}
