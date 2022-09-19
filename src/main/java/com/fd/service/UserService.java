package com.fd.service;

import java.util.List;
import com.fd.model.User;

public interface UserService {
	public User login(User user);
	public List<User> allUsers();
	public int addUser(User user);
	public User searchUser(int userId);
	public User searchUserByName(String userName);
	public int deleteUser(int userId);
	public int updateUser(User user);
}
