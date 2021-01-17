package com.task.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.task.dao.TaskDAO;
import com.task.dao.UserDAO;
import com.task.model.Task;
import com.task.model.User;

@RestController
@SessionAttributes("user")
public class TasksController {

	@Autowired
	UserDAO userDao;
	@Autowired
	TaskDAO taskDao;

	@GetMapping("{name}/{id}/tasks")
	public ModelAndView showTasks(@PathVariable("name") String name, @PathVariable("id") int id,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = userDao.findById(id).get();
		List<Task> tasks = user.getTasks();
		session.setAttribute("tasks", tasks);
		return new ModelAndView("/tasks");
	}

	@GetMapping("{name}/{id}/addtask")
	public ModelAndView showTaskForm(@PathVariable("name") String name, @PathVariable("id") int id,
			HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		User user = (User) model.get("user");
		session.setAttribute("user", user);
		return new ModelAndView("/addtask");
	}

	@PostMapping("{name}/{id}/task")
	public ModelAndView addTask(@PathVariable("name") String name, @PathVariable("id") int id,
			@RequestParam("tname") String tName, @RequestParam("description") String description,
			@RequestParam("priority") String priority, @RequestParam("startdate") String startDate,
			@RequestParam("enddate") String endDate, HttpServletRequest request) throws ParseException {

		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		User user = userDao.findById(id).get();
		Task task = new Task();
		task.setName(tName);
		task.setDescription(description);
		task.setPriority(priority);
		Date stDate = format.parse(startDate);
		task.setStartDate(stDate);
		Date eDate = format.parse(endDate);
		task.setEndDate(eDate);
		task.setUser(user);
		user.getTasks().add(task);
		userDao.save(user);
		return new ModelAndView("redirect:/" + name + "/" + id + "/tasks");
	}

	@GetMapping("{name}/{id}/edittask/{tid}")
	public ModelAndView showEditTask(@PathVariable("name") String name, @PathVariable("id") int id,
			@PathVariable("tid") int tId) {
		Task task = userDao.findById(id).get().getTasks().stream().filter(t -> t.getId() == tId).findFirst()
				.orElse(null);
		return new ModelAndView("/edittask").addObject(task);
	}

	@PostMapping("{name}/{id}/edittask/{tid}")
	public ModelAndView editTask(@PathVariable("name") String name, @PathVariable("id") int id,
			@PathVariable("tid") int tId, @RequestParam("tname") String tName,
			@RequestParam("description") String description, @RequestParam("priority") String priority,
			@RequestParam("startdate") String startDate, @RequestParam("enddate") String endDate)
			throws ParseException {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		User user = userDao.findById(id).get();
		Task task = user.getTasks().stream().filter(t -> t.getId() == tId).findFirst().orElse(null);
		task.setName(tName);
		task.setDescription(description);
		task.setPriority(priority);
		Date sdate = format.parse(startDate);
		task.setStartDate(sdate);
		Date edate = format.parse(endDate);
		task.setEndDate(edate);
		task.setUser(user);
		userDao.save(user);
		return new ModelAndView("redirect:/" + name + "/" + id + "/tasks");
	}

	@GetMapping("{name}/{id}/deletetask/{tid}")
	public ModelAndView returnTasks(@PathVariable("name") String name, @PathVariable("id") int id,
			@PathVariable("tid") int tId) {
		taskDao.deleteById(tId);
		return new ModelAndView("redirect:/" + name + "/" + id + "/tasks");
	}
}
