package com.cherry.reply.domain;

public class ReplyDto {
	private String yaman_id;
	private String yphoto_id;
	private String ypromise_id;
	private int yreply_id;
	private String ytitle;
	private String yname;

	public ReplyDto() {
		super();
	}

	public String getYaman_id() {
		return yaman_id;
	}

	public void setYaman_id(String yaman_id) {
		this.yaman_id = yaman_id;
	}

	public String getYphoto_id() {
		return yphoto_id;
	}

	public void setYphoto_id(String yphoto_id) {
		this.yphoto_id = yphoto_id;
	}

	public String getYpromise_id() {
		return ypromise_id;
	}

	public void setYpromise_id(String ypromise_id) {
		this.ypromise_id = ypromise_id;
	}

	public int getYreply_id() {
		return yreply_id;
	}

	public void setYreply_id(int yreply_id) {
		this.yreply_id = yreply_id;
	}

	public String getYtitle() {
		return ytitle;
	}

	public void setYtitle(String ytitle) {
		this.ytitle = ytitle;
	}

	public String getYname() {
		return yname;
	}

	public void setYname(String yname) {
		this.yname = yname;
	}

	@Override
	public String toString() {
		return "Yreply [yaman_id=" + yaman_id + ", yphoto_id=" + yphoto_id + ", ypromise_id=" + ypromise_id
				+ ", yreply_id=" + yreply_id + ", ytitle=" + ytitle + ", yname=" + yname + "]";
	}
}
