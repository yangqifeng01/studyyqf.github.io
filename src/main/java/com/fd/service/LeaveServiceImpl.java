package com.fd.service;

import com.fd.dao.LeaveMapper;
import com.fd.model.Leave;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("leaveService")
public class LeaveServiceImpl implements LeaveService{
    @Resource
    private LeaveMapper leaveMapper;
    @Override
    public List<Leave> leaveList() {
        return leaveMapper.leaveList();
    }

    @Override
    public int addLeave(Leave leave) {
        return leaveMapper.addLeave(leave);
    }

    @Override
    public int delete(int leaveId) {
        return leaveMapper.delete(leaveId);
    }
}
