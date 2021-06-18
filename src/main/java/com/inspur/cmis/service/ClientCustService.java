package com.inspur.cmis.service;

import java.util.List;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.ClientCustExt;

@Resource
public interface ClientCustService {
	
	//统计每个客户经理名下资金的状况
	public List<ClientCustExt> finceStatByMgr();

}
