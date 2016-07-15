package com.cherry.promise.domain;

public class MessageDto2 {
	private String friend_one;
	private String friend_two;
	private String roomname;
	private String mid;
	private String status;
	private String ypromise_id;
	private String yaman_id;

	public MessageDto2(String friend_one, String friend_two, String roomname, String mid, String status,
			String ypromise_id, String yaman_id) {
		super();
		this.friend_one = friend_one;
		this.friend_two = friend_two;
		this.roomname = roomname;
		this.mid = mid;
		this.status = status;
		this.ypromise_id = ypromise_id;
		this.yaman_id = yaman_id;
	}

	public MessageDto2() {
		super();
	}
	public String getFriend_one() {
		return friend_one;
	}
	public void setFriend_one(String friend_one) {
		this.friend_one = friend_one;
	}
	public String getFriend_two() {
		return friend_two;
	}
	public void setFriend_two(String friend_two) {
		this.friend_two = friend_two;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getYpromise_id() {
		return ypromise_id;
	}
	public void setYpromise_id(String ypromise_id) {
		this.ypromise_id = ypromise_id;
	}

	public String getYaman_id() {
		return yaman_id;
	}

	public void setYaman_id(String yaman_id) {
		this.yaman_id = yaman_id;
	}

}
