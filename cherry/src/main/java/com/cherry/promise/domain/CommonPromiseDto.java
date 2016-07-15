package com.cherry.promise.domain;

public class CommonPromiseDto {
	private String ypromise_id;
	private String Yaman_id;
	private String YCHATLIST_ID;
	
	
	public CommonPromiseDto() {
		super();
	}
	public CommonPromiseDto(String ypromise_id, String yaman_id, String yCHATLIST_ID) {
		super();
		this.ypromise_id = ypromise_id;
		Yaman_id = yaman_id;
		YCHATLIST_ID = yCHATLIST_ID;
	}
	public String getYpromise_id() {
		return ypromise_id;
	}
	public void setYpromise_id(String ypromise_id) {
		this.ypromise_id = ypromise_id;
	}
	public String getYaman_id() {
		return Yaman_id;
	}
	public void setYaman_id(String yaman_id) {
		Yaman_id = yaman_id;
	}
	public String getYCHATLIST_ID() {
		return YCHATLIST_ID;
	}
	public void setYCHATLIST_ID(String yCHATLIST_ID) {
		YCHATLIST_ID = yCHATLIST_ID;
	}
	@Override
	public String toString() {
		return "commonPromiseDto [ypromise_id=" + ypromise_id + ", Yaman_id=" + Yaman_id + ", YCHATLIST_ID="
				+ YCHATLIST_ID + "]";
	}
	
	
	
}
