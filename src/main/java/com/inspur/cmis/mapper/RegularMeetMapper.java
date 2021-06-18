package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.RegularMeet;

public interface RegularMeetMapper {
	
	public List<RegularMeet> getRegularMeetList(Map map);
	public void addRegularMeet(RegularMeet regularMeet);
	public void updateRegularMeet(RegularMeet  regularMeet );
	public void deleteRegularMeet(int[] keys);





}
