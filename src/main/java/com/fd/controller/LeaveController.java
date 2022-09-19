package com.fd.controller;

import com.fd.model.Comment;
import com.fd.model.Leave;
import com.fd.service.LeaveService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

@Controller
public class LeaveController {
    @Resource
    private LeaveService leaveService;

    //后台留言列表
    @RequestMapping("/admin/leaveList")
    public String leaveList(HttpSession session){
        List<Leave> allLeave = leaveService.leaveList();
        System.out.println(allLeave);
        for (Leave leave : allLeave) {
            System.out.println(leave);
        }
        session.setAttribute("allLeave", allLeave);
        return "/admin/leave_list";
    }

    //增加留言
    @RequestMapping(value = "/addLeave", method = RequestMethod.POST)
    @ResponseBody
    public String addLeave(Leave leave){
        Timestamp adddate = new Timestamp(System.currentTimeMillis());
        leave.setLeaveDate(adddate);
        System.out.println("=========================");
        System.out.println(leave);
        System.out.println("=========================");
        if(leaveService.addLeave(leave) > 0){
            return "true";
        }
        return "false";
    }

    //管理员删除评论
    @RequestMapping(value = "/admin/deleteLeave",method = RequestMethod.POST)
    @ResponseBody
    public String deleteLeave(String leaveId,HttpSession session){
        if(leaveService.delete(Integer.parseInt(leaveId)) > 0){
            List<Leave> allLeave = leaveService.leaveList();
            session.setAttribute("allLeave", allLeave);
            return "true";
        }
        return "false";
    }
}
