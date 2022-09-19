package com.fd.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.fd.model.User;
import org.springframework.stereotype.Repository;


@Repository("userMapper")
@Mapper
public interface UserMapper {
	//登录
	public User login(User user);
	public List<User> allUsers();
	public int addUser(User user);
	public User searchUser(int userId);
	public User searchUserByName(String username);
	public int deleteUser(int userId);
	
	public int updateUser(User user);
}
