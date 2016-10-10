package com.softech.elearning.data.domain;

import java.io.Serializable;
import javax.persistence.*;

import org.springframework.stereotype.Component;


/**
 * The persistent class for the exam_question database table.
 * 
 */
@Component
@Entity
@Table(name="exam_question")
@NamedQuery(name="ExamQuestion.findAll", query="SELECT e FROM ExamQuestion e")
public class ExamQuestion implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private ExamQuestionPK id;

	private double mark;

	//bi-directional many-to-one association to Exam
	@ManyToOne
	@JoinColumn(name="exam_id", insertable=false, updatable=false)
	private Exam exam;

	//bi-directional many-to-one association to Question
	@ManyToOne
	@JoinColumn(name="question_id", insertable=false, updatable=false)
	private Question question;

	public ExamQuestion() {
	}

	public ExamQuestionPK getId() {
		return this.id;
	}

	public void setId(ExamQuestionPK id) {
		this.id = id;
	}

	public double getMark() {
		return this.mark;
	}

	public void setMark(double mark) {
		this.mark = mark;
	}

	public Exam getExam() {
		return this.exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	public Question getQuestion() {
		return this.question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

}