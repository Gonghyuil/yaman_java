package com.cherry.chat.domain;

import java.util.List;

public class RoomListDto {
	private String ychatlist_id;
	private String yaman_id;
	private String roomname;
	private List<String> yname;

	public RoomListDto(String ychatlist_id, String yaman_id, String roomname, List<String> yname) {
		super();
		this.ychatlist_id = ychatlist_id;
		this.yaman_id = yaman_id;
		this.roomname = roomname;
		this.yname = yname;
	}
	public RoomListDto() {
		super();
	}
	public String getYchatlist_id() {
		return ychatlist_id;
	}
	public void setYchatlist_id(String ychatlist_id) {
		this.ychatlist_id = ychatlist_id;
	}
	public String getYaman_id() {
		return yaman_id;
	}
	public void setYaman_id(String yaman_id) {
		this.yaman_id = yaman_id;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public List<String> getYname() {
		return yname;
	}

	public void setYname(List<String> yname) {
		this.yname = yname;
	}
}
