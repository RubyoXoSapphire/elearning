package com.softech.elearning.data.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.Answer;
import com.softech.elearning.data.domain.Question;

@Repository
public interface AnswerDao extends JpaRepository<Answer, Integer> {

	List<Answer> findByQuestion(Question question);

	Answer findByQuestionAndAnswerIdAndRight(Question question, int answerId, boolean right);

	List<Answer> findByQuestionAndRight(Question question, boolean right);

}