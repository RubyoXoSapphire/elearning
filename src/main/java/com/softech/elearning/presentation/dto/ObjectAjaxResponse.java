package com.softech.elearning.presentation.dto;


import org.springframework.data.domain.Page;

import com.softech.elearning.data.domain.Semester;


public class ObjectAjaxResponse<T> {
	String msg;
	String code;
	Page<T> result;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Page<T> getResult() {
		return result;
	}
	public void setResult(Page<T> result) {
		this.result = result;
	}
	
}
