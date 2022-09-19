package com.fd.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;

public class Leave {
    private int id;
    private String leaveName;
    private String leavePhone;
    private int leaveSex;
    private String LeaveContent;

    @JsonFormat(timezone = "UTC",pattern = "yyyy-MM-dd")
    private Timestamp leaveDate;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getLeaveName() {
        return leaveName;
    }

    public void setLeaveName(String leaveName) {
        this.leaveName = leaveName;
    }


    public String getLeaveContent() {
        return LeaveContent;
    }

    public void setLeaveContent(String leaveContent) {
        LeaveContent = leaveContent;
    }

    public String getLeavePhone() {
        return leavePhone;
    }

    public void setLeavePhone(String leavePhone) {
        this.leavePhone = leavePhone;
    }

    public int getLeaveSex() {
        return leaveSex;
    }

    public void setLeaveSex(int leaveSex) {
        this.leaveSex = leaveSex;
    }

    public Timestamp getLeaveDate() {
        return leaveDate;
    }

    public void setLeaveDate(Timestamp leaveDate) {
        this.leaveDate = leaveDate;
    }

    @Override
    public String toString() {
        return "Leave{" +
                "id=" + id +
                ", leaveName='" + leaveName + '\'' +
                ", leavePhone='" + leavePhone + '\'' +
                ", leaveSex=" + leaveSex +
                ", LeaveContent='" + LeaveContent + '\'' +
                ", leaveDate=" + leaveDate +
                '}';
    }
}
