package com.softech.elearning.data.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;

import org.springframework.stereotype.Component;

/**
 * The persistent class for the answersheetdetail database table.
 * 
 */
@Component
@Entity
@NamedQuery(name = "AnswerSheetDetail.findAll", query = "SELECT a FROM AnswerSheetDetail a")
public class AnswerSheetDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "answersheetdetail_id")
	private int answerSheetDetailId;

	// bi-directional many-to-one association to Answer
	@ManyToOne
	@JoinColumn(name = "answer_id")
	private Answer answer;

	// bi-directional many-to-one association to Question
	@ManyToOne
	@JoinColumn(name = "question_id")
	private Question question;

	// bi-directional many-to-one association to Answersheet
	@ManyToOne
	@JoinColumn(name = "answersheet_id")
	private AnswerSheet answerSheet;

	public AnswerSheetDetail() {
	}

	public int getAnswerSheetDetailId() {
		return this.answerSheetDetailId;
	}

	public void setAnswerSheetDetailId(int answerSheetDetailId) {
		this.answerSheetDetailId = answerSheetDetailId;
	}

	public Answer getAnswer() {
		return this.answer;
	}

	public void setAnswer(Answer answer) {
		this.answer = answer;
	}

	public Question getQuestion() {
		return this.question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public AnswerSheet getAnswerSheet() {
		return this.answerSheet;
	}

	public void setAnswerSheet(AnswerSheet answerSheet) {
		this.answerSheet = answerSheet;
	}

	public AnswerSheetDetail(Question question, Answer answer) {
		super();
		this.answer = answer;
		this.question = question;
	}

}