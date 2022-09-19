package com.fd.service;

import com.fd.model.Food;
import java.util.List;
import java.util.Map;

public interface FoodService {
    //查询全部美食
    List<Food> allFoods();
    //增加美食
    int addFood(Food food);
    //按foodId查找美食
    Food selectFoodByFoodId(int foodId);
    //按foodName查找美食
    Food selectFoodByFoodName(String foodName);
    //删除美食
    int deleteFood(String foodName);
    //修改美食信息
    int updateFood(Food food);
    //按美食类型查找美食
    List<Food> selectFoodByTypes(int types);
    //更新美食状态信息
    int updateFoodState(Map<String,Object> map);
    //查找所有状态不为3的美食
    List<Food> selectChecking();
}
