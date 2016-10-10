package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.Exam;
import com.softech.elearning.data.domain.Question;

public interface QuestionService {
	long count();

	void delete(Question entity);

	void delete(List<Question> entities);

	void delete(Integer id);

	void deleteAll();

	boolean exists(Integer id);

	List<Question> findAll();

	Page<Question> findAll(int pageNumber, int pageSize, Sort sort);

	List<Question> findAll(Sort sort);

	Question findOne(Integer id);

	Question save(Question entity);

	List<Question> findQuestionByExam(Exam exam);

	Page<Question> search(int pageNumber, int pageSize, String keyword);
}