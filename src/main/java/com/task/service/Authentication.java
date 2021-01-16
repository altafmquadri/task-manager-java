package com.task.service;

import java.util.concurrent.atomic.AtomicBoolean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.task.dao.UserDAO;
import com.task.model.User;

import lombok.Data;
import lombok.val;

@Data
@Service
public class Authentication implements AuthenticationInterface {

	private User currentUser = null;

	@Autowired
	UserDAO userDao;

	@Override
	public boolean authenticate(String userName, String password) {
		val validUser = new AtomicBoolean(false);
		userDao.findOneByNameAndPassword(userName, password).ifPresent(u -> {
			setCurrentUser(u);
			validUser.set(true);
		});
		return validUser.get();
	}

	@Override
	public void logout() {
		setCurrentUser(null);
	}
}
