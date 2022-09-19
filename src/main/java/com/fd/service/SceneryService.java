package com.fd.service;

import java.util.List;
import java.util.Map;

import com.fd.model.Scenery;

public interface SceneryService {
	//查询全部风景信息并将其列出来
	List<Scenery> allSceneries();
	//按名称查询某一个风景
	Scenery selectSceneryByName(String name);
	//按id查询风景
	Scenery selectSceneryById(int id);
	//增加一个风景
	int addScenery(Scenery scenery);
	//按名称删除风景
	int deleteScenery(String name);
	//修改风景信息
	int updateScenery(Scenery scenery);
	//修改风景状态
	int upSceneryState(Map<String,Object> map);
	//查找所有状态不为3的风景
	List<Scenery> selectChecking();

}
