package com.softech.elearning.presentation.dto;

import java.util.List;

import com.softech.elearning.data.domain.Answer;
import com.softech.elearning.data.domain.Question;

public class QuestionAndListAnswerModel2 {
	Question question;
	TempListAnswerModel listAnswer;
	double realMark;
	double mark;

	public QuestionAndListAnswerModel2() {

	}

	public QuestionAndListAnswerModel2(Question question, TempListAnswerModel listAnswer) {
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

	public TempListAnswerModel getListAnswer() {
		return listAnswer;
	}

	public void setListAnswer(TempListAnswerModel listAnswer) {
		this.listAnswer = listAnswer;
	}

}
