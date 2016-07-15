package com.cherry.board.domain;

public class EmailAnswerDto {

	private String yemail;
	private String yaman_id;
	private String yname;
	private String yboard_id;
	private String answer;
	private String answer_title;
	private String answer_yaman_id;
	private String answer_date;

	public String getYemail() {
		return yemail;
	}

	public void setYemail(String yemail) {
		this.yemail = yemail;
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

	public String getYboard_id() {
		return yboard_id;
	}

	public void setYboard_id(String yboard_id) {
		this.yboard_id = yboard_id;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAnswer_title() {
		return answer_title;
	}

	public void setAnswer_title(String answer_title) {
		this.answer_title = answer_title;
	}

	public String getAnswer_yaman_id() {
		return answer_yaman_id;
	}

	public void setAnswer_yaman_id(String answer_yaman_id) {
		this.answer_yaman_id = answer_yaman_id;
	}

	public String getAnswer_date() {
		return answer_date;
	}

	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}

	@Override
	public String toString() {
		return "EmailAnswerDto [yemail=" + yemail + ", yaman_id=" + yaman_id + ", yname=" + yname + ", yboard_id="
				+ yboard_id + ", answer=" + answer + ", answer_title=" + answer_title + ", answer_yaman_id="
				+ answer_yaman_id + ", answer_date=" + answer_date + "]";
	}

	public EmailAnswerDto(String yemail, String yaman_id, String yname, String yboard_id, String answer,
			String answer_title, String answer_yaman_id, String answer_date) {
		super();
		this.yemail = yemail;
		this.yaman_id = yaman_id;
		this.yname = yname;
		this.yboard_id = yboard_id;
		this.answer = answer;
		this.answer_title = answer_title;
		this.answer_yaman_id = answer_yaman_id;
		this.answer_date = answer_date;
	}

	public EmailAnswerDto() {
		super();
	}

}
