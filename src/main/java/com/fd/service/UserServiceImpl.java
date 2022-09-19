package com.fd.service;

import java.sql.Timestamp;
import java.util.List;
import javax.annotation.Resource;
import com.fd.dao.UserMapper;
import com.fd.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	@Resource
    public UserMapper userMapper;
	
	@Override
	public User login(User user) {
		return userMapper.login(user);
	}

	@Override
	public List<User> allUsers() {
		return userMapper.allUsers();

	}
	
	@Override
	public int addUser(User user){
		return userMapper.addUser(user);
	}

	@Override
	public User searchUser(int userId) {
		return userMapper.searchUser(userId);
	}
	
	@Override
	public int deleteUser(int userId) {
		return userMapper.deleteUser(userId);
	}

	@Override
	public int updateUser(User user) {
		return userMapper.updateUser(user);
	}

	@Override
	public User searchUserByName(String userName) {
		return userMapper.searchUserByName(userName);
	}
	
}
