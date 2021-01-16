package com.task.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.task.dao.UserDAO;
import com.task.model.User;

import lombok.Data;

@Data
@Service
public class Authentication implements AuthenticationInterface{

	private User currentUser=null;
	
	@Autowired
	UserDAO userDao;
	
	@Override
	public boolean authenticate(String userName, String password) {
		List<User> users = (List<User>) userDao.findAll();
		User u = (User) users.stream().filter(user -> user.getName().equals(userName.toLowerCase())).findFirst().orElse(null);
		if ( u != null && userName.equalsIgnoreCase(u.getName()) &&  u.getPassword().equals(password)) {
			setCurrentUser(u);
			return true;
		}
		return false;
	}

	@Override
	public void logout() {
		setCurrentUser(null);
		
	}
}
