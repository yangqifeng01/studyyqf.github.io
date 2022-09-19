package com.fd.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fd.model.Comment;
import com.fd.service.CommentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommentController {
	
	@Resource
	private CommentService commentService;

	//后台评论列表
	@RequestMapping("/admin/commentList")
	public String allComments(HttpSession session){
		List<Comment> allComments = commentService.allComments();
		System.out.println(allComments);
		for (Comment allComment : allComments) {
			System.out.println(allComment.getUser().getUserName());
			System.out.println(allComment.getCommentContent());
		}
		session.setAttribute("allComments", allComments);
		return "/admin/comment_list";
	}

	//前台具体文章下的评论列表
	@RequestMapping(value = "/selectCommentByIdAndType",method = RequestMethod.POST)
	@ResponseBody
	public String selectCommentByIdAndType(HttpServletRequest request) throws JsonProcessingException {
		String aboutName = request.getParameter("aboutName");
		int type = Integer.parseInt(request.getParameter("type"));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("aboutName",aboutName);
		map.put("type",type);
		ObjectMapper objectMapper = new ObjectMapper();
		System.out.println(map);
		List<Comment> commentList = commentService.selectCommentByIdAndType(map);
		if(commentList.size()>0){
			return objectMapper.writeValueAsString(commentList);
		}
		return "null";
	}

	//用户发表评论
	@RequestMapping(value = "/addComment",method = RequestMethod.POST)
	@ResponseBody
	public String addComment(Comment comment){
		Timestamp adddate = new Timestamp(System.currentTimeMillis());
		comment.setAdddate(adddate);
		System.out.println("========================================");
		System.out.println(comment);
		System.out.println("========================================");
		if(commentService.addComment(comment) > 0){
			return "true";
		}
		return "false";
	}

	//管理员删除评论
	@RequestMapping(value = "/admin/deleteComment",method = RequestMethod.POST)
	@ResponseBody
	public String deleteComment(String commentId,HttpSession session){
		if(commentService.deleteComment(Integer.parseInt(commentId)) > 0){
			List<Comment> allComments = commentService.allComments();
			session.setAttribute("allComments", allComments);
			return "true";
		}
		return "false";
	}

	//用户查看自己发表的评论
	@RequestMapping(value = "/commentList",method = RequestMethod.POST)
	@ResponseBody
	public String commentList(String userId) throws JsonProcessingException {
		System.out.println("===================================");
		System.out.println(userId);
		List<Comment> commentList = commentService.selectCommentByUserId(Integer.parseInt(userId));
		ObjectMapper objectMapper = new ObjectMapper();
		if(commentList.size()>0){
			return objectMapper.writeValueAsString(commentList);
		}
		return "null";
	}

}
