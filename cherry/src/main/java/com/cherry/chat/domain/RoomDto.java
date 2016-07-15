package com.cherry.chat.domain;

public class RoomDto {
	private String friend_one;
	private String friend_two;
	private String roomname;

	public RoomDto(String friend_one, String friend_two, String roomname) {
		super();
		this.friend_one = friend_one;
		this.friend_two = friend_two;
		this.roomname = roomname;
	}

	public RoomDto() {
		super();
	}

	public String getFriend_one() {
		return friend_one;
	}

	public String getFriend_two() {
		return friend_two;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setFriend_one(String friend_one) {
		this.friend_one = friend_one;
	}

	public void setFriend_two(String friend_two) {
		this.friend_two = friend_two;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

}
