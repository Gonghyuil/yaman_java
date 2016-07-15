package com.cherry.login.domain;

public class MasterDto {

	private String yaman_id;
	private String yname;
	private String yemail;
	private String yexit;
	private String yreg;

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

	public String getYemail() {
		return yemail;
	}

	public void setYemail(String yemail) {
		this.yemail = yemail;
	}

	public String getYexit() {
		return yexit;
	}

	public void setYexit(String yexit) {
		this.yexit = yexit;
	}

	public String getYreg() {
		return yreg;
	}

	public void setYreg(String yreg) {
		this.yreg = yreg;
	}

	public MasterDto(String yaman_id, String yname, String yemail, String yexit, String yreg) {
		super();
		this.yaman_id = yaman_id;
		this.yname = yname;
		this.yemail = yemail;
		this.yexit = yexit;
		this.yreg = yreg;
	}

	public MasterDto() {
		super();
	}

}