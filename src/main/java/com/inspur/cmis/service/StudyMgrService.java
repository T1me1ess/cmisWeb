package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.StudyManager;

@Resource
public interface StudyMgrService {
	
	//查询学习园地
	public List<StudyManager> getStudyMgrList(Map map);
	//增加学习资料
	public void addStudyMgr(StudyManager studyManager); 
	//修改学习资料
	public void updateStudyMgr(StudyManager studyManager);
	//删除学习资料
	public void deleteStudyMgr(int[] lKeys);

}
