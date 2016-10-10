package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.AnswerSheet;
import com.softech.elearning.data.domain.Exam;

public interface AnswerSheetService {
	long count();

	void delete(AnswerSheet entity);

	void delete(List<AnswerSheet> entities);

	void delete(Integer id);

	void deleteAll();

	boolean exists(Integer id);

	List<AnswerSheet> findAll();

	List<AnswerSheet> findAll(int pageNumber, int pageSize, Sort sort);

	List<AnswerSheet> findAll(Sort sort);

	AnswerSheet findOne(Integer id);

	AnswerSheet save(AnswerSheet entity);
	
	List<AnswerSheet> findByExam(Exam exam);
	
	AnswerSheet findAnswerSheetByUserAndExam(String userId, int examId);
	
	Integer countAnswerSheetByExamId(int examId);
	
	List<Integer> countAnswerSheetWithFullAnswerAndNotFullAnswerByExamId(int examId);
	
	List<Integer> countPassAndFailAnswerSheetByExam(Exam exam);
	
	Double countAverageMarkByExam(Exam exam);
}