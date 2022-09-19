package com.fd.model;

import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import java.sql.Date;

public class Slideshow {
    private int imageId;
    private String imageName;
    @NotNull
    private int imageTypes;
    private Date imageAddDate;
    private int imageAddId;
    private User user;
    private MultipartFile multipartFile;

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public int getImageTypes() {
        return imageTypes;
    }

    public void setImageTypes(int imageTypes) {
        this.imageTypes = imageTypes;
    }

    public Date getImageAddDate() {
        return imageAddDate;
    }

    public void setImageAddDate(Date imageAddDate) {
        this.imageAddDate = imageAddDate;
    }

    public int getImageAddId() {
        return imageAddId;
    }

    public void setImageAddId(int imageAddId) {
        this.imageAddId = imageAddId;
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
        return "Slideshow{" +
                "imageId=" + imageId +
                ", imageName='" + imageName + '\'' +
                ", imageTypes=" + imageTypes +
                ", imageAddDate=" + imageAddDate +
                ", imageAddId=" + imageAddId +
                ", user=" + user +
                ", multipartFile=" + multipartFile +
                '}';
    }
}
