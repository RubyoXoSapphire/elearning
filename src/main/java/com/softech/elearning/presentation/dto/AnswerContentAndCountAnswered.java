package com.softech.elearning.presentation.dto;

public class AnswerContentAndCountAnswered {
	String content;
	int count;

	public AnswerContentAndCountAnswered() {
		super();
	}

	public AnswerContentAndCountAnswered(String content, int count) {
		super();
		this.content = content;
		this.count = count;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
