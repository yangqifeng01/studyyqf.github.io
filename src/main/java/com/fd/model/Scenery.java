package com.fd.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.sql.Date;

public class Scenery implements Serializable
{
	private int id;
	@NotBlank
	private String name;
	@NotBlank
	private String address;
	@NotBlank
	private String content;
	@JsonFormat(timezone = "UTC",pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date addDate;
	@NotNull
	private double rates;
	@NotBlank
	private String openTime;
	@NotBlank
	private String introduction;
	@NotNull
	private int authorId;
	private int state;
	private String checkMsg;
	private User user;
	private MultipartFile multipartFile;
	private String image;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public double getRates() {
		return rates;
	}
	public void setRates(double rates) {
		this.rates = rates;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}

	public String getCheckMsg() {
		return checkMsg;
	}

	public void setCheckMsg(String checkMsg) {
		this.checkMsg = checkMsg;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Scenery{" +
				"id=" + id +
				", name='" + name + '\'' +
				", address='" + address + '\'' +
				", content='" + content + '\'' +
				", addDate=" + addDate +
				", rates=" + rates +
				", openTime='" + openTime + '\'' +
				", introduction='" + introduction + '\'' +
				", authorId=" + authorId +
				", state=" + state +
				", checkMsg='" + checkMsg + '\'' +
				", user=" + user +
				", multipartFile=" + multipartFile +
				", image='" + image + '\'' +
				'}';
	}
}
