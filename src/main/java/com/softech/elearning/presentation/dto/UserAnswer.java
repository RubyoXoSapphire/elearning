package com.softech.elearning.presentation.dto;

import java.util.List;

//Use to store answers and questions of Student
public class UserAnswer {
	
	int questionId;
	List<Integer> answerIdList;
	
	public UserAnswer() {
		super();
	}

	public UserAnswer(int questionId, List<Integer> answerIdList) {
		super();
		this.questionId = questionId;
		this.answerIdList = answerIdList;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public List<Integer> getAnswerIdList() {
		return answerIdList;
	}

	public void setAnswerIdList(List<Integer> answerIdList) {
		this.answerIdList = answerIdList;
	}

}
