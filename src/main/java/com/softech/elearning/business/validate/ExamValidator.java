package com.softech.elearning.business.validate;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mysql.jdbc.StringUtils;
import com.softech.elearning.data.domain.Exam;

@Component
public class ExamValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Exam.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Exam exam = (Exam) target;
		if (exam.getSpecificExam().equals("Exam")) {
			String errorTestMinute = validateTestMinute(exam.getTestMinute());
			String errorTestDateTimeBegin = validateTestDateTimeBegin(exam.getTestDatetimeBegin());

			if (errorTestMinute.equals("testMinute.required")) {
				errors.rejectValue("testMinute", null, "Test minute can not be 0");
			} else if (errorTestMinute.equals("testMinute.length")) {
				errors.rejectValue("testMinute", null, "Test minute length must be between 1 and 3");
			}

			if (!errorTestDateTimeBegin.equals("true")) {
				errors.rejectValue("testDatetimeBegin", null, "Test date time can not be null");
			}
		}

		/*
		 * String errorMarkMax = validateMarkMax(exam.getMarkMax()); if
		 * (errorMarkMax.equals("markMax.required")) {
		 * errors.rejectValue("markMax", null, "Max Mark can not be 0"); } else
		 * if (errorMarkMax.equals("markMax.length")) {
		 * errors.rejectValue("markMax", null,
		 * "Max mark length must be between 1 and 3"); }
		 */
	}

	public String validateTestMinute(int testMinute) {
		String temp = "" + testMinute;
		if (testMinute <= 0) {
			return "testMinute.required";
		} else if (temp.toCharArray().length > 3) {
			return "testMinute.length";
		} else {
			return "true";
		}
	}

	public String validateTestDateTimeBegin(Date testDateTimeBegin) {
		if (testDateTimeBegin == null) {
			return "testDatetimeBegin.required";
		} else {
			return "true";
		}
	}

	public String validateMarkMax(double markMax) {
		String temp = "" + markMax;
		if (markMax <= 0) {
			return "markMax.required";
		} else if (temp.toCharArray().length > 3) {
			return "markMax.length";
		} else {
			return "true";
		}
	}
}
