package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.StudyMgrMapper;
import com.inspur.cmis.pojo.StudyManager;
import com.inspur.cmis.service.StudyMgrService;

@Service("studyMgrService")
public class StudyMgrServiceImpl implements StudyMgrService{
	
	@Autowired
	private StudyMgrMapper studyMgrMapper;

	@Override
	public List<StudyManager> getStudyMgrList(Map map) {
		// TODO Auto-generated method stub
		return studyMgrMapper.getStudyMgrList(map);
	}

	@Override
	public void addStudyMgr(StudyManager studyManager) {
		// TODO Auto-generated method stub
		studyMgrMapper.addStudyMgr(studyManager);
		
	}

	@Override
	public void updateStudyMgr(StudyManager studyManager) {
		// TODO Auto-generated method stub
		studyMgrMapper.updateStudyMgr(studyManager);
		
	}

	@Override
	public void deleteStudyMgr(int[] lKeys) {
		// TODO Auto-generated method stub
		studyMgrMapper.deleteStudyMgr(lKeys);
		
	}

}
