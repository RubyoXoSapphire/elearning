package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.Exam;
import com.softech.elearning.data.domain.ExamQuestion;
import com.softech.elearning.data.domain.Question;

public interface ExamQuestionService {
	long count();

	void delete(ExamQuestion entity);

	void delete(List<ExamQuestion> entities);

	void delete(Exam exam, Question question);

	void deleteAll();

	boolean exists(Exam exam, Question question);

	List<ExamQuestion> findAll();

	List<ExamQuestion> findAll(int pageNumber, int pageSize, Sort sort);

	List<ExamQuestion> findAll(Sort sort);

	ExamQuestion findOne(Exam exam, Question question);
	
	List<ExamQuestion> findByExam(Exam exam);

	ExamQuestion save(ExamQuestion entity);

}