package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.RPR;
import com.inspur.cmis.pojo.RPRExt;

public interface RPRMapper {	
	
	
	public List<RPRExt> getRPRList(Map map);
	public void addRPR(RPR rpr);
	public void modifyRPR(RPR rpr);
	public void deleteRPR(int[] rprKey);




}
