package com.softech.elearning.presentation.dto;

import java.util.List;

public class QuestionContentAndAnswerContentModel {
	String questionContent;
	int countAnswered;
	List<AnswerContentAndCountAnswered> answerContentAndCountAnsweredList;

	public QuestionContentAndAnswerContentModel() {
	}

	public QuestionContentAndAnswerContentModel(String questionContent, int countAnswered,
			List<AnswerContentAndCountAnswered> answerContentAndCountAnsweredList) {
		this.questionContent = questionContent;
		this.countAnswered = countAnswered;
		this.answerContentAndCountAnsweredList = answerContentAndCountAnsweredList;
	}

	public int getCountAnswered() {
		return countAnswered;
	}

	public void setCountAnswered(int countAnswered) {
		this.countAnswered = countAnswered;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public List<AnswerContentAndCountAnswered> getAnswerContentAndCountAnsweredList() {
		return answerContentAndCountAnsweredList;
	}

	public void setAnswerContentAndCountAnsweredList(
			List<AnswerContentAndCountAnswered> answerContentAndCountAnsweredList) {
		this.answerContentAndCountAnsweredList = answerContentAndCountAnsweredList;
	}

}
