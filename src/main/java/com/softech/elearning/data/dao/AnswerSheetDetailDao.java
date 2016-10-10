package com.softech.elearning.data.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.Answer;
import com.softech.elearning.data.domain.AnswerSheet;
import com.softech.elearning.data.domain.AnswerSheetDetail;
import com.softech.elearning.data.domain.Question;

@Repository
public interface AnswerSheetDetailDao extends JpaRepository<AnswerSheetDetail, Integer> {
	List<AnswerSheetDetail> findByQuestionAndAnswerSheet(Question question, AnswerSheet answerSheet);

	AnswerSheetDetail findByQuestionAndAnswerAndAnswerSheet(Question question, Answer answer, AnswerSheet answerSheet);

	List<AnswerSheetDetail> findByAnswerSheet(AnswerSheet answerSheet);

	Integer countByAnswerSheetAnswerSheetId(int answerSheetId);

	Integer countByAnswer(Answer answer);
	
	Integer countByQuestion(Question question);
}