package com.softech.elearning.data.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

import org.springframework.stereotype.Component;

/**
 * The persistent class for the answer database table.
 * 
 */
@Component
@Entity
@NamedQuery(name = "Answer.findAll", query = "SELECT a FROM Answer a")
public class Answer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "answer_id")
	private int answerId;

	@Lob
	private String content;

	@Column(name = "is_right")
	private boolean right;

	// bi-directional many-to-one association to Question
	@ManyToOne
	@JoinColumn(name = "question_id")
	private Question question;

	// bi-directional many-to-one association to Answersheetdetail
	@OneToMany(mappedBy = "answer", fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<AnswerSheetDetail> answerSheetDetails;

	public Answer() {
	}

	public int getAnswerId() {
		return this.answerId;
	}

	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean getRight() {
		return right;
	}

	public void setRight(boolean right) {
		this.right = right;
	}

	public Question getQuestion() {
		return this.question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public List<AnswerSheetDetail> getAnswerSheetDetails() {
		return this.answerSheetDetails;
	}

	public void setAnswersheetdetails(List<AnswerSheetDetail> answerSheetDetails) {
		this.answerSheetDetails = answerSheetDetails;
	}

	public AnswerSheetDetail addAnswerSheetDetail(AnswerSheetDetail answerSheetDetail) {
		getAnswerSheetDetails().add(answerSheetDetail);
		answerSheetDetail.setAnswer(this);

		return answerSheetDetail;
	}

	public AnswerSheetDetail removeAnswersheetdetail(AnswerSheetDetail answerSheetDetail) {
		getAnswerSheetDetails().remove(answerSheetDetail);
		answerSheetDetail.setAnswer(null);

		return answerSheetDetail;
	}

}