package com.fd.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.fd.model.Comment;
import org.springframework.stereotype.Repository;

@Repository("commentMapper")
@Mapper
public interface CommentMapper {
	List<Comment> allComments();
	//查询一个具体的文章下的评论
	List<Comment> selectCommentByIdAndType(Map<String,Object> map);
	//发表评论
	int addComment(Comment comment);
	int deleteComment(int commentId);
	//查找某位用户的全部评论
	List<Comment> selectCommentByUserId(int userId);

}
