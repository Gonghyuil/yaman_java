package com.cherry.chat.domain;

public class InviteDto {
	private String roomname;
	private String friend_one;
	private String[] friend_two;
	private String status;

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getFriend_one() {
		return friend_one;
	}

	public void setFriend_one(String friend_one) {
		this.friend_one = friend_one;
	}

	public String[] getFriend_two() {
		return friend_two;
	}

	public void setFriend_two(String[] friend_two) {
		this.friend_two = friend_two;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public InviteDto(String roomname, String friend_one, String[] friend_two, String status) {
		super();
		this.roomname = roomname;
		this.friend_one = friend_one;
		this.friend_two = friend_two;
		this.status = status;
	}

	public InviteDto() {
		super();
	}

}
