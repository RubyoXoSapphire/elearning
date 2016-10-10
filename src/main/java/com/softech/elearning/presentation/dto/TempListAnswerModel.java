package com.softech.elearning.presentation.dto;

import java.util.List;

public class TempListAnswerModel {
	List<AnswerModel> answerModelList;
	public List<AnswerModel> getAnswerModelList() {
		return answerModelList;
	}

	public void setAnswerModelList(List<AnswerModel> answerModelList) {
		this.answerModelList = answerModelList;
	}

	public TempListAnswerModel(List<AnswerModel> answerModelList) {
		super();
		this.answerModelList = answerModelList;
	}

	public TempListAnswerModel() {
		super();
	}

	
}
