package com.cherry.chat.domain;

public class MessageDto {
	private String yname;
	private String roomname;
	private String mid;

	public MessageDto(String yname, String roomname, String mid) {
		super();
		this.yname = yname;
		this.roomname = roomname;
		this.mid = mid;
	}
	public MessageDto() {
		super();
	}

	public String getYname() {
		return yname;
	}
	public String getRoomname() {
		return roomname;
	}

	public String getMid() {
		return mid;
	}

	public void setYname(String yname) {
		this.yname = yname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

}
