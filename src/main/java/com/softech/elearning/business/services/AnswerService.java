package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.Answer;
import com.softech.elearning.data.domain.Question;

public interface AnswerService {

	long count();

	void delete(Answer entity);

	void delete(List<Answer> entities);

	void delete(Integer id);

	void deleteAll();

	boolean exists(Integer id);

	List<Answer> findAll();

	List<Answer> findAll(int pageNumber, int pageSize, Sort sort);

	List<Answer> findAll(Sort sort);

	Answer findOne(Integer id);

	Answer save(Answer entity);
	
	List<Answer> findByQuestion(Question question);
	
	public boolean checkAnswerIsRight(Question question, Answer answer);
	
	public boolean checkRightListAnswer(Question question, List<Answer> answerList);
	
	List<Answer> findRightAnswerListByQuestion(Question question);
}