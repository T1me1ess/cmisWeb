package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.Client;
import com.inspur.cmis.pojo.ClientExt;

public interface ClientMapper {
	public List<ClientExt> getClientList(Map map);
	public void addClient(Client client);
	public void updateClient(Client client);
	public void deleteClient(int[] ckey);


}
