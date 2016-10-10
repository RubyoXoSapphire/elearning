package com.softech.elearning.presentation.dto;

import com.softech.elearning.data.domain.Exam;

public class ExamAndQuestionCountModel {
	Exam exam;
	int countQuestion;

	public ExamAndQuestionCountModel() {

	}

	public ExamAndQuestionCountModel(Exam exam, int countQuestion) {
		super();
		this.exam = exam;
		this.countQuestion = countQuestion;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	public int getCountQuestion() {
		return countQuestion;
	}

	public void setCountQuestion(int countQuestion) {
		this.countQuestion = countQuestion;
	}

}
