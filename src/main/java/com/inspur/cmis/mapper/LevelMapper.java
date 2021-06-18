package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.Level;
import com.inspur.cmis.pojo.LevelExt;

public interface LevelMapper {
	
	public List<LevelExt> getLevelList(Map map);
	public void addLevel(Level level);
	public void modifyLevel(Level level);
	public void deleteLevel(int[] leKey);




}
