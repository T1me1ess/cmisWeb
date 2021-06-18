package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.CMWorkMapper;
import com.inspur.cmis.pojo.CMWork;
import com.inspur.cmis.service.CMWorkService;


@Service("cmWorkService")

public class CMWorkServiceImpl implements CMWorkService{
	
	@Autowired
	private CMWorkMapper cmWorkMapper;

	@Override
	public List<CMWork> getCMWorkList(Map map) {
		// TODO Auto-generated method stub
		List<CMWork> list=cmWorkMapper.getCMWorkList(map);
		return list;
	}

	@Override
	public void addCMWork(CMWork cmWork) {
		// TODO Auto-generated method stub
		cmWorkMapper.addCMWork(cmWork);
	}

	@Override
	public void updateCMWork(CMWork cmWork) {
		// TODO Auto-generated method stub
		cmWorkMapper.updateCMWork(cmWork);
		
	}

	@Override
	public void deleteCMWork(int[] keys) {
		// TODO Auto-generated method stub
		cmWorkMapper.deleteCMWork(keys);
		
	}

}
