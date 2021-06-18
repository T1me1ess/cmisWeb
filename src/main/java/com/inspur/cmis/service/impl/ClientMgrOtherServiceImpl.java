package com.inspur.cmis.service.impl;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.pojo.Assess;
import com.inspur.cmis.pojo.AssessExt;
import com.inspur.cmis.pojo.Certificate;
import com.inspur.cmis.mapper.AssessMapper;
import com.inspur.cmis.mapper.CertificateMapper;
import com.inspur.cmis.mapper.ClientMgrResultMapper;
import com.inspur.cmis.mapper.LTRMapper;
import com.inspur.cmis.mapper.LevelMapper;
import com.inspur.cmis.mapper.RPRMapper;
import com.inspur.cmis.mapper.WorkMapper;
import com.inspur.cmis.pojo.CertificateExt;
import com.inspur.cmis.pojo.ClientMgrResult;
import com.inspur.cmis.pojo.ClientMgrResultExt;
import com.inspur.cmis.pojo.LearnTranRecord;
import com.inspur.cmis.pojo.LearnTranRecordExt;
import com.inspur.cmis.pojo.Level;
import com.inspur.cmis.pojo.LevelExt;
import com.inspur.cmis.pojo.RPR;
import com.inspur.cmis.pojo.RPRExt;
import com.inspur.cmis.pojo.Work;
import com.inspur.cmis.pojo.WorkExt;
import com.inspur.cmis.service.ClientMgrOtherService;

@Service("clientMgrOtherService")
public class ClientMgrOtherServiceImpl implements ClientMgrOtherService{
	
	//工作年度业绩
	@Autowired
	private ClientMgrResultMapper clientMgrResultMapper;
	
	@Override
	public List<ClientMgrResultExt> getClientMgrResultList(Map map) {
		// TODO Auto-generated method stub
		return clientMgrResultMapper.getClientMgrResultList(map);
	}

	@Override
	public void addClientMgrResult(ClientMgrResult clientMgrResult) {
		// TODO Auto-generated method stub
		clientMgrResultMapper.addClientMgrResult(clientMgrResult);
	}

	@Override
	public void modifyCmrResult(ClientMgrResult clientMgrResult) {
		// TODO Auto-generated method stub
		clientMgrResultMapper.modifyCmrResult(clientMgrResult);
	}
	
	@Override
	public void deleteClientMgrResult(int[] cmrKeys) {
		// TODO Auto-generated method stub
		clientMgrResultMapper.deleteClientMgrResult(cmrKeys);
		
	}
	
	
	//证书列表
		@Autowired
		private CertificateMapper certificateMapper;
	@Override
	public List<CertificateExt> getCertificateList(Map map) {
		// TODO Auto-generated method stub
		return certificateMapper.getCertificateList(map);
	}

	@Override
	public void addCertificate(Certificate certificate) {
		// TODO Auto-generated method stub
	  certificateMapper.addCertificate(certificate);	
	}
	@Override
	public void modifyCertificate(Certificate certificate) {
		// TODO Auto-generated method stub
	    certificateMapper.modifyCertificate(certificate);
		
	}
	@Override
	public void deleteCertificate(int[] cetKey) {
		// TODO Auto-generated method stub
		certificateMapper.deleteCertificate(cetKey);
		
	}
	
	//奖惩情况
	@Autowired
	private RPRMapper rPRMapper;
	
	@Override
	public List<RPRExt> getRPRList(Map map) {
		// TODO Auto-generated method stub
		return rPRMapper.getRPRList(map);
	}

	@Override
	public void addRPR(RPR rpr) {
		// TODO Auto-generated method stub
		rPRMapper.addRPR(rpr);
		
	}

	@Override
	public void modifyRPR(RPR rpr) {
		// TODO Auto-generated method stub
	rPRMapper.modifyRPR(rpr);
		
	}

	@Override
	public void deleteRPR(int[] rprKey) {
		// TODO Auto-generated method stub
		rPRMapper.deleteRPR(rprKey);
		
	}
	
	//考核情况
	@Autowired
	private AssessMapper assessMapper;
	
	@Override
	public List<AssessExt> getASSList(Map map) {
		// TODO Auto-generated method stub
		return assessMapper.getASSList(map);
	}

	@Override
	public void addAssess(Assess assess) {
		// TODO Auto-generated method stub
		assessMapper.addAssess(assess);
		
	}

	@Override
	public void modifyAssess(Assess assess) {
		// TODO Auto-generated method stub
		assessMapper.modifyAssess(assess);
		
	}

	@Override
	public void deleteAssess(int[] assKey) {
		// TODO Auto-generated method stub
		assessMapper.deleteAssess(assKey);
		
	}
	
	//学习培训记录
	@Autowired
	private LTRMapper ltrMapper;
	
	@Override
	public List<LearnTranRecordExt> getLTRList(Map map) {
		// TODO Auto-generated method stub
		return ltrMapper.getLTRList(map);
	}

	@Override
	public void addLTR(LearnTranRecord learnTranRecord) {
		// TODO Auto-generated method stub
		ltrMapper.addLTR(learnTranRecord);
		
	}

	@Override
	public void modifyLTR(LearnTranRecord learnTranRecord) {
		// TODO Auto-generated method stub
		ltrMapper.modifyLTR(learnTranRecord);
		
	}

	@Override
	public void deleteLTR(int[] ltrKey) {
		// TODO Auto-generated method stub
		ltrMapper.deleteLTR(ltrKey);
		
	}
	
	
	
   //等级认定记录表
	@Autowired
	private LevelMapper levelMapper;

	@Override
	public List<LevelExt> getLevelList(Map map) {
		// TODO Auto-generated method stub
		return levelMapper.getLevelList(map);
	}

	@Override
	public void addLevel(Level level) {
		// TODO Auto-generated method stub
		levelMapper.addLevel(level);
		
	}

	@Override
	public void modifyLevel(Level level) {
		// TODO Auto-generated method stub
		levelMapper.modifyLevel(level);
		
	}

	@Override
	public void deleteLevel(int[] leKey) {
		// TODO Auto-generated method stub
		levelMapper.deleteLevel(leKey);
		
	}
	
	
	
   //工作经历
	@Autowired
	private WorkMapper workMapper;

	@Override
	public List<WorkExt> getWorkList(Map map) {
		// TODO Auto-generated method stub
		return workMapper.getWorkList(map);
	}

	@Override
	public void addWork(Work work) {
		// TODO Auto-generated method stub
		workMapper.addWork(work);
	}
	
	@Override
	public void modifyWork(Work work) {
		// TODO Auto-generated method stub
		workMapper.modifyWork(work);
	}
	
	@Override
	public void deleteWork(int[] workKey) {
		// TODO Auto-generated method stub
		workMapper.deleteWork(workKey);
	}
	


	




	
	

}
