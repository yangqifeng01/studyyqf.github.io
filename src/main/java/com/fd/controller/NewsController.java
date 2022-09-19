package com.fd.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fd.model.Food;
import com.fd.util.MyUtil;
import com.fd.model.News;
import com.fd.model.User;
import com.fd.service.NewsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NewsController {
    @Resource
    private NewsService newsService;

    //显示全部新闻
    @RequestMapping("/admin/newsList")
    public String newsList(HttpSession session){
        List<News> allNews = newsService.allNews();
        session.setAttribute("allNews",allNews);
        return "/admin/newslist";
    }

    @RequestMapping("/admin/newsChecking")
    @ResponseBody
    public String newsChecking() throws JsonProcessingException {
        List<News> newsList = newsService.selectChecking();
        ObjectMapper objectMapper = new ObjectMapper();
        if(newsList.size()>0){
            return objectMapper.writeValueAsString(newsList);
        }
        return "null";
    }
    //添加新闻
    @RequestMapping("/admin/addNews")
    public String addNews(@Valid News news, HttpServletRequest request, HttpSession session, BindingResult result) throws IOException {
        if (result.hasErrors()){
            return "admin/addFood";
        }
        MultipartFile file = news.getMultipartFile();
        String img = MyUtil.upload(request,file);
        if (img != null){
            news.setNewsImage(img);
        }
        User user = (User) session.getAttribute("user");
        if(user.getStatus() == 3){
            news.setState(3);
        }
        if (user.getStatus() == 2){
            news.setState(0);
        }
        Date addDate = new Date(System.currentTimeMillis());
        news.setNewsAddDate(addDate);
        news.setNewsAddId(user.getUserId());
        System.out.println(news);
        newsService.addNews(news);
        return "redirect:/admin/newsList";
    }

    //删除新闻
    @RequestMapping(value = "/admin/deleteNews",method = RequestMethod.POST)
    @ResponseBody
    public String deleteNews(@RequestParam("newsTitle") String newsTitle,HttpSession session,HttpServletRequest request){
        User user = (User) session.getAttribute("user");
        String msg = "false";
        if(user.getStatus() == 3){
            //删除之前获取该景点信息，用于删除图片
            News news = newsService.selectNewsByNewsTitle(newsTitle);
            MyUtil.deleteFile(request,news.getNewsImage());
            //删除景点
            if(newsService.deleteNews(newsTitle)>0){
                //修改session中保存的景点
                List<News> allNews = newsService.allNews();
                session.setAttribute("allNews",allNews);
                msg = "true";
            }
        }
        return msg;
    }

    //跳转到新闻信息修改界面
    @RequestMapping("/admin/toUpdateNews")
    public String toUpdateNews(@RequestParam("newsId") String newsId, Model model){
        News news = newsService.selectNewsByNewsId(Integer.parseInt(newsId));
        model.addAttribute("news",news);
        return "/admin/updatenews";
    }

    //修改新闻信息
    @RequestMapping("/admin/updateNews")
    public String updateNews(News news,HttpServletRequest request) throws IOException {
        MultipartFile file = news.getMultipartFile();
        //修改景点信息后，删除原的图片
        News oldNews = newsService.selectNewsByNewsTitle(news.getNewsTitle());
        if(!file.isEmpty()){
            MyUtil.deleteFile(request,oldNews.getNewsImage());
            String img = MyUtil.upload(request,file);
            if (img != null){
                news.setNewsImage(img);
            }
        }
        else {
            news.setNewsImage(oldNews.getNewsImage());
        }
        //修改
        if(oldNews.getState() == 3){
            news.setState(3);
        }
        //审核不通过后提交修改
        if(oldNews.getState() == 2){
            news.setState(0);
        }
        newsService.updateNews(news);
        return "redirect:/admin/newsList";
    }

    //跳转到新闻信息审核界面
    @RequestMapping("/admin/toCheckNews")
    public String toCheckFood(@RequestParam("newsId") String newsId,Model model){
        News news = newsService.selectNewsByNewsId(Integer.parseInt(newsId));
        model.addAttribute("news",news);
        return "/admin/checknews";
    }

    //超级管理员审核
    @RequestMapping(value = "/admin/checkNews",method = RequestMethod.POST)
    @ResponseBody
    public String checkScenery(@RequestParam("state") String state, @RequestParam("newsId") String newsId,@RequestParam("checkMsg") String checkMsg){
        Map<String,Object> map = new HashMap<>();
        map.put("newsId",newsId);
        map.put("state",state);
        map.put("checkMsg",checkMsg);
        System.out.println(map);
        if(newsService.updateNewsState(map) > 0 ){
            return "true";
        }
        return "false";
    }

    //按新闻标题名称查找新闻
    @RequestMapping("/admin/selectNewsByNewsTitle")
    @ResponseBody
    public String selectNewsByNewsTitle(@RequestParam("newsTitle") String newsTitle) throws JsonProcessingException {
        News news = newsService.selectNewsByNewsTitle(newsTitle);
        ObjectMapper objectMapper = new ObjectMapper();
        if(news!=null){
            String json = objectMapper.writeValueAsString(news);
            System.out.println(json);
            return json;
        }else {
            return "false";
        }
    }

    //分页
    @RequestMapping("/admin/fenYe4")
    public String fenYe(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,@RequestParam(value = "pageSize",defaultValue = "5") int pageSize,Model model){
        //根据前端选择的当前页和页大小
        PageHelper.startPage(pageNum, pageSize);
        //获取所有的景点数据
        List<News> news = newsService.allNews();
        //将景点按前前面放入的参数截取
        PageInfo<News> pageInfo = new PageInfo<News>(news);
        //将分好页的数据传回给前端
        List<News> allNews = pageInfo.getList();
        model.addAttribute("allNews",allNews);
        //将分页信息传回给前端
        model.addAttribute("pageInfo",pageInfo);
        return "/admin/newslist";
    }

    //前端按新闻类型分类
    @RequestMapping("/selectNewsByNewsTypes")
    public String selectNewsByNewsTypes(@RequestParam("newsTypes") String newsTypes,Model model){
        System.out.println(newsTypes);
        List<News> newsList = newsService.selectNewsByNewsTypes(Integer.parseInt(newsTypes));
        if(newsList != null){
            model.addAttribute("newsList",newsList);
        }
        return "/template/news";
    }

    //前台按id查找新闻
    @RequestMapping("/selectNewsByNewsId")
    public String selectNewsByNewsId(@RequestParam("newsId") String newId,Model model){
        News news = newsService.selectNewsByNewsId(Integer.parseInt(newId));
        if(news != null){
            model.addAttribute("news",news);
        }
        return "/template/newsdetail";
    }
}
