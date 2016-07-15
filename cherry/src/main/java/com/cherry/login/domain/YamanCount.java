package com.cherry.login.domain;

public class YamanCount {

	private String Count;
	private String yexit;

	public String getCount() {
		return Count;
	}

	public void setCount(String count) {
		Count = count;
	}

	public String getYexit() {
		return yexit;
	}

	public void setYexit(String yexit) {
		this.yexit = yexit;
	}

	public YamanCount(String count, String yexit) {
		super();
		Count = count;
		this.yexit = yexit;
	}

	public YamanCount() {
		super();
	}

}
