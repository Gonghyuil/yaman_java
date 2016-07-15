package com.cherry.chat.domain;

public class SearchDto {
	private String yaman_one;
	private String yname;

	public String getYaman_one() {
		return yaman_one;
	}

	public String getYname() {
		return yname;
	}

	public void setYaman_one(String yaman_one) {
		this.yaman_one = yaman_one;
	}

	public void setYname(String yname) {
		this.yname = yname;
	}

	public SearchDto(String yaman_one, String yname) {
		super();
		this.yaman_one = yaman_one;
		this.yname = yname;
	}

	public SearchDto() {
		super();
	}

}
