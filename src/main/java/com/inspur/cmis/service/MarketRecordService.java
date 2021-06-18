package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.MarketRecord;

@Resource
public interface MarketRecordService {

	//按条件查询或者默认查询营销记录
    public List<MarketRecord> getMarketRecordList(Map map);
    //增加营销记录
    public void addMarketRecord(MarketRecord marketRecord);
    //修改营销记录
    public void updateMarketRecord(MarketRecord marketRecord);
    //删除经营记录
    public void deleteMarketRecord(int[] mrKeys);
}
