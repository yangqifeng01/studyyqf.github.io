package com.fd.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.sql.Timestamp;

public class Comment implements Serializable
{
	private int commentId;
	private String commentContent;
	private int userId;
	private String aboutName;
	private int type;
	private int goodCount;
	private User user;
	//日期反序列化，将传输到前端页面的日期反序列化
	@JsonFormat(timezone = "UTC",pattern = "yyyy-MM-dd")
	private Timestamp adddate;

	public int getCommentId() {
		return commentId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAboutName() {
		return aboutName;
	}

	public void setAboutName(String aboutName) {
		this.aboutName = aboutName;
	}

	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}
	public Timestamp getAdddate() {
		return adddate;
	}
	public void setAdddate(Timestamp adddate) {
		this.adddate = adddate;
	}

	@Override
	public String toString() {
		return "Comment{" +
				"commentId=" + commentId +
				", commentContent='" + commentContent + '\'' +
				", userId=" + userId +
				", aboutName=" + aboutName +
				", type=" + type +
				", goodCount=" + goodCount +
				", user=" + user +
				", adddate=" + adddate +
				'}';
	}
}
