package com.fd.service;

import com.fd.dao.SlideshowMapper;
import com.fd.model.Slideshow;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("slideshowService")
public class SlideshowServiceImpl implements SlideshowService{

    @Resource
    private SlideshowMapper slideshowMapper;

    @Override
    public List<Slideshow> allSlideshows() {
        return slideshowMapper.allSlideshows();
    }

    @Override
    public int addSlideshow(Slideshow slideshow) {
        return slideshowMapper.addSlideshow(slideshow);
    }

    @Override
    public int deleteSlideshow(int imageId) {
        return slideshowMapper.deleteSlideshow(imageId);
    }
}
