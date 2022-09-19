package com.fd.service;

import com.fd.dao.NewsMapper;
import com.fd.model.News;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("newsService")
public class NewsServiceImpl implements NewsService{
    @Resource
    private NewsMapper newsMapper;
    @Override
    public List<News> allNews() {
        return newsMapper.allNews();
    }

    @Override
    public int addNews(News news) {
        return newsMapper.addNews(news);
    }

    @Override
    public News selectNewsByNewsId(int newsId) {
        return newsMapper.selectNewsByNewsId(newsId);
    }

    @Override
    public News selectNewsByNewsTitle(String newsTitle) {
        return newsMapper.selectNewsByNewsTitle(newsTitle);
    }

    @Override
    public int deleteNews(String newsTitle) {
        return newsMapper.deleteNews(newsTitle);
    }

    @Override
    public int updateNews(News news) {
        return newsMapper.updateNews(news);
    }

    @Override
    public List<News> selectNewsByNewsTypes(int newsTypes) {
        return newsMapper.selectNewsByNewsTypes(newsTypes);
    }

    @Override
    public int updateNewsState(Map<String, Object> map) {
        return newsMapper.updateNewsState(map);
    }

    @Override
    public List<News> selectChecking() {
        return newsMapper.selectChecking();
    }
}
