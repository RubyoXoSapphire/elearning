package com.softech.elearning.presentation.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.softech.elearning.business.services.QuestionService;
import com.softech.elearning.data.domain.Question;
import com.softech.elearning.data.domain.Subject;

@Controller
@RequestMapping(value="/admin")
public class QuestionController {
	@Autowired
	QuestionService questionService;
	@RequestMapping(value = "/list-question", method = RequestMethod.GET)
	public String redirectToListQuestion(@RequestParam(value = "kw", required = false) String keyword,
			@RequestParam(value = "page", required = false) Integer pageNumber,
			@RequestParam(value = "size", required = false) Integer pageSize, Model model) {
		if (pageNumber == null) {
			pageNumber = 0;
		} else
			pageNumber--;

		int pageSizeTemp = 10;
		if (pageSize == null) {
			pageSize = 10;
		} else if (pageSizeTemp != pageSize) {
			pageNumber = 0;
			pageSizeTemp = pageSize;
		} else
			model.addAttribute("pageSize", pageSize);

		Page<Question> listQuestion;
		if (keyword != null) {
			listQuestion = questionService.search(pageNumber, pageSize,keyword);
		} else {
			listQuestion = questionService.findAll(pageNumber, pageSize, new Sort(Direction.DESC,"questionId"));
		}
		model.addAttribute("listQuestion", listQuestion);

		int currentIndex = listQuestion.getNumber() + 1;
		model.addAttribute("currentIndex", currentIndex);

		int begin = Math.max(1, currentIndex - 5);
		int end = Math.min(begin + 10, listQuestion.getTotalPages());
		long countRecord = listQuestion.getTotalElements();
		int endRcIdx = (pageNumber * pageSize) + listQuestion.getContent().size();

		model.addAttribute("beginRcIdx", (pageNumber * pageSize) + 1);
		model.addAttribute("endRcIdx", (endRcIdx));
		model.addAttribute("countRecord", countRecord);
		model.addAttribute("beginIndex", begin);
		model.addAttribute("endIndex", end);
		model.addAttribute("keyword", keyword);
		return "adminListQuestion";
	}
}
