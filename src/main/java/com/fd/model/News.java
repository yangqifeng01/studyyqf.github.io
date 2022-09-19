package com.fd.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import java.sql.Date;

public class News {
    private int newsId;
    @NotNull
    private String newsTitle;
    @NotNull
    private String newsAuthor;
    @JsonFormat(timezone = "UTC",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date newsAddDate;
    @NotNull
    private int newsTypes;
    @NotNull
    private String newsContent;
    private int newsAddId;
    private String newsImage;
    private int state;
    private String checkMsg;
    //用于显示作者的名字
    private User user;
    //用于上传图片
    private MultipartFile multipartFile;

    public int getNewsId() {
        return newsId;
    }
    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }
    public String getNewsTitle() {
        return newsTitle;
    }
    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }
    public String getNewsAuthor() {
        return newsAuthor;
    }
    public void setNewsAuthor(String newsAuthor) {
        this.newsAuthor = newsAuthor;
    }
    public Date getNewsAddDate() {
        return newsAddDate;
    }
    public void setNewsAddDate(Date newsAddDate) {
        this.newsAddDate = newsAddDate;
    }
    public int getNewsTypes() {
        return newsTypes;
    }
    public void setNewsTypes(int newsTypes) {
        this.newsTypes = newsTypes;
    }
    public String getNewsContent() {
        return newsContent;
    }
    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }
    public int getNewsAddId() {
        return newsAddId;
    }
    public void setNewsAddId(int newsAddId) {
        this.newsAddId = newsAddId;
    }
    public String getNewsImage() {
        return newsImage;
    }
    public void setNewsImage(String newsImage) {
        this.newsImage = newsImage;
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
        return "News{" +
                "newsId=" + newsId +
                ", newsTitle='" + newsTitle + '\'' +
                ", newsAuthor='" + newsAuthor + '\'' +
                ", newsAddDate=" + newsAddDate +
                ", newsTypes=" + newsTypes +
                ", newsContent='" + newsContent + '\'' +
                ", newsAddId=" + newsAddId +
                ", newsImage='" + newsImage + '\'' +
                ", state=" + state +
                ", checkMsg='" + checkMsg + '\'' +
                ", user=" + user +
                ", multipartFile=" + multipartFile +
                '}';
    }
}
