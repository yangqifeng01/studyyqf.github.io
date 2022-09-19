package com.fd.service;

import com.fd.model.History;

import java.util.List;

public interface HistoryService {
    List<History> allHistory();
    int updateHistory(History history);
    History selectHistoryById(int id);
}
