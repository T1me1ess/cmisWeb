package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.MarketRecordMapper;
import com.inspur.cmis.pojo.MarketRecord;
import com.inspur.cmis.service.MarketRecordService;

@Service("marketRecordService")
public class MarketRecordServiceImpl implements MarketRecordService{
	@Autowired
	private MarketRecordMapper marketRecordMapper;

	@Override
	public List<MarketRecord> getMarketRecordList(Map map) {
		// TODO Auto-generated method stub
		return marketRecordMapper.getMarketRecordList(map);
	}

	@Override
	public void addMarketRecord(MarketRecord marketRecord) {
		// TODO Auto-generated method stub
		marketRecordMapper.addMarketRecord(marketRecord);
		
	}

	@Override
	public void updateMarketRecord(MarketRecord marketRecord) {
		// TODO Auto-generated method stub
		marketRecordMapper.updateMarketRecord(marketRecord);
		
	}

	@Override
	public void deleteMarketRecord(int[] mrKeys) {
		// TODO Auto-generated method stub
		marketRecordMapper.deleteMarketRecord(mrKeys);
	}

}
