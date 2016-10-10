package com.softech.elearning.presentation.dto;

import com.softech.elearning.data.domain.Answer;
import com.softech.elearning.data.domain.Question;

public class QuestionAndFourAnswerModel {
	Question question;
	Answer answer1;
	Answer answer2;
	Answer answer3;
	Answer answer4;
		
	public QuestionAndFourAnswerModel() {
		super();
	}

	public QuestionAndFourAnswerModel(Question question, Answer answer1, Answer answer2, Answer answer3,
			Answer answer4) {
		super();
		this.question = question;
		this.answer1 = answer1;
		this.answer2 = answer2;
		this.answer3 = answer3;
		this.answer4 = answer4;
	}
	
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public Answer getAnswer1() {
		return answer1;
	}
	public void setAnswer1(Answer answer1) {
		this.answer1 = answer1;
	}
	public Answer getAnswer2() {
		return answer2;
	}
	public void setAnswer2(Answer answer2) {
		this.answer2 = answer2;
	}
	public Answer getAnswer3() {
		return answer3;
	}
	public void setAnswer3(Answer answer3) {
		this.answer3 = answer3;
	}
	public Answer getAnswer4() {
		return answer4;
	}
	public void setAnswer4(Answer answer4) {
		this.answer4 = answer4;
	}
	
	
}
