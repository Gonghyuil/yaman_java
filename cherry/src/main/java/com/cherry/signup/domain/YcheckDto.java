package com.cherry.signup.domain;

public class YcheckDto {

	private String ycheck_id;
	private String ynum;

	public YcheckDto() {
		super();
	}

	public YcheckDto(String ycheck_id, String ynum) {
		super();
		this.ycheck_id = ycheck_id;
		this.ynum = ynum;
	}

	public String getYcheck_id() {
		return ycheck_id;
	}

	public void setYcheck_id(String ycheck_id) {
		this.ycheck_id = ycheck_id;
	}

	public String getYnum() {
		return ynum;
	}

	public void setYnum(String ynum) {
		this.ynum = ynum;
	}

	@Override
	public String toString() {
		return "YcheckDto [ycheck_id=" + ycheck_id + ", ynum=" + ynum + "]";
	}

}
