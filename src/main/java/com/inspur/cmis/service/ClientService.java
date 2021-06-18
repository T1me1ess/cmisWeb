package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;

import com.inspur.cmis.pojo.Client;
import com.inspur.cmis.pojo.ClientExt;

@Resource
public interface ClientService {
	
	//查询客户的信息（默认全查询和按条件查询）
	public List<ClientExt> getClientList(Map map);
	//增加客户信息
	public void addClient(Client client);
	//修改客户信息
	public void updateClient(Client client);
	//删除客户信息
	public void deleteClient(int[] ckey);

}
