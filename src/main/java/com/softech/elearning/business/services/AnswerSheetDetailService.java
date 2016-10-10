package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.Answer;
import com.softech.elearning.data.domain.AnswerSheet;
import com.softech.elearning.data.domain.AnswerSheetDetail;
import com.softech.elearning.data.domain.Question;

public interface AnswerSheetDetailService {
	long count();

	void delete(AnswerSheetDetail entity);

	void delete(List<AnswerSheetDetail> entities);

	void delete(Integer id);

	void deleteAll();

	boolean exists(Integer id);

	List<AnswerSheetDetail> findAll();

	List<AnswerSheetDetail> findAll(int pageNumber, int pageSize, Sort sort);

	List<AnswerSheetDetail> findAll(Sort sort);

	AnswerSheetDetail findOne(Integer id);

	AnswerSheetDetail save(AnswerSheetDetail entity);

	List<AnswerSheetDetail> findByQuestionAndAnswerSheet(Question question, AnswerSheet answerSheet);

	List<AnswerSheetDetail> findByAnswerSheet(AnswerSheet answerSheet);

	boolean checkIsSelected(Question question, Answer answer, AnswerSheet answerSheet);

	Integer countByAnswer(Answer answer);

	Integer countByQuestion(Question question);
}