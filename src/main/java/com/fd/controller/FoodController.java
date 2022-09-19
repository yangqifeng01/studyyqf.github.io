package com.fd.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fd.model.Scenery;
import com.fd.util.MyUtil;
import com.fd.model.Food;
import com.fd.model.User;
import com.fd.service.FoodService;
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
public class FoodController {
    @Resource
    private FoodService foodService;

    //美食列表
    @RequestMapping("/admin/foodList")
    public String foodList(HttpSession session){
        List<Food> allFoods = foodService.allFoods();
        session.setAttribute("allFoods",allFoods);
        return "/admin/foodlist";
    }

    //返回所有状态不为3的风景
    @RequestMapping("/admin/foodChecking")
    @ResponseBody
    public String foodChecking() throws JsonProcessingException {
        List<Food> foodList = foodService.selectChecking();
        ObjectMapper objectMapper = new ObjectMapper();
        if(foodList.size()>0){
            return objectMapper.writeValueAsString(foodList);
        }
        return "null";
    }

    //增加美食
    @RequestMapping("/admin/addFood")
    public String addFood(@Valid Food food,HttpServletRequest request,HttpSession session,BindingResult result) throws IOException {
        if (result.hasErrors()){
            return "admin/addFood";
        }
        MultipartFile file = food.getMultipartFile();
        String img = MyUtil.upload(request,file);
        if (img != null){
            food.setFoodImage(img);
        }
        User user = (User) session.getAttribute("user");
        if(user.getStatus() == 3){
            food.setState(3);
        }
        if (user.getStatus() == 2){
            food.setState(0);
        }
        Date adddate = new Date(System.currentTimeMillis());
        food.setAddDate(adddate);
        food.setAuthorId(user.getUserId());
        System.out.println(food);
        foodService.addFood(food);
        return "redirect:/admin/foodList";
    }

    //删除美食
    @RequestMapping(value = "/admin/deleteFood",method = RequestMethod.POST)
    @ResponseBody
    public String deleteFood(@RequestParam("foodName") String foodName,HttpSession session,HttpServletRequest request){
        User user = (User) session.getAttribute("user");
        String msg = "false";
        if(user.getStatus() == 3){
            //删除之前获取该景点信息，用户删除图片
            Food food = foodService.selectFoodByFoodName(foodName);
            MyUtil.deleteFile(request,food.getFoodImage());
            //删除景点
            if(foodService.deleteFood(foodName)>0){
                //修改session中保存的景点
                List<Food> allFoods = foodService.allFoods();
                session.setAttribute("allFoods",allFoods);
                msg = "true";
            }
        }
        return msg;
    }

    //跳转到美食信息修改界面
    @RequestMapping("/admin/toUpdateFood")
    public String toUpdateScenery(@RequestParam("foodId") String foodId, Model model){
        Food food = foodService.selectFoodByFoodId(Integer.parseInt(foodId));
        model.addAttribute("food",food);
        return "/admin/updatefood";
    }

    //修改美食信息
    @RequestMapping("/admin/updateFood")
    public String updateScenery(Food food,HttpServletRequest request) throws IOException {
        MultipartFile file = food.getMultipartFile();
        //修改美食信息后，如果改变图片则删除原图片
        Food oldFood = foodService.selectFoodByFoodName(food.getFoodName());
        if(!file.isEmpty()){
            MyUtil.deleteFile(request,food.getFoodImage());
            String img = MyUtil.upload(request,file);
            if (img != null){
                food.setFoodImage(img);
            }
        }
        else {
            food.setFoodImage(oldFood.getFoodImage());
        }
        //修改
        if(oldFood.getState() == 3){
            food.setState(3);
        }
        //审核不通过后提交修改
        if(oldFood.getState() == 2){
            food.setState(0);
        }
        System.out.println(food);
        foodService.updateFood(food);
        return "redirect:/admin/foodList";
    }

    //跳转到美食信息审核界面
    @RequestMapping("/admin/toCheckFood")
    public String toCheckFood(@RequestParam("foodId") String foodId,Model model){
        Food food = foodService.selectFoodByFoodId(Integer.parseInt(foodId));
        model.addAttribute("food",food);
        return "/admin/checkfood";
    }

    //超级管理员审核
    @RequestMapping(value = "/admin/checkFood",method = RequestMethod.POST)
    @ResponseBody
    public String checkScenery(@RequestParam("state") String state, @RequestParam("foodId") String foodId,@RequestParam("checkMsg") String checkMsg){
        Map<String,Object> map = new HashMap<>();
        map.put("foodId",foodId);
        map.put("state",state);
        map.put("checkMsg",checkMsg);
        System.out.println(map);
        if(foodService.updateFoodState(map) > 0 ){
            return "true";
        }
        return "false";
    }

    //按美食名称查找美食
    @RequestMapping("/admin/selectFoodByFoodName")
    @ResponseBody
    public String selectFoodByFoodName(@RequestParam("foodName") String foodName) throws JsonProcessingException {
        Food food = foodService.selectFoodByFoodName(foodName);
        ObjectMapper objectMapper = new ObjectMapper();
        if(food!=null){
            String json = objectMapper.writeValueAsString(food);
            System.out.println(json);
            return json;
        }else {
            return "false";
        }
    }

    //分页
    @RequestMapping("/admin/fenYe3")
    public String fenYe(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,@RequestParam(value = "pageSize",defaultValue = "5") int pageSize,Model model){
        //根据前端选择的当前页和页大小
        PageHelper.startPage(pageNum, pageSize);
        //获取所有的景点数据
        List<Food> foods = foodService.allFoods();
        //将景点按前前面放入的参数截取
        PageInfo<Food> pageInfo = new PageInfo<Food>(foods);
        //将分好页的数据传回给前端
        List<Food> allFoods = pageInfo.getList();
        model.addAttribute("allFoods",foods);
        //将分页信息传回给前端
        model.addAttribute("pageInfo",pageInfo);
        return "/admin/foodlist";
    }

    //前台美食分类列表
    @RequestMapping("/foodListByType")
    public String foodListByType(String types,Model model){
        List<Food> foods = foodService.selectFoodByTypes(Integer.parseInt(types));
        if(foods != null){
            model.addAttribute("foods",foods);
        }
        return "/template/food";
    }

    //前台按id查找美食
    @RequestMapping("/selectFoodByFoodId")
    public String selectFoodByFoodId(@RequestParam("foodId") String foodId,Model model){
        Food food = foodService.selectFoodByFoodId(Integer.parseInt(foodId));
        if(food != null){
            model.addAttribute("food",food);
        }
        return "/template/fooddetail";
    }
}
