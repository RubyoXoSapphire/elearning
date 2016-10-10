package com.softech.elearning.presentation.dto;

public class RegisterClassFormModel {
	ClassListModel classListModel;

	public RegisterClassFormModel() {
		super();
	}

	public RegisterClassFormModel(ClassListModel classListModel) {
		super();
		this.classListModel = classListModel;
	}

	public ClassListModel getClassListModel() {
		return classListModel;
	}

	public void setClassListModel(ClassListModel classListModel) {
		this.classListModel = classListModel;
	}

}
