package com.task.exceptions;

@SuppressWarnings("serial")
public class IncorrectDetailsException extends Exception {
	public IncorrectDetailsException(String message) {
		super(message);
	}
}
