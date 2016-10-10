package com.softech.elearning.presentation.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.softech.elearning.business.services.ClassService;
import com.softech.elearning.business.services.SemesterService;
import com.softech.elearning.business.services.SubjectService;
import com.softech.elearning.business.services.UserService;
import com.softech.elearning.data.domain.Class;
import com.softech.elearning.data.domain.Semester;
import com.softech.elearning.data.domain.Subject;
import com.softech.elearning.data.domain.User;
import com.softech.elearning.presentation.dto.ObjectAjaxResponse;

@Controller
@RequestMapping("/admin")
public class ClazzController {
	@Autowired
	ClassService classService;
	@Autowired
	UserService userService;
	@Autowired
	SubjectService subjectService;
	@Autowired
	SemesterService semesterService;
	public ClassService getClassService() {
		return classService;
	}
	public void setClassService(ClassService classService) {
		this.classService = classService;
	}
	@RequestMapping(value="/list-class",method=RequestMethod.GET)
	public String redirectToListClazz(Model model){
		return "adminListClazz";
	}
	@RequestMapping(value="/list-class/search",method=RequestMethod.POST)
	public @ResponseBody ObjectAjaxResponse<Class> ajaxClassSearch(@RequestBody String keyword,
			@RequestParam("pagesize") Integer pageSize,
			@RequestParam("pagenumber")Integer pageNumber){
		ObjectAjaxResponse<Class> obj=new ObjectAjaxResponse<Class>();
		Page<Class> pageClass=classService.findByClassIdLikeIgnoreCase(keyword, pageNumber, pageSize);
		if(pageClass!=null){
			obj.setCode("200");
			obj.setMsg("");
			obj.setResult(pageClass);
		}else{
			obj.setCode("202");
			obj.setMsg("No data!!!");
		}
		return obj;
	}
	@RequestMapping(value="/add-class",method=RequestMethod.GET)
	public String redirectToAddClass(Model model){
		List<User> listTeacher=userService.findAllTeacher();
		Semester semester=semesterService.findCurrentSemester();
		List<Subject> listSubject=subjectService.findAll();
		model.addAttribute("listTeacher", listTeacher);
		model.addAttribute("currentSemester", semester);
		model.addAttribute("listSubject", listSubject);
		model.addAttribute("class",new Class());
		return "adminAddClass";
	}
	@RequestMapping(value="/add-class",method=RequestMethod.POST)
	public String redirectToPostAddClass(@ModelAttribute("class") Class clazz,BindingResult result,Model model){
		if(result.hasErrors()){
			List<User> listTeacher=userService.findAllTeacher();
			Semester semester=semesterService.findCurrentSemester();
			List<Subject> listSubject=subjectService.findAll();
			model.addAttribute("listTeacher", listTeacher);
			model.addAttribute("currentSemester", semester);
			model.addAttribute("listSubject", listSubject);
			return "adminAddClass";
		}
		String clazzId=clazz.getSemester().getSemesterId()+clazz.getSubject().getSubjectId()+"01";
		clazz.setClassId(clazzId);
		classService.save(clazz);
		return "redirect:/admin/list-class";
	}
}
