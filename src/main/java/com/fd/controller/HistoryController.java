package com.fd.controller;

import com.fd.model.History;
import com.fd.service.HistoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HistoryController {
    @Resource
    private HistoryService historyService;

    //后台
    @RequestMapping("/admin/allHistory")
    public String allHistory(HttpSession session){
        List<History> allHistory = historyService.allHistory();
        session.setAttribute("allHistory",allHistory);
        return "/admin/historylist";
    }

    //前台
    @RequestMapping("/allHistory")
    public String allHistory2(HttpSession session){
        List<History> indexHistory = historyService.allHistory();
        session.setAttribute("indexHistory",indexHistory);
        return "/index";
    }

    //前台详细信息展示
    @RequestMapping("/selectHistoryById")
    public String selectHistoryById(@RequestParam("id") String id, Model model){
        History history = historyService.selectHistoryById(Integer.parseInt(id));
        if(history != null){
            model.addAttribute("history",history);
        }
        return "/template/history";
    }

}
