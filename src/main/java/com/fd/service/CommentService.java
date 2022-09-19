package com.fd.service;

import com.fd.model.Comment;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface CommentService {
	List<Comment> allComments();
	//查询一个具体的文章下的评论
	List<Comment> selectCommentByIdAndType(Map<String,Object> map);
	//发表评论
	int addComment(Comment comment);
	int deleteComment(int commentId);
	//查找某位用户的全部评论
	List<Comment> selectCommentByUserId(int userId);
}
