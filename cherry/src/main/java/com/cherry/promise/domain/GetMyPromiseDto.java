package com.cherry.promise.domain;

public class GetMyPromiseDto {
	private String yaman_id;
	private String yprodate;

	public GetMyPromiseDto(String yaman_id, String yprodate) {
		super();
		this.yaman_id = yaman_id;
		this.yprodate = yprodate;
	}
	public GetMyPromiseDto() {
		super();
	}
	public String getYaman_id() {
		return yaman_id;
	}
	public void setYaman_id(String yaman_id) {
		this.yaman_id = yaman_id;
	}

	public String getYprodate() {
		return yprodate;
	}

	public void setYprodate(String yprodate) {
		this.yprodate = yprodate;
	}


}
