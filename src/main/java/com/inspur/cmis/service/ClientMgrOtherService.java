package com.inspur.cmis.service;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.Assess;
import com.inspur.cmis.pojo.AssessExt;
import com.inspur.cmis.pojo.Certificate;
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

@Resource
public interface ClientMgrOtherService {
	

	//查询工作年度业绩
	public List<ClientMgrResultExt> getClientMgrResultList(Map map);
	//增加工作年度业绩
	public void addClientMgrResult(ClientMgrResult clientMgrResult);
	//修改工作年度业绩
	public void modifyCmrResult(ClientMgrResult clientMgrResult);
	//删除工作年度业绩
	public void deleteClientMgrResult(int[] cmrKeys);
	
	
	
	//查询证照信息
	public List<CertificateExt> getCertificateList(Map map);
	//添加证照信息
	public void addCertificate(Certificate certificate);
	//修改证照信息
	public void modifyCertificate(Certificate certificate);
	//删除证照信息
	public void deleteCertificate(int[] cetKey);
	
	
	//查询奖惩情况
	public List<RPRExt> getRPRList(Map map);
	//增加奖惩情况
	public void addRPR(RPR rpr);
	//修改奖惩情况
	public void modifyRPR(RPR rpr);
	//删除奖惩情况
	public void deleteRPR(int[] rprKey);
	
	
	//查询考核情况
	public List<AssessExt> getASSList(Map map);
	//添加考核情况
	public void addAssess(Assess assess);
	//修改考核情况
	public void modifyAssess(Assess assess);
	//删除考核情况
	public void deleteAssess(int[] assKey);
	
	
	//查询学习培训记录
	public List<LearnTranRecordExt> getLTRList(Map map);
	//添加学习培训记录
	public void addLTR(LearnTranRecord learnTranRecord);
	//修改学习记录
	public void modifyLTR(LearnTranRecord learnTranRecord);
	//删除学习记录
	public void deleteLTR(int[] ltrKey);
	
	
	//查询等级认定情况
	public List<LevelExt> getLevelList(Map map);
	//添加等级认定情况
	public void addLevel(Level level);
	//修改等级认定情况
	public void modifyLevel(Level level);
	//删除等级认定情况
	public void deleteLevel(int[] leKey);
	
	
	//查询工作记录
	public List<WorkExt> getWorkList(Map map);
	//添加工作记录
	public void addWork(Work work);
	//修改工作记录
	public void modifyWork(Work work);
	//删除工作记录
	public void deleteWork(int[] workKey);
	

}
