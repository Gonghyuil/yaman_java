package com.cherry.board.domain;

public class BoardDto {

	private String yboard_id;
	private String yaman_id;
	private String ysubject;
	private String ycontent;
	private String yregdt;
	private String yboard_del;
	private String yemail;

	public String getYboard_id() {
		return yboard_id;
	}

	public void setYboard_id(String yboard_id) {
		this.yboard_id = yboard_id;
	}

	public String getYaman_id() {
		return yaman_id;
	}

	public void setYaman_id(String yaman_id) {
		this.yaman_id = yaman_id;
	}

	public String getYsubject() {
		return ysubject;
	}

	public void setYsubject(String ysubject) {
		this.ysubject = ysubject;
	}

	public String getYcontent() {
		return ycontent;
	}

	public void setYcontent(String ycontent) {
		this.ycontent = ycontent;
	}

	public String getYregdt() {
		return yregdt;
	}

	public void setYregdt(String yregdt) {
		this.yregdt = yregdt;
	}

	public String getYboard_del() {
		return yboard_del;
	}

	public void setYboard_del(String yboard_del) {
		this.yboard_del = yboard_del;
	}

	public String getYemail() {
		return yemail;
	}

	public void setYemail(String yemail) {
		this.yemail = yemail;
	}

	public BoardDto(String yboard_id, String yaman_id, String ysubject, String ycontent, String yregdt,
			String yboard_del, String yemail) {
		super();
		this.yboard_id = yboard_id;
		this.yaman_id = yaman_id;
		this.ysubject = ysubject;
		this.ycontent = ycontent;
		this.yregdt = yregdt;
		this.yboard_del = yboard_del;
		this.yemail = yemail;
	}

	public BoardDto() {
		super();
	}

}
