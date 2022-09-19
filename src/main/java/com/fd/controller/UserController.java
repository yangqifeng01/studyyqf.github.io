package com.fd.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fd.model.User;
import com.fd.service.UserService;
import com.fd.util.MyUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("")
public class UserController {

	@Resource
    private UserService userService;
	//管理员登录
	@RequestMapping(value = "/admin/login",method = RequestMethod.POST)
	@ResponseBody
	public String login(User user, Model model, HttpSession session) {
		User user1 = userService.login(user);
		if(user1 != null) {
			if((user1.getStatus() == 2 || user1.getStatus()==3)&& user1.getState() == 1){
				session.setAttribute("user", user1);
				return "1";//登录成功
			}
			return "3";//非管理员
		}
		return "2";//登录失败
	}
	//前台登录
	@RequestMapping(value = "/userLogin",method = RequestMethod.POST)
	@ResponseBody
	public String userLogin(User user,HttpSession session) throws JsonProcessingException {
		System.out.println(user);
		ObjectMapper objectMapper = new ObjectMapper();
		User user1 = userService.login(user);
		if(user1 != null){
			session.setAttribute("normalUser",user1);
			return objectMapper.writeValueAsString(user1);
		}
		return "false";
	}

	//退出登录
	@RequestMapping(value = "/admin/exit")
	public String exit(HttpSession session){
		if(session.getAttribute("normalUser") != null){
			session.removeAttribute("normalUser");
			return "/fakeIndex";
		}

		if(session.getAttribute("user") != null){
			session.removeAttribute("user");
		}
		return "/admin/login";
	}

	@RequestMapping("/admin/userList")
	public String allUsers(Model model, HttpSession session) {
		List<User> allUsers = userService.allUsers();
		session.setAttribute("allUsers", allUsers);
		return "/admin/userlist";

	}

	//增加用户
	@RequestMapping(value = "/admin/addUser",method = RequestMethod.POST)
	public String addUser(@ModelAttribute @Valid User user, BindingResult result, HttpServletRequest request) throws IOException {
		if(result.hasErrors()){
			return "/admin/adduser";
		}
		MultipartFile multipartFile = user.getMultipartFile();
		String headPro = MyUtil.upload(request,multipartFile);
		if(headPro != null){
			user.setHeadPro(headPro);
		}
		Timestamp adddate = new Timestamp(System.currentTimeMillis());
		user.setAddDate(adddate);
		userService.addUser(user);
		return "redirect:/admin/userList";
	}
	
	//根据用户名查找用户
	@RequestMapping("/admin/searchUser")
	@ResponseBody
	public String searchUser(@RequestParam("userName") String userName){
		String isExist = "true";
		if(userService.searchUserByName(userName) != null){
			isExist = "false";
		}
		return isExist;
	}

	//判断用户是否存在
	@RequestMapping("/admin/searchUser2")
	@ResponseBody
	public String searchUser2(@RequestParam("userName") String userName) throws JsonProcessingException {
		User searchedUser = userService.searchUserByName(userName);
		ObjectMapper objectMapper = new ObjectMapper();
		if(searchedUser!=null){
			String json = objectMapper.writeValueAsString(searchedUser);
			System.out.println(json);
			return json;
		}else{
			return "false";
		}
	}

	//按用户名删除用户
	@RequestMapping("/admin/deleteUser")
	@ResponseBody
	public String deleteUser(@RequestParam("userName") String userName,HttpSession session,HttpServletRequest request){
		//查找需要删除的用户
		User user = userService.searchUserByName(userName);
		//获取当前用户的信息
		User nowUser = (User) session.getAttribute("user");
		String msg = "false";
		//判断用户是否具有删除的权限
		if(nowUser.getStatus() == 3){
			//删除之前首先删除服务器中的图片
			MyUtil.deleteFile(request,user.getHeadPro());
			//删除用户
			userService.deleteUser(user.getUserId());
			//此处再次查询全部用户放入session感觉有些不对，保留修改
			List<User> allUsers = userService.allUsers();
			session.setAttribute("allUsers", allUsers);
			msg = "true";
		}
		return msg;
	}
	
	//跳转到更行用户界面
	@RequestMapping("/admin/toUpdateUser")
	public String toUpdateUser(@RequestParam("userName") String userName,Model model){
		User user = userService.searchUserByName(userName);
		System.out.println("user=>"+user);
		model.addAttribute("nowUser",user);
		return "/admin/updateuser";
	}
	
	//更新其他用户信息
	@RequestMapping("/admin/updateUser")
	public String updateUser(User user,HttpServletRequest request) throws IOException {
		//超级管理员修改用户信息与用户修改个人信息关于图片的操作
		System.out.println("user2=>"+user);
		MultipartFile multipartFile = user.getMultipartFile();
		System.out.println(multipartFile.isEmpty());
		String headPro = "";
		User oldUser = userService.searchUserByName(user.getUserName());
		headPro = oldUser.getHeadPro();
		System.out.println(oldUser);
		if(!multipartFile.isEmpty()){
			headPro = MyUtil.upload(request,multipartFile);
			MyUtil.deleteFile(request,oldUser.getHeadPro());
		}
		user.setHeadPro(headPro);
		System.out.println(user.getHeadPro());

		User adnUser = (User) request.getSession().getAttribute("user");
		User norUser = (User) request.getSession().getAttribute("normalUser");
		//因为使用User对象接收数据，除超级管理员修改用户信息时会提供state，status，其他用户修改个人信息时state和status都为0，所以个人信息修改时需要为user赋值
		if(adnUser != null && adnUser.getUserId() == user.getUserId()){
			user.setState(adnUser.getState());
			user.setStatus(adnUser.getStatus());
		}

		if(norUser != null && norUser.getUserId() == user.getUserId()){
			user.setState(norUser.getState());
			user.setStatus(norUser.getStatus());
		}

		userService.updateUser(user);

		if(norUser != null && norUser.getStatus() == 1){
			request.getSession().setAttribute("normalUser",user);
			return "/norUser/index";
		}

		request.getSession().setAttribute("user",user);
		return "redirect:/admin/userList";
	}

	//分页
	@RequestMapping("/admin/fenYe")
	public String fenYe(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,@RequestParam(value = "pageSize",defaultValue = "5") int pageSize,Model model){
		PageHelper.startPage(pageNum, pageSize);
		List<User> users = userService.allUsers();
		PageInfo<User> pageInfo = new PageInfo<User>(users);
		List<User> allUsers = pageInfo.getList();
		model.addAttribute("allUsers",allUsers);
		model.addAttribute("pageInfo",pageInfo);
		return "/admin/userlist";
	}
}
