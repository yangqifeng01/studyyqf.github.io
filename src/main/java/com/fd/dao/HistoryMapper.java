package com.fd.dao;

import com.fd.model.History;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("historyMapper")
public interface HistoryMapper {
    List<History> allHistory();
    int updateHistory(History history);
    History selectHistoryById(int id);
}
