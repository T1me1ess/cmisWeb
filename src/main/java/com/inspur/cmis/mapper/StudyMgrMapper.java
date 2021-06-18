package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.StudyManager;

public interface StudyMgrMapper {
	public List<StudyManager> getStudyMgrList(Map map);
	public void addStudyMgr(StudyManager studyManager);
	public void updateStudyMgr(StudyManager studyManager);
	public void deleteStudyMgr(int[] lKeys);





}
