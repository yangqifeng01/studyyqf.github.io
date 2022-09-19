package com.fd.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.fd.model.Scenery;
import org.springframework.stereotype.Repository;

@Repository("sceneryMapper")
@Mapper
public interface SceneryMapper {
	//查询全部风景
	List<Scenery> allSceneries();
	//按名称查找风景
	Scenery selectSceneryByName(String name);
	//按id查找风景
	Scenery selectSceneryById(int id);
	//增加风景
	int addScenery(Scenery scenery);
	//删除风景
	int deleteScenery(String name);
	//修改风景信息
	int updateScenery(Scenery scenery);
	//修改风景审核状态
	int upSceneryState(Map<String,Object> map);
	//查找所有状态不为3的风景
	List<Scenery> selectChecking();

}	
