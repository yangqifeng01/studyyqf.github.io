package com.fd.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import java.sql.Date;

public class Food {

    private int foodId;
    @NotNull
    private String foodName;
    @NotNull
    private String foodAddress;
    @NotNull
    private String foodContent;
    private String foodImage;
    @NotNull
    private int authorId;
    @JsonFormat(timezone = "UTC",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date addDate;
    //美食的类型，1表示特色菜，2表示风味小吃
    private int types;
    //价格
    private double foodPrice;
    private int state;
    private String checkMsg;
    //用于展示添加者的用户名
    private User user;
    //用于接收图片文件，并存储图片
    private MultipartFile multipartFile;

    public int getFoodId() {
        return foodId;
    }
    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }
    public String getFoodName() {
        return foodName;
    }
    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }
    public String getFoodAddress() {
        return foodAddress;
    }
    public void setFoodAddress(String foodAddress) {
        this.foodAddress = foodAddress;
    }
    public String getFoodContent() {
        return foodContent;
    }
    public void setFoodContent(String foodContent) {
        this.foodContent = foodContent;
    }
    public String getFoodImage() {
        return foodImage;
    }
    public void setFoodImage(String foodImage) {
        this.foodImage = foodImage;
    }
    public int getAuthorId() {
        return authorId;
    }
    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }
    public Date getAddDate() {
        return addDate;
    }
    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }
    public int getTypes() {
        return types;
    }
    public void setTypes(int types) {
        this.types = types;
    }
    public double getFoodPrice() {
        return foodPrice;
    }
    public void setFoodPrice(double foodPrice) {
        this.foodPrice = foodPrice;
    }
    public int getState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }
    public String getCheckMsg() {
        return checkMsg;
    }
    public void setCheckMsg(String checkMsg) {
        this.checkMsg = checkMsg;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public MultipartFile getMultipartFile() {
        return multipartFile;
    }
    public void setMultipartFile(MultipartFile multipartFile) {
        this.multipartFile = multipartFile;
    }

    @Override
    public String toString() {
        return "Food{" +
                "foodId=" + foodId +
                ", foodName='" + foodName + '\'' +
                ", foodAddress='" + foodAddress + '\'' +
                ", foodContent='" + foodContent + '\'' +
                ", foodImage='" + foodImage + '\'' +
                ", authorId=" + authorId +
                ", addDate=" + addDate +
                ", types=" + types +
                ", foodPrice=" + foodPrice +
                ", state=" + state +
                ", checkMsg='" + checkMsg + '\'' +
                ", user=" + user +
                ", multipartFile=" + multipartFile +
                '}';
    }
}
