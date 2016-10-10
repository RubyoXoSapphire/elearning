package com.softech.elearning.presentation.controllers.admin;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.softech.elearning.business.services.SemesterService;
import com.softech.elearning.data.domain.Semester;
import com.softech.elearning.presentation.dto.ObjectAjaxResponse;

@Controller
@RequestMapping(value = "/admin")
public class SemesterController {
	@Autowired
	SemesterService semesterService;

	// SEMESTER MANAGERMENT
	@RequestMapping(value = "/list-semester", method = RequestMethod.GET)
	public String redirectToListSem(Model model) {
		return "adminListSem";
	}

	@RequestMapping(value = "/add-semester", method = RequestMethod.GET)
	public String redirectToAddSem(@ModelAttribute("command") Semester semester, Model model) {

		if (semester == null) {
			model.addAttribute("command", new Semester());
		} else
			model.addAttribute("command", semester);

		return "adminAddSem";
	}

	@RequestMapping(value = "/add-semester", method = RequestMethod.POST)
	public String redirectToAddSemPost(@ModelAttribute("command") @Valid Semester semester, BindingResult result,
			RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return "adminAddSem";
		}
		if (!semesterService.exists(semester.getSemesterId())) {
			semesterService.save(semester);
			redirectAttributes.addFlashAttribute("message", "Add semester successfully !!!");
			redirectAttributes.addFlashAttribute("command", semester);
		} else {
			redirectAttributes.addFlashAttribute("message", "Add semester not successfully !!!");
		}
		return "redirect:list-semester";
	}

	@RequestMapping(value = "/edit-semester-{id}", method = RequestMethod.GET)
	public String redirectToEditSem(@PathVariable("id") String id, Model model) {
		if (semesterService.exists(id)) {
			model.addAttribute("command", semesterService.findOne(id));
		} else {
			model.addAttribute("command", new Semester());
		}
		model.addAttribute("id", id);
		return "adminEditSem";
	}

	@RequestMapping(value = "/edit-semester-{id}", method = RequestMethod.POST)
	public String redirectToEditSem(@PathVariable("id") String id, @Valid @ModelAttribute("command") Semester semester,
			BindingResult result, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return "adminEditSem";
		}
		if (semesterService.exists(id)) {
			semesterService.save(semester);
			redirectAttributes.addFlashAttribute("message", "Edit semester successfully !!!");
		}
		return "redirect:list-semester";
	}

	@RequestMapping(value = "/delete-semester", method = RequestMethod.POST)
	public @ResponseBody String ajaxDeleteSem(@RequestBody String id) {
		String message = "";
		id = id.replace("\"", "");
		if (semesterService.exists(id)) {
			Semester temp = semesterService.findOne(id);
			semesterService.delete(temp);
			message = "Recorded deleted successfully !!!";
		} else
			message = "Cannot deleted !!!ERROR";
		return message;
	}

	@RequestMapping(value = "/list-semester/search")
	public @ResponseBody ObjectAjaxResponse ajaxSemesterSearch(@RequestBody String keyword,
			@RequestParam(value = "pagenumber", required = false) Integer pageNumber,
			@RequestParam(value = "pagesize", required = false) Integer pageSize) {
		ObjectAjaxResponse<Semester> result = new ObjectAjaxResponse<Semester>();
		Page<Semester> listSem;
		pageNumber--;
		listSem = semesterService.search(keyword.replace("\"", ""), pageNumber, pageSize);
		if (listSem != null) {
			result.setCode("200");
			result.setMsg("");
			result.setResult(listSem);
		} else {
			result.setCode("204");
			result.setMsg("No data!");
		}
		return result;
	}
}
