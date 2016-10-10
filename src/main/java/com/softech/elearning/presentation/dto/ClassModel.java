package com.softech.elearning.presentation.dto;

import com.softech.elearning.data.domain.Class;

public class ClassModel {
	com.softech.elearning.data.domain.Class clazz;
	private boolean fuck = false;
	private int currentCount = 0;

	public ClassModel() {
		super();
	}

	public ClassModel(Class clazz, boolean fuck) {
		super();
		this.clazz = clazz;
		this.fuck = fuck;
	}

	public int getCurrentCount() {
		return currentCount;
	}

	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}

	public com.softech.elearning.data.domain.Class getClazz() {
		return clazz;
	}

	public void setClazz(com.softech.elearning.data.domain.Class clazz) {
		this.clazz = clazz;
	}

	public boolean getFuck() {
		return fuck;
	}

	public void setFuck(boolean fuck) {
		this.fuck = fuck;
	}

}
