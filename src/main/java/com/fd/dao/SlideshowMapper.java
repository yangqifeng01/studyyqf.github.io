package com.fd.dao;

import com.fd.model.Slideshow;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("slideshowMapper")
public interface SlideshowMapper {
    //显示全部轮播图
    List<Slideshow> allSlideshows();
    //增加轮播图
    int addSlideshow(Slideshow slideshow);
    //删除轮播图
    int deleteSlideshow(int imageId);
}
