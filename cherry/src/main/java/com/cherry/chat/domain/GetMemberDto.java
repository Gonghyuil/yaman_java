package com.cherry.chat.domain;

public class GetMemberDto {
	private String roomname;
	private String yaman_id;

	public GetMemberDto(String roomname, String yaman_id) {
		super();
		this.roomname = roomname;
		this.yaman_id = yaman_id;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getYaman_id() {
		return yaman_id;
	}

	public void setYaman_id(String yaman_id) {
		this.yaman_id = yaman_id;
	}

	public GetMemberDto() {
		super();
	}

}
