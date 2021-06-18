package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import com.inspur.cmis.pojo.CMWork;

@Resource
public interface CMWorkService {
	
	//默认查询或者根据编号和录入日期查询
		public List<CMWork> getCMWorkList(Map map);
	//添加客户经理的工作记录
		public void addCMWork(CMWork cmWork);
	//修改选定的工作记录
		public void updateCMWork(CMWork cmWork);
    //删除选型的工作记录
		public void deleteCMWork(int[] keys);
	
}
