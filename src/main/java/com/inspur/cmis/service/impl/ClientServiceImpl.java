package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.ClientMapper;
import com.inspur.cmis.pojo.Client;
import com.inspur.cmis.pojo.ClientExt;
import com.inspur.cmis.service.ClientService;

@Service("clientService")
public class ClientServiceImpl implements ClientService{
	
	@Autowired
	private ClientMapper clientMapper;

	@Override
	public List<ClientExt> getClientList(Map map) {
		// TODO Auto-generated method stub
		return clientMapper.getClientList(map);
	}

	@Override
	public void addClient(Client client) {
		// TODO Auto-generated method stub
		clientMapper.addClient(client);
	}

	@Override
	public void updateClient(Client client) {
		// TODO Auto-generated method stub
		clientMapper.updateClient(client);
		
	}

	@Override
	public void deleteClient(int[] ckey) {
		// TODO Auto-generated method stub
		clientMapper.deleteClient(ckey);
		
	}

}
