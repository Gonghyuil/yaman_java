package com.cherry.yjoin.domain;

public class YjoinDto {

	private String yjoin;
	private String yaman_id;
	private String yamans;

	public YjoinDto() {
		super();
	}

	public YjoinDto(String yaman_id) {
		super();
		this.yaman_id = yaman_id;
	}

	public YjoinDto(String yjoin, String yaman_id) {
		super();
		this.yjoin = yjoin;
		this.yaman_id = yaman_id;
	}

	public YjoinDto(String yjoin, String yaman_id, String yamans) {
		super();
		this.yjoin = yjoin;
		this.yaman_id = yaman_id;
		this.yamans = yamans;
	}


	public String getYjoin() {
		return yjoin;
	}

	public void setYjoin(String yjoin) {
		this.yjoin = yjoin;
	}

	public String getYaman_id() {
		return yaman_id;
	}

	public void setYaman_id(String yaman_id) {
		this.yaman_id = yaman_id;
	}

	public String getYamans() {
		return yamans;
	}

	public void setYamans(String yamans) {
		this.yamans = yamans;
	}

	@Override
	public String toString() {
		return "YjoinDto [yjoin=" + yjoin + ", yaman_id=" + yaman_id + ", yamans=" + yamans
				+ "]";
	}

}
