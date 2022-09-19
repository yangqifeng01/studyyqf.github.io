package com.fd.service;

import com.fd.model.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface NewsService {
    //显示全部新闻
    List<News> allNews();
    //增加新闻
    int addNews(News news);
    //按id查找新闻
    News selectNewsByNewsId(int newsId);
    //按newsTitle查找新闻
    News selectNewsByNewsTitle(String newsTitle);
    //删除新闻
    int deleteNews(String newsTitle);
    //修改新闻
    int updateNews(News news);
    //按新闻类型查找新闻
    List<News> selectNewsByNewsTypes(int newsTypes);
    //修改新闻审核状态信息
    int updateNewsState(Map<String,Object> map);
    //查找所有状态不为3的新闻
    List<News> selectChecking();
}
