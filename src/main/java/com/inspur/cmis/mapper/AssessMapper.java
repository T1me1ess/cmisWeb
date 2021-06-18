package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.Assess;
import com.inspur.cmis.pojo.AssessExt;


public interface AssessMapper {

	public List<AssessExt> getASSList(Map map);
	public void addAssess(Assess assess);
	public void modifyAssess(Assess assess);
	public void deleteAssess(int[] assKey);



	
}
