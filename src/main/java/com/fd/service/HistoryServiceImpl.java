package com.fd.service;

import com.fd.dao.HistoryMapper;
import com.fd.model.History;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("historyService")
public class HistoryServiceImpl implements HistoryService {
    @Resource
    private HistoryMapper historyMapper;
    @Override
    public List<History> allHistory() {
        return historyMapper.allHistory();
    }

    @Override
    public int updateHistory(History history) {
        return historyMapper.updateHistory(history);
    }

    @Override
    public History selectHistoryById(int id) {
        return historyMapper.selectHistoryById(id);
    }
}
