package com.softech.elearning.presentation.dto;

import java.io.Serializable;

import com.softech.elearning.data.domain.Answer;

public class AnswerModel implements Serializable {

	private Answer answer;

	private int fuck = 0;

	public AnswerModel() {
	}

	public AnswerModel(Answer answer, int fuck) {
		this.answer = answer;
		this.fuck = fuck;
	}

	public int getFuck() {
		return fuck;
	}

	public void setFuck(int fuck) {
		this.fuck = fuck;
	}

	public Answer getAnswer() {
		return answer;
	}

	public void setAnswer(Answer answer) {
		this.answer = answer;
	}

}