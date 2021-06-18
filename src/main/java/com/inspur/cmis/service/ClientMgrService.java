package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.inspur.cmis.pojo.ClientManager;

@Resource
public interface ClientMgrService {
	
	//查询客户经理的信息
	public List<ClientManager> getClientManagerList(Map map);
	//增加客户经理的信息
	public void addClientMgr(ClientManager clientManager);
	//修改客户经理的信息
	public void updateClientMgr(ClientManager clientManager);
	//删除客户经理的信息
	public void deleteClientMgr(int[] cmId);
	//批量添加客户信息
	public void importClientMgrList(List<ClientManager> list);

}
