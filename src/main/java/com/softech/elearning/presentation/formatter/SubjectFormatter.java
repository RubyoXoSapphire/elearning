package com.softech.elearning.presentation.formatter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import com.softech.elearning.business.services.SubjectService;
import com.softech.elearning.data.domain.Subject;

@Component
public class SubjectFormatter implements Formatter<Subject>{
	@Autowired
	SubjectService subjectService;
	@Override
	public String print(Subject subject, Locale arg1) {
		// TODO Auto-generated method stub
		return subject.getName();
	}

	@Override
	public Subject parse(String subjectId, Locale arg1) throws ParseException {
		// TODO Auto-generated method stub
		return subjectService.findOne(subjectId);
	}

}
