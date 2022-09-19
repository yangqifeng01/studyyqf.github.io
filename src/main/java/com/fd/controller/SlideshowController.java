package com.fd.controller;

import com.fd.util.MyUtil;
import com.fd.model.Slideshow;
import com.fd.model.User;
import com.fd.service.SlideshowService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

@Controller
public class SlideshowController {
    @Resource
    private SlideshowService slideshowService;

    //后台显示轮播图
    @RequestMapping("/admin/slideshowList")
    public String slideshowList(HttpSession session){
        List<Slideshow> allSlideshows = slideshowService.allSlideshows();
        session.setAttribute("allSlideshows",allSlideshows);
        return "/admin/slideshowlist";
    }
    //前台展示轮播图
    @RequestMapping("/showSlideshow")
    public String showSlideshow(HttpSession session){
        List<Slideshow> slideshowList = slideshowService.allSlideshows();
        session.setAttribute("slideshowList",slideshowList);
        return "redirect:/indexShowSceneryList";
    }

    //增加轮播图
    @RequestMapping("/admin/addSlideshow")
    public String addSlideshow(@Valid Slideshow slideshow, BindingResult result, HttpServletRequest request){
        if (result.hasErrors()){
            return "admin/addslideshow";
        }
        try {
            MultipartFile file = slideshow.getMultipartFile();
            String img = MyUtil.upload(request,file);
            if (img != null){
                slideshow.setImageName(img);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        Date adddate = new Date(System.currentTimeMillis());
        User user = (User) request.getSession().getAttribute("user");
        slideshow.setImageAddDate(adddate);
        slideshow.setImageAddId(user.getUserId());
        System.out.println(slideshow);
        slideshowService.addSlideshow(slideshow);
        return "redirect:/admin/slideshowList";
    }

    //删除轮播图
    @RequestMapping(value = "/admin/deleteSlideshow")
    @ResponseBody
    public String deleteSlideshow(@RequestBody Map<String,String> map, HttpServletRequest request){
        String msg = "false";
        System.out.println(map);
        //删除之前获取该轮播图信息，用于删除服务器上的图片
        MyUtil.deleteFile(request,map.get("imageName"));
        //删除数据库中该轮播图的信息
        if(slideshowService.deleteSlideshow(Integer.parseInt(map.get("imageId")))>0){
            //修改session中保存的景点
            List<Slideshow> allSlideshows = slideshowService.allSlideshows();
            request.getSession().setAttribute("allSlideshows",allSlideshows);
            msg = "true";
        }
        return msg;
    }
}
