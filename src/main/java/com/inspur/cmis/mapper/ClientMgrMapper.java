package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.ClientManager;

public interface ClientMgrMapper {
	
	public List<ClientManager> getClientManagerList(Map map);
	public void addClientMgr(ClientManager clientManager);
	public void updateClientMgr(ClientManager clientManager);
	public void deleteClientMgr(int[] cmId);
	public void importClientMgrList(List<ClientManager> list);






}
