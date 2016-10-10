package com.softech.elearning.presentation.formatter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.ValidationUtils;

import com.softech.elearning.business.services.ExamService;
import com.softech.elearning.data.domain.Exam;

@Component
public class ExamFormatter implements Formatter<Exam> {
	@Autowired
	ExamService examService;

	@Override
	public String print(Exam exam, Locale arg1) {
		return exam.getName();
	}

	@Override
	public Exam parse(String examId, Locale arg1) throws ParseException {
		return examService.findOne(StringUtils.hasLength(examId) == true ? Integer.parseInt(examId) : null);
	}

}
