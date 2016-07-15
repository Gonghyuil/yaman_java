package com.cherry.photo.domain;

public class PhotoDto {

	private String yaman_id;
	private String yphotofile;
	private String yphoto_id;
	private String ypromise_id;

	public PhotoDto() {
		super();
	}

	public PhotoDto(String yaman_id, String yphotofile, String yphoto_id, String ypromise_id) {
		super();
		this.yaman_id = yaman_id;
		this.yphotofile = yphotofile;
		this.yphoto_id = yphoto_id;
		this.ypromise_id = ypromise_id;
	}

	public String getYaman_id() {
		return yaman_id;
	}

	public void setYaman_id(String yaman_id) {
		this.yaman_id = yaman_id;
	}

	public String getYphotofile() {
		return yphotofile;
	}

	public void setYphotofile(String yphotofile) {
		this.yphotofile = yphotofile;
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

	@Override
	public String toString() {
		return "PhotoDto [yaman_id=" + yaman_id + ", yphotofile=" + yphotofile + ", yphoto_id=" + yphoto_id
				+ ", ypromise_id=" + ypromise_id + "]";
	}

}
