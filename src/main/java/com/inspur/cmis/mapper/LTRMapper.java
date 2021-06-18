package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.LearnTranRecord;
import com.inspur.cmis.pojo.LearnTranRecordExt;

public interface LTRMapper {

	public List<LearnTranRecordExt> getLTRList(Map map);
	public void addLTR(LearnTranRecord learnTranRecord);
	public void modifyLTR(LearnTranRecord learnTranRecord);
	public void deleteLTR(int[] ltrKey);



}
