package com.softech.elearning.data.domain;

import java.io.Serializable;
import javax.persistence.*;

import org.springframework.stereotype.Component;

import java.util.List;

/**
 * The persistent class for the chapter database table.
 * 
 */
@Component
@Entity
@NamedQuery(name = "Chapter.findAll", query = "SELECT c FROM Chapter c")
public class Chapter implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "chapter_id")
	private int chapterId;

	@Column(name = "chaper_serial")
	private int chaperSerial;

	private byte enabled;

	private String name;

	@Lob
	private String notes;

	// bi-directional many-to-one association to Subject
	@ManyToOne
	@JoinColumn(name = "subject_id")
	private Subject subject;

	// bi-directional many-to-one association to Question
	@OneToMany(mappedBy = "chapter", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Question> questions;

	public Chapter() {
	}

	public int getChapterId() {
		return this.chapterId;
	}

	public void setChapterId(int chapterId) {
		this.chapterId = chapterId;
	}

	public int getChaperSerial() {
		return this.chaperSerial;
	}

	public void setChaperSerial(int chaperSerial) {
		this.chaperSerial = chaperSerial;
	}

	public byte getEnabled() {
		return this.enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNotes() {
		return this.notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public List<Question> getQuestions() {
		return this.questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public Question addQuestion(Question question) {
		getQuestions().add(question);
		question.setChapter(this);

		return question;
	}

	public Question removeQuestion(Question question) {
		getQuestions().remove(question);
		question.setChapter(null);

		return question;
	}

}