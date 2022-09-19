package com.fd.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.fd.dao.CommentMapper;
import com.fd.model.Comment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("commentService")
@Transactional
public class CommentServiceImpl implements CommentService{
	
	@Resource
	private CommentMapper commentMapper;
	
	@Override
	public List<Comment> allComments() {
		return commentMapper.allComments();
	}

	@Override
	public List<Comment> selectCommentByIdAndType(Map<String, Object> map) {
		return commentMapper.selectCommentByIdAndType(map);
	}

	@Override
	public int addComment(Comment comment) {
		return commentMapper.addComment(comment);
	}

	@Override
	public int deleteComment(int commentId) {
		return commentMapper.deleteComment(commentId);
	}

	@Override
	public List<Comment> selectCommentByUserId(int userId) {
		return commentMapper.selectCommentByUserId(userId);
	}

}
