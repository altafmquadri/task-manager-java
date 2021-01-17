package com.task.exceptions;

@SuppressWarnings("serial")
public class PasswordConfirmationException extends Exception {
	public PasswordConfirmationException(String message) {
		super(message);
	}
}
