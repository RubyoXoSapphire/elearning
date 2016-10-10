package com.softech.elearning.data.domain;

import java.io.Serializable;
import javax.persistence.*;

import org.springframework.stereotype.Component;

import java.util.List;

/**
 * The persistent class for the type database table.
 * 
 */
@Component
@Entity
@NamedQuery(name = "Type.findAll", query = "SELECT t FROM Type t")
public class Type implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "type_id")
	private int typeId;

	@Column(name = "content_type")
	private String contentType;

	private byte enabled;

	// bi-directional many-to-one association to Question
	@OneToMany(mappedBy = "type", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Question> questions;

	public Type() {
	}

	public int getTypeId() {
		return this.typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getContentType() {
		return this.contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public byte getEnabled() {
		return this.enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}

	public List<Question> getQuestions() {
		return this.questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public Question addQuestion(Question question) {
		getQuestions().add(question);
		question.setType(this);

		return question;
	}

	public Question removeQuestion(Question question) {
		getQuestions().remove(question);
		question.setType(null);

		return question;
	}

}