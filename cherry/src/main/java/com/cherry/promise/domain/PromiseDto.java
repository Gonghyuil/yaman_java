package com.cherry.promise.domain;

public class PromiseDto {

	private String ypromise_id;
	private String yproname;
	private String yprodate;
	private String yprostart;
	private String yproend;
	private String yproloc;
	private String yprodone;
	private String yprodel;
	private String yprolocx;
	private String yprolocy;

	public PromiseDto() {
		super();
	}

	public PromiseDto(String ypromise_id, String yproname, String yprodate, String yprostart, String yproend,
			String yproloc, String yprodone, String yprodel, String yprolocx, String yprolocy) {
		super();
		this.ypromise_id = ypromise_id;
		this.yproname = yproname;
		this.yprodate = yprodate;
		this.yprostart = yprostart;
		this.yproend = yproend;
		this.yproloc = yproloc;
		this.yprodone = yprodone;
		this.yprodel = yprodel;
		this.yprolocx = yprolocx;
		this.yprolocy = yprolocy;
	}

	public PromiseDto(String yprodate, String yprostart) {
		super();
		this.yprodate = yprodate;
		this.yprostart = yprostart;
	}

	public String getYpromise_id() {
		return ypromise_id;
	}

	public void setYpromise_id(String ypromise_id) {
		this.ypromise_id = ypromise_id;
	}

	public String getYproname() {
		return yproname;
	}

	public void setYproname(String yproname) {
		this.yproname = yproname;
	}

	public String getYprodate() {
		return yprodate;
	}

	public void setYprodate(String yprodate) {
		this.yprodate = yprodate;
	}

	public String getYprostart() {
		return yprostart;
	}

	public void setYprostart(String yprostart) {
		this.yprostart = yprostart;
	}

	public String getYproend() {
		return yproend;
	}

	public void setYproend(String yproend) {
		this.yproend = yproend;
	}

	public String getYproloc() {
		return yproloc;
	}

	public void setYproloc(String yproloc) {
		this.yproloc = yproloc;
	}

	public String getYprodone() {
		return yprodone;
	}

	public void setYprodone(String yprodone) {
		this.yprodone = yprodone;
	}

	public String getYprodel() {
		return yprodel;
	}

	public void setYprodel(String yprodel) {
		this.yprodel = yprodel;
	}

	public String getYprolocx() {
		return yprolocx;
	}

	public void setYprolocx(String yprolocx) {
		this.yprolocx = yprolocx;
	}

	public String getYprolocy() {
		return yprolocy;
	}

	public void setYprolocy(String yprolocy) {
		this.yprolocy = yprolocy;
	}

	@Override
	public String toString() {
		return "PromiseDto [ypromise_id=" + ypromise_id + ", yproname=" + yproname + ", yprodate=" + yprodate
				+ ", yprostart=" + yprostart + ", yproend=" + yproend + ", yproloc=" + yproloc + ", yprodone="
				+ yprodone + ", yprodel=" + yprodel + ", yprolocx=" + yprolocx + ", yprolocy=" + yprolocy + "]";
	}

}