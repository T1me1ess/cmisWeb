package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.ClientMgrResult;
import com.inspur.cmis.pojo.ClientMgrResultExt;
//工作年度业绩
public interface ClientMgrResultMapper {
	
	
	public List<ClientMgrResultExt> getClientMgrResultList(Map Map);
	public void addClientMgrResult(ClientMgrResult clientMgrResult);
	public void modifyCmrResult(ClientMgrResult clientMgrResult);
	public void deleteClientMgrResult(int[] cmrKeys);



}
