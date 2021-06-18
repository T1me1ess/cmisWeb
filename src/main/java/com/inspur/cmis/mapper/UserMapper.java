package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.User;
import com.inspur.cmis.pojo.UserExt;

public interface UserMapper {
	public User getUser(User user);
	public List<User> getUserList(Map map);
	public void deleteUsers(int userIds[]);
	public void operateUsers(Map map);
	public void addUser(User user);
	public List<User> getUserByUserName(String username);
	public void updateUsers(User user);
	public void updateLastTime(User user);
	public void importUser(List<User> userList);
	public List<UserExt> userStat();



}
