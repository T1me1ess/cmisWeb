package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.RegularMeetMapper;
import com.inspur.cmis.pojo.RegularMeet;
import com.inspur.cmis.service.RegularMeetService;

@Service("regularMeetService")

public class RegularMeetServiceImpl implements RegularMeetService {
	
	@Autowired
	private RegularMeetMapper regularMeetMapper;

	@Override
	public List<RegularMeet> getRegularMeetList(Map map) {
		// TODO Auto-generated method stub
		return regularMeetMapper.getRegularMeetList(map);
	}

	@Override
	public void addRegularMeet(RegularMeet regularMeet) {
		// TODO Auto-generated method stub
		regularMeetMapper.addRegularMeet(regularMeet);
		
	}

	@Override
	public void updateRegularMeet(RegularMeet regularMeet) {
		// TODO Auto-generated method stub
		regularMeetMapper.updateRegularMeet(regularMeet);
	}

	@Override
	public void deleteRegularMeet(int[] keys) {
		// TODO Auto-generated method stub
		regularMeetMapper.deleteRegularMeet(keys);
		
	}

}
