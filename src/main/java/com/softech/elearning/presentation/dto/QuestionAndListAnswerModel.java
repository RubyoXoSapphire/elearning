package com.softech.elearning.presentation.dto;

import java.util.List;

import com.softech.elearning.data.domain.Answer;
import com.softech.elearning.data.domain.Question;

public class QuestionAndListAnswerModel {
	Question question;
	List<AnswerModel> listAnswer;
	double realMark;
	double mark;

	public QuestionAndListAnswerModel() {

	}

	public QuestionAndListAnswerModel(Question question, List<AnswerModel> listAnswer) {
		super();
		this.question = question;
		this.listAnswer = listAnswer;
	}

	public Question getQuestion() {
		return question;
	}

	public double getRealMark() {
		return realMark;
	}

	public void setRealMark(double realMark) {
		this.realMark = realMark;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public double getMark() {
		return mark;
	}

	public void setMark(double mark) {
		this.mark = mark;
	}

	public List<AnswerModel> getListAnswer() {
		return listAnswer;
	}

	public void setListAnswer(List<AnswerModel> listAnswer) {
		this.listAnswer = listAnswer;
	}

}
