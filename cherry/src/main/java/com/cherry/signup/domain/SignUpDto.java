package com.cherry.signup.domain;

import java.util.Date;

public class SignUpDto {
	private String yaman_id;
	private String ybirth;
	private String ycompany;
	private String yemail;
	private String yexit;
	private String yhello;
	private String yname;
	private String yphone;
	private Date yreg;
	private String yschool;
	private String yface;
	private String ypass;
	private String ycheck_check;
	
	
	
	public SignUpDto() {
		super();
	}



	public SignUpDto(String yaman_id, String ybirth, String ycompany, String yemail, String yexit, String yhello,
			String yname, String yphone, Date yreg, String yschool, String yface, String ypass, String ycheck_check) {
		super();
		this.yaman_id = yaman_id;
		this.ybirth = ybirth;
		this.ycompany = ycompany;
		this.yemail = yemail;
		this.yexit = yexit;
		this.yhello = yhello;
		this.yname = yname;
		this.yphone = yphone;
		this.yreg = yreg;
		this.yschool = yschool;
		this.yface = yface;
		this.ypass = ypass;
		this.ycheck_check = ycheck_check;
	}



	public String getYaman_id() {
		return yaman_id;
	}



	public void setYaman_id(String yaman_id) {
		this.yaman_id = yaman_id;
	}



	public String getYbirth() {
		return ybirth;
	}



	public void setYbirth(String ybirth) {
		this.ybirth = ybirth;
	}



	public String getYcompany() {
		return ycompany;
	}



	public void setYcompany(String ycompany) {
		this.ycompany = ycompany;
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



	public String getYhello() {
		return yhello;
	}



	public void setYhello(String yhello) {
		this.yhello = yhello;
	}



	public String getYname() {
		return yname;
	}



	public void setYname(String yname) {
		this.yname = yname;
	}



	public String getYphone() {
		return yphone;
	}



	public void setYphone(String yphone) {
		this.yphone = yphone;
	}



	public Date getYreg() {
		return yreg;
	}



	public void setYreg(Date yreg) {
		this.yreg = yreg;
	}



	public String getYschool() {
		return yschool;
	}



	public void setYschool(String yschool) {
		this.yschool = yschool;
	}



	public String getYface() {
		return yface;
	}



	public void setYface(String yface) {
		this.yface = yface;
	}



	public String getYpass() {
		return ypass;
	}



	public void setYpass(String ypass) {
		this.ypass = ypass;
	}



	public String getYcheck_check() {
		return ycheck_check;
	}



	public void setYcheck_check(String ycheck_check) {
		this.ycheck_check = ycheck_check;
	}
	
	
	
	
}
