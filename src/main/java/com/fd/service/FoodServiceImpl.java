package com.fd.service;

import com.fd.dao.FoodMapper;
import com.fd.model.Food;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("foodService")
public class FoodServiceImpl implements FoodService {
    @Resource
    private FoodMapper foodMapper;

    @Override
    public List<Food> allFoods() {
        return foodMapper.allFoods();
    }

    @Override
    public int addFood(Food food) {
        return foodMapper.addFood(food);
    }

    @Override
    public Food selectFoodByFoodId(int foodId) {
        return foodMapper.selectFoodByFoodFoodId(foodId);
    }

    @Override
    public Food selectFoodByFoodName(String foodName) {
        return foodMapper.selectFoodByFoodName(foodName);
    }

    @Override
    public int deleteFood(String foodName) {
        return foodMapper.deleteFood(foodName);
    }

    @Override
    public int updateFood(Food food) {
        return foodMapper.updateFood(food);
    }

    @Override
    public List<Food> selectFoodByTypes(int types) {
        return foodMapper.selectFoodByTypes(types);
    }

    @Override
    public int updateFoodState(Map<String, Object> map) {
        return foodMapper.updateFoodState(map);
    }

    @Override
    public List<Food> selectChecking() {
        return foodMapper.selectChecking();
    }
}
