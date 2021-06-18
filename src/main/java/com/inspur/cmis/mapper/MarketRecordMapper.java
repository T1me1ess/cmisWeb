package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.MarketRecord;

public interface MarketRecordMapper {
    public List<MarketRecord> getMarketRecordList(Map map);
    public void addMarketRecord(MarketRecord marketRecord);
    public void updateMarketRecord(MarketRecord marketRecord);
    public void deleteMarketRecord(int[] mrKeys);





}
