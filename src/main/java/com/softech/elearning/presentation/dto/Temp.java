package com.softech.elearning.presentation.dto;

import java.util.List;

public class Temp {
	List<QuestionAndListAnswerModel2> questionAndListAnswerModelList;

	public Temp() {
		super();
	}

	public Temp(List<QuestionAndListAnswerModel2> questionAndListAnswerModelList) {
		super();
		this.questionAndListAnswerModelList = questionAndListAnswerModelList;
	}

	public List<QuestionAndListAnswerModel2> getQuestionAndListAnswerModelList() {
		return questionAndListAnswerModelList;
	}

	public void setQuestionAndListAnswerModelList(List<QuestionAndListAnswerModel2> questionAndListAnswerModelList) {
		this.questionAndListAnswerModelList = questionAndListAnswerModelList;
	}

}
