package com.cherry.login.domain;

public class InfoDto {
	private String yemail;
	private String ypass;

	public InfoDto(String yemail, String ypass) {
		super();
		this.yemail = yemail;
		this.ypass = ypass;
	}

	public InfoDto() {
		super();
	}

	public String getYemail() {
		return yemail;
	}

	public String getYpass() {
		return ypass;
	}

	public void setYemail(String yemail) {
		this.yemail = yemail;
	}

	public void setYpass(String ypass) {
		this.ypass = ypass;
	}

}
