package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.CMWorkMapper;
import com.inspur.cmis.mapper.ClientMgrMapper;
import com.inspur.cmis.pojo.ClientManager;
import com.inspur.cmis.service.ClientMgrService;

@Service("clientMgrService")
public class ClientMgrServiceImpl implements ClientMgrService {
	
	@Autowired
	private ClientMgrMapper clientMgrMapper;

	@Override
	public List<ClientManager> getClientManagerList(Map map) {
		// TODO Auto-generated method stub
		return clientMgrMapper.getClientManagerList(map);
	}

	@Override
	public void addClientMgr(ClientManager clientManager) {
		// TODO Auto-generated method stub
		clientMgrMapper.addClientMgr(clientManager);
		
	}

	@Override
	public void updateClientMgr(ClientManager clientManager) {
		// TODO Auto-generated method stub
	   clientMgrMapper.updateClientMgr(clientManager);
	}

	@Override
	public void deleteClientMgr(int[] cmId) {
		// TODO Auto-generated method stub
		clientMgrMapper.deleteClientMgr(cmId);
	}

	@Override
	public void importClientMgrList(List<ClientManager> list) {
		// TODO Auto-generated method stub
		clientMgrMapper.importClientMgrList(list);
		
	}

}
