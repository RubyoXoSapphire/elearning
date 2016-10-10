package com.softech.elearning.presentation.controllers.admin;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.softech.elearning.business.services.RoleService;
import com.softech.elearning.business.services.SemesterService;
import com.softech.elearning.business.services.UserService;
import com.softech.elearning.data.domain.Role;
import com.softech.elearning.data.domain.Semester;
import com.softech.elearning.data.domain.User;
import com.softech.elearning.presentation.controllers.HomeController;
import com.softech.elearning.presentation.dto.ObjectAjaxResponse;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	UserService userService;

	@Autowired
	RoleService roleService;
	@Autowired
	SemesterService semesterService;
	User user = null;
	Role role = null;
	Semester sem = null;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String redirectToAdminDashboard(Model model) {

		return "adminDashboard";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String redirectToLogin(Model model) {

		return "adminLoginPage";
	}

	@RequestMapping(value = "/update-profile", method = RequestMethod.GET)
	public String redirectToAdminUpdateProfile(Model model) {
		List<Role> roleList = roleService.findAll();
		model.addAttribute("roleList", roleList);
		model.addAttribute("user", new User());
		return "adminUpdateProfile";
	}

	// USER MANAGERMENT

	@RequestMapping(value = "/list-user", method = RequestMethod.GET)
	public String redirectToUserList2(Model model) {
		return "userList";
	}

	@RequestMapping(value = "/list-user/search")
	public @ResponseBody ObjectAjaxResponse ajaxUserSearch(@RequestBody String keyword,
			@RequestParam(value = "pagenumber", required = false) Integer pageNumber,
			@RequestParam(value = "pagesize", required = false) Integer pageSize) {
		ObjectAjaxResponse<User> result = new ObjectAjaxResponse<User>();
		Page<User> listUser;
		pageNumber--;
		listUser = userService.findUserByUserIdOrFirstName(keyword.replace("\"", ""), pageNumber, pageSize,
				new Sort(Direction.DESC, "userId"));
		if (listUser != null) {
			result.setCode("200");
			result.setMsg("");
			result.setResult(listUser);
		} else {
			result.setCode("204");
			result.setMsg("No data!");
		}
		return result;
	}

	@RequestMapping(value = "/add-user", method = RequestMethod.GET)
	public String redirectToAddUser(@ModelAttribute("command") User user, Model model) {
		List<Role> listRole = roleService.findAll();
		model.addAttribute("listRole", listRole);

		if (user == null) {
			model.addAttribute("user", new User());
		} else
			model.addAttribute("user", user);

		return "adminAddUser";
	}

	@RequestMapping(value = "/add-user", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") @Valid User user, BindingResult result,
			RedirectAttributes redirectAttributes, Model model) {
		if (result.hasErrors()) {
			List<Role> listRole = roleService.findAll();
			model.addAttribute("listRole", listRole);
			return "adminAddUser";
		}
		if (!userService.exists(user.getUserId())) {
			userService.save(user);
			redirectAttributes.addFlashAttribute("message", "Add user successfully !!!");
			redirectAttributes.addFlashAttribute("command", user);
		} else {
			redirectAttributes.addFlashAttribute("message", "Add user not successfully !!!");
		}
		return "redirect:list-user";
	}

	@RequestMapping(value = "/edit-user-{id}", method = RequestMethod.GET)
	public String redirectToEditUser(@PathVariable("id") String id, Model model) {
		if (userService.exists(id)) {
			model.addAttribute("command", userService.findOne(id));
		} else {
			model.addAttribute("command", new User());
		}
		model.addAttribute("id", id);
		return "adminEditUser";
	}

	@RequestMapping(value = "/edit-user-{id}", method = RequestMethod.POST)
	public String redirectToEditUser(@PathVariable("id") String id, @ModelAttribute("command") User user,
			RedirectAttributes redirectAttributes) {
		if (userService.exists(id)) {
			User temp = userService.findOne(user.getUserId());
			userService.save(temp);
			redirectAttributes.addFlashAttribute("message", "Edit user successfully !!!");
		} else {
			redirectAttributes.addFlashAttribute("message", "Edit user not successfully !!!");
		}
		return "redirect:list-user";
	}

	@RequestMapping(value = "/delete-user", method = RequestMethod.POST)
	public @ResponseBody String ajaxDeleteSem(@RequestBody String id) {
		String message = "";
		id = id.replace("\"", "");
		if (userService.exists(id)) {
			User temp = userService.findOne(id);
			userService.delete(id);
			/* userService.delete(temp); */
			message = "Record deleted successfully !!!";
		} else
			message = "Cannot deleted !!!ERROR";
		return message;
	}

	@RequestMapping(value = "/organize-examination", method = RequestMethod.GET)
	public String redirectToOrginizeExamination(Model model) {
		return "adminOrginizeExamnination";
	}

}
