package com.cherry.login.domain;

public class AuthInfo {
	private String yaman_id;
	private String yname;
	private String ymaster;

	public AuthInfo(String yaman_id, String yname, String ymaster) {
		super();
		this.yaman_id = yaman_id;
		this.yname = yname;
		this.ymaster = ymaster;
	}
	public AuthInfo() {
		super();
	}
	public String getYaman_id() {
		return yaman_id;
	}

	public void setYaman_id(String yaman_id) {
		this.yaman_id = yaman_id;
	}
	public String getYname() {
		return yname;
	}
	public void setYname(String yname) {
		this.yname = yname;
	}

	public String getYmaster() {
		return ymaster;
	}

	public void setYmaster(String ymaster) {
		this.ymaster = ymaster;
	}


}
