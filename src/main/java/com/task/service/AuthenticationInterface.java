package com.task.service;

public interface AuthenticationInterface {
	
	public boolean authenticate(String userName, String password);
	
	public void logout();
}
