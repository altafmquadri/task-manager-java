package com.task.controller;

import java.util.concurrent.atomic.AtomicBoolean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.task.dao.UserDAO;
import com.task.exceptions.IncorrectDetailsException;
import com.task.exceptions.InvalidUserException;
import com.task.exceptions.PasswordConfirmationException;
import com.task.model.User;
import com.task.service.Authentication;

import lombok.val;

@RestController
@SessionAttributes("user")
public class LoginController {

	@Autowired
	UserDAO userDao;

	@Autowired
	Authentication auth;

	@GetMapping("/register")
	public ModelAndView showRegister() {
		return new ModelAndView("registration");
	}

	@PostMapping("/register")
	public ModelAndView register(@RequestParam("name") String name, @RequestParam("password") String password,
			@RequestParam("confirmation") String confirmation) {

		val isUnique = new AtomicBoolean(true);
		String message = null;

		try {
			userDao.findOneByNameAndPassword(name.toLowerCase(), password).ifPresent(u -> isUnique.set(false));

			if (!password.equals(confirmation)) {
				throw new PasswordConfirmationException("Password and Confirmation does not match");
			} else if (!isUnique.get()) {
				throw new InvalidUserException("Username is already taken");
			} else {
				message = "Successfully Registered";
				User user = new User();
				user.setName(name.toLowerCase());
				user.setPassword(password);
				userDao.save(user);
			}
		} catch (InvalidUserException | PasswordConfirmationException e) {
			message = e.getMessage();
		}
		return new ModelAndView("registration").addObject("message", message);
	}

	@GetMapping("/login")
	public ModelAndView showLogin() {
		return new ModelAndView("login");
	}

	@PostMapping("/login")
	public ModelAndView login(ModelMap model, @RequestParam("name") String name,
			@RequestParam("password") String password, HttpServletRequest request) {
		boolean isValid = auth.authenticate(name, password);

		try {
			if (isValid) {
				model.put("user", auth.getCurrentUser());
				HttpSession session = request.getSession();
				session.setAttribute("user", auth.getCurrentUser());
				return new ModelAndView("redirect:/" + auth.getCurrentUser().getName() + "/"+ auth.getCurrentUser().getId() + "/tasks");
			} else {
				throw new IncorrectDetailsException("Invalid Credentials");
			}
		} catch (IncorrectDetailsException e) {
			model.addAttribute("message", e.getMessage());
			return new ModelAndView("login");
		}
	}

	@GetMapping("/logout")
	public ModelAndView signOut(ModelMap model, HttpServletRequest request) {
		model.put("user", null);
		auth.logout();
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		session.invalidate();
		return new ModelAndView("redirect:/login");
	}

}
