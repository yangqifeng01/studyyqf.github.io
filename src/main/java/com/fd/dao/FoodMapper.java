package com.fd.dao;

import com.fd.model.Food;
import com.fd.model.Scenery;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("foodMapper")
@Mapper
public interface FoodMapper {
    //显示全部美食
    List<Food> allFoods();
    //按名称查找美食
    Food selectFoodByFoodName(String foodName);
    //按id查找美食
    Food selectFoodByFoodFoodId(int foodId);
    //添加美食
    int addFood(Food food);
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
