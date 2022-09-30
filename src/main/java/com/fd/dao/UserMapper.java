package com.fd.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.fd.model.User;
import org.springframework.stereotype.Repository;


@Repository("userMapper")
@Mapper
public interface UserMapper {
	//登录
	User login(User user);
	List<User> allUsers();
	int addUser(User user);
	User searchUser(int userId);
	User searchUserByName(String username);
	int deleteUser(int userId);
	int updateUser(User user);
}
