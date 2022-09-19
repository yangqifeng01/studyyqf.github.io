package com.fd.service;

import com.fd.model.Leave;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("leaveService")
public interface LeaveService {
    List<Leave> leaveList();

    int addLeave(Leave leave);

    int delete(int leaveId);
}
