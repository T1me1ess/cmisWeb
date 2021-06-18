package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.Work;
import com.inspur.cmis.pojo.WorkExt;

public interface WorkMapper {

	public List<WorkExt> getWorkList(Map map);
	public void addWork(Work work);
	public void modifyWork(Work work);
	public void deleteWork(int[] workKey);




}
