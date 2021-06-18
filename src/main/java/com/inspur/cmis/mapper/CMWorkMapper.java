package com.inspur.cmis.mapper;

import java.util.List;

import java.util.Map;

import com.inspur.cmis.pojo.CMWork;

public interface CMWorkMapper {
	
	public List<CMWork> getCMWorkList(Map map);
	public void addCMWork(CMWork cmWork);
	public void updateCMWork(CMWork cmWork);
	public void deleteCMWork(int[] keys);




}
