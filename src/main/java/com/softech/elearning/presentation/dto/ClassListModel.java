package com.softech.elearning.presentation.dto;

import java.util.List;

public class ClassListModel {
	List<ClassModel> clazzList;

	public ClassListModel() {
		super();
	}

	public ClassListModel(List<ClassModel> clazzList) {
		super();
		this.clazzList = clazzList;
	}

	public List<ClassModel> getClazzList() {
		return clazzList;
	}

	public void setClazzList(List<ClassModel> clazzList) {
		this.clazzList = clazzList;
	}

}
