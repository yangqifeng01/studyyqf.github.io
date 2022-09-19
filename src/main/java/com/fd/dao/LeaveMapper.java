package com.fd.dao;

import com.fd.model.Leave;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("leaveMapper")
public interface LeaveMapper {
    List<Leave> leaveList();

    int addLeave(Leave leave);

    int delete(int leaveId);
}
