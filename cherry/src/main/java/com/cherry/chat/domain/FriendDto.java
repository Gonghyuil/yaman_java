package com.cherry.chat.domain;

public class FriendDto {
	private String yaman_id;
	private String yname;

	public String getYaman_id() {
		return yaman_id;
	}
	public String getYname() {
		return yname;
	}
	public void setYaman_id(String yaman_id) {
		this.yaman_id = yaman_id;
	}
	public void setYname(String yname) {
		this.yname = yname;
	}

	public FriendDto(String yaman_id, String yname) {
		super();
		this.yaman_id = yaman_id;
		this.yname = yname;
	}

	public FriendDto() {
		super();
	}
}
