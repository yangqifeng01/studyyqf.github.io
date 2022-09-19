package com.fd.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.*;
import java.io.Serializable;
import java.sql.Timestamp;


public class User implements Serializable
{
	private int userId;
	@NotBlank(message = "用户名不能为空!")
	private String userName;
	@Length(min=5,max=20,message = "密码长度无效！")
	private String password;
	@Email(message = "邮箱格式错误！")
	private String email;
	@NotNull(message = "性别不能为空！")
	private int sex;
	@NotNull(message = "身份不能为空！")
	private int state;
	private int status;
	//日期反序列化，将传输到前端页面的日期反序列化
	@JsonFormat(timezone = "UTC",pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Timestamp  addDate;
	//存储头像
	private String headPro;
	private MultipartFile multipartFile;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Timestamp getAddDate() {
		return addDate;
	}
	public void setAddDate(Timestamp addDate) {
		this.addDate = addDate;
	}
	public String getHeadPro() {
		return headPro;
	}
	public void setHeadPro(String headPro) {
		this.headPro = headPro;
	}
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	@Override
	public String toString() {
		return "User{" +
				"userId=" + userId +
				", userName='" + userName + '\'' +
				", password='" + password + '\'' +
				", email='" + email + '\'' +
				", sex=" + sex +
				", state=" + state +
				", status=" + status +
				", addDate=" + addDate +
				", headPro='" + headPro + '\'' +
				", multipartFile=" + multipartFile +
				'}';
	}
}
