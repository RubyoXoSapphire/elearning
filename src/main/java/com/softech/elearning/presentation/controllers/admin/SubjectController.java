package com.softech.elearning.presentation.controllers.admin;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.softech.elearning.business.services.ChapterService;
import com.softech.elearning.business.services.SubjectService;
import com.softech.elearning.data.domain.Chapter;
import com.softech.elearning.data.domain.Semester;
import com.softech.elearning.data.domain.Subject;
import com.softech.elearning.presentation.dto.ObjectAjaxResponse;

@Controller
@RequestMapping("/admin")
public class SubjectController {
	@Autowired
	SubjectService subjectService;
	@Autowired
	ChapterService chapterService;
	// SUBJECT MANAGEMENT
	@RequestMapping(value = "/list-subject", method = RequestMethod.GET)
	public String redirectToListSubject(Model model) {
		return "adminListSubject";
	}
	@RequestMapping(value = "/list-subject/search")
	public @ResponseBody ObjectAjaxResponse ajaxSubjectSearch(@RequestBody String keyword,
			@RequestParam(value = "pagenumber", required = false) Integer pageNumber,
			@RequestParam(value = "pagesize", required = false) Integer pageSize) {
		ObjectAjaxResponse<Subject> result = new ObjectAjaxResponse<Subject>();
		Page<Subject> listSubject;
		pageNumber--;
		listSubject = subjectService.search(pageNumber, pageSize, keyword.replace("\"", ""));
		if (listSubject != null) {
			result.setCode("200");
			result.setMsg("");
			result.setResult(listSubject);
		} else {
			result.setCode("204");
			result.setMsg("No data!");
		}
		return result;
	}
	@RequestMapping(value="delete-subject")
	public @ResponseBody String ajaxSubjectDelete(@RequestBody String id){
		id=id.replace("\"","");
		if(subjectService.exists(id)){
			subjectService.delete(id);
		}else return  "the subject not exist";
		return "delete successfully";
	}
	@RequestMapping(value="/edit-subject-{id}",method=RequestMethod.GET)
	public String redirectToEditSubject(@PathVariable("id") String id,Model model){
		
		Subject subject=subjectService.findOne(id);
		model.addAttribute("subject", subject);
		return "adminEditSubject";
	}
	@RequestMapping(value="/edit-subject-{id}",method=RequestMethod.POST)
	public String redirectToPostEditSubject(@ModelAttribute Subject subject,BindingResult result,Model model){
	if(result.hasErrors()){
		return "adminEditSubject";
		
	}
	subjectService.save(subject);
	return "redirect:/admin/list-subject";
	}
	@RequestMapping(value="/view-subject-{id}",method=RequestMethod.GET)
	public String redirectToViewSubject(@PathVariable("id")String id ,Model model){
		Subject subject=subjectService.findOne(id);
		model.addAttribute("subject", subject);
		List<Chapter> listChapter=chapterService.findChapterBySubject(subject);
		model.addAttribute("listChapter", listChapter);
		return "adminViewSubject";
	}
	@RequestMapping(value="/add-subject",method=RequestMethod.GET)
	public String redirectToAddSubject(Model model){
		model.addAttribute("subject",new Subject());
		return "adminAddSubject";
	}
	
	@RequestMapping(value="/add-subject",method=RequestMethod.POST)
	public String redirectToPostAddSubject(@ModelAttribute @Valid Subject subject,
			BindingResult result,Model model){
		if(result.hasErrors()){
			return "adminAddSubject";
		}else{
				subjectService.save(subject);
		}
		return "redirect:/admin/list-subject";
	}
	@RequestMapping(value="/view-subject-{id}/add-chapter",method=RequestMethod.GET)
	public String redirectToAddChapterForSubject(@PathVariable String id,Model model){
		model.addAttribute("chapter", new Chapter());
		return "adminAddChapterForSubject";
	}
	@RequestMapping(value="/view-subject-{id}/add-chapter",method=RequestMethod.POST)
	public String redirectToPostAddChapterForSubject(@PathVariable String id,@Valid @ModelAttribute Chapter chapter,BindingResult result,Model model){
		if(result.hasErrors()){
			return "adminAddChapterForSubject";
		}
		if(!chapterService.exists(chapter.getChapterId())){
			chapter.setSubject(subjectService.findOne(id));
			chapterService.save(chapter);
		}
		return "redirect:/admin/view-subject-"+id;
	}
	@RequestMapping(value="/view-subject-{id}/edit-chapter-{chapterId}",method=RequestMethod.GET)
	public String redirectToEditChapter(@PathVariable String id,@PathVariable Integer chapterId,Model model){
		Chapter chapter=chapterService.findOne(chapterId);
		model.addAttribute("chapter",chapter);
		return "adminEditChapter";
	}
	@RequestMapping(value="/view-subject-{id}/edit-chapter-{chapterId}",method=RequestMethod.POST)
	public String redirectToPostEditChapter(@Valid @ModelAttribute Chapter chapter,BindingResult result,@PathVariable String id,@PathVariable Integer chapterId,Model model){
		if(result.hasErrors()){
			return "adminEditChapter"; 
		}
		chapterService.save(chapter);
		return "redirect:/admin/view-subject-"+id;
	}
	@RequestMapping(value="/view-subject-{id}/delete-chapter-{chapterId}",method=RequestMethod.GET)
	public String redirectToDeleteChapter(@PathVariable String id,@PathVariable Integer chapterId){
		if(chapterService.exists(chapterId)){
			chapterService.delete(chapterId);
		}
		return "redirect:/admin/view-subject-"+id;
	}
}
