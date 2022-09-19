package com.fd.service;
import java.util.List;
import java.util.Map;

import com.fd.dao.SceneryMapper;
import com.fd.model.Scenery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("sceneryService")
public class SecneryServiceImpl implements SceneryService {
	
	@Resource
	private SceneryMapper sceneryMapper; 
	
	@Override
	public List<Scenery> allSceneries() {
		return sceneryMapper.allSceneries();
	}

	@Override
	public Scenery selectSceneryByName(String name) {
		return sceneryMapper.selectSceneryByName(name);
	}

	@Override
	public Scenery selectSceneryById(int id){
		return sceneryMapper.selectSceneryById(id);
	}

	@Override
	public int addScenery(Scenery scenery) {
		return sceneryMapper.addScenery(scenery);
	}

	@Override
	public int deleteScenery(String name) {
		return sceneryMapper.deleteScenery(name);
	}

	@Override
	public int updateScenery(Scenery scenery) {
		return sceneryMapper.updateScenery(scenery);
	}

	@Override
	public int upSceneryState(Map<String, Object> map) {
		return sceneryMapper.upSceneryState(map);
	}

	@Override
	public List<Scenery> selectChecking() {
		return sceneryMapper.selectChecking();
	}

}
