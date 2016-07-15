package com.cherry.chat.domain;

public class LastSequenceDto {
	private String ychatlist_id;

	public LastSequenceDto(String ychatlist_id) {
		super();
		this.ychatlist_id = ychatlist_id;
	}

	public String getYchatlist_id() {
		return ychatlist_id;
	}

	public void setYchatlist_id(String ychatlist_id) {
		this.ychatlist_id = ychatlist_id;
	}

	public LastSequenceDto() {
		super();
	}

}
