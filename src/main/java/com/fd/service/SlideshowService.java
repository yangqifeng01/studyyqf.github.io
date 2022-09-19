package com.fd.service;

import com.fd.model.Slideshow;

import java.util.List;

public interface SlideshowService {
    List<Slideshow> allSlideshows();

    int addSlideshow(Slideshow slideshow);

    int deleteSlideshow(int imageId);

}
