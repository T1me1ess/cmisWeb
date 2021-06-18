package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.RegularMeet;

@Resource
public interface RegularMeetService {
  
	//默认查询和按条件查询获得会议记录
	public List<RegularMeet> getRegularMeetList(Map map);
	//添加会议记录
	public void addRegularMeet(RegularMeet regularMeet);
	//修改会议记录
	public void updateRegularMeet(RegularMeet regularMeet);
	//删除会议记录
	public void deleteRegularMeet(int[] keys);
}
