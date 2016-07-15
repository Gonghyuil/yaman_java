package com.cherry.friend.domain;

import java.util.Date;

public class YamanDto {


	// yaman 테이블
	private String yaman_id;
	private String yname;
	private String ybirth;
	private String yphone;
	private String yemail;
	private String ycompany;
	private String yschool;
	private String yhello;
	private String yface;
	private Date yreg;
	private String yok;

	// yfriend 테이블
	private String yaman_one;
	private String yaman_two;
	private String y_status;

	// brkmessage 테이블
	private String brkmsgno;
	private String yaman_me;
	private String yaman_friend;
	private String msg;
	private String readmsg;
	private String me_name;
	private String friend_name;

	// friendReq 테이블
	private String reqno;
	private String req_me;
	private String req_friend;
	private String reqme_name;
	private String req_yn;


	public String getReq_yn() {
		return req_yn;
	}

	public void setReq_yn(String req_yn) {
		this.req_yn = req_yn;
	}

	public String getReqno() {
		return reqno;
	}

	public void setReqno(String reqno) {
		this.reqno = reqno;
	}

	public String getReq_me() {
		return req_me;
	}

	public void setReq_me(String req_me) {
		this.req_me = req_me;
	}

	public String getReq_friend() {
		return req_friend;
	}

	public void setReq_friend(String req_friend) {
		this.req_friend = req_friend;
	}

	public String getReqme_name() {
		return reqme_name;
	}

	public void setReqme_name(String reqme_name) {
		this.reqme_name = reqme_name;
	}





	public String getBrkmsgno() {
		return brkmsgno;
	}

	public void setBrkmsgno(String brkmsgno) {
		this.brkmsgno = brkmsgno;
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

	public String getYbirth() {
		return ybirth;
	}

	public void setYbirth(String ybirth) {
		this.ybirth = ybirth;
	}
	public String getYphone() {
		return yphone;
	}
	public void setYphone(String yphone) {
		this.yphone = yphone;
	}
	public String getYemail() {
		return yemail;
	}
	public void setYemail(String yemail) {
		this.yemail = yemail;
	}
	public String getYcompany() {
		return ycompany;
	}
	public void setYcompany(String ycompany) {
		this.ycompany = ycompany;
	}
	public String getYschool() {
		return yschool;
	}
	public void setYschool(String yschool) {
		this.yschool = yschool;
	}
	public String getYhello() {
		return yhello;
	}
	public void setYhello(String yhello) {
		this.yhello = yhello;
	}
	public String getYface() {
		return yface;
	}
	public void setYface(String yface) {
		this.yface = yface;
	}
	public Date getYreg() {
		return yreg;
	}
	public void setYreg(Date yreg) {
		this.yreg = yreg;
	}

	public String getYok() {
		return yok;
	}

	public void setYok(String yok) {
		this.yok = yok;
	}

	public String getYaman_one() {
		return yaman_one;
	}
	public void setYaman_one(String yaman_one) {
		this.yaman_one = yaman_one;
	}
	public String getYaman_two() {
		return yaman_two;
	}
	public void setYaman_two(String yaman_two) {
		this.yaman_two = yaman_two;
	}
	public String getY_status() {
		return y_status;
	}
	public void setY_status(String y_status) {
		this.y_status = y_status;
	}

	public String getYaman_me() {
		return yaman_me;
	}

	public void setYaman_me(String yaman_me) {
		this.yaman_me = yaman_me;
	}

	public String getYaman_friend() {
		return yaman_friend;
	}

	public void setYaman_friend(String yaman_friend) {
		this.yaman_friend = yaman_friend;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getReadmsg() {
		return readmsg;
	}

	public void setReadmsg(String readmsg) {
		this.readmsg = readmsg;
	}

	public String getMe_name() {
		return me_name;
	}

	public void setMe_name(String me_name) {
		this.me_name = me_name;
	}

	public String getFriend_name() {
		return friend_name;
	}

	public void setFriend_name(String friend_name) {
		this.friend_name = friend_name;
	}

	@Override
	public String toString() {
		return "YamanDto [yaman_id=" + yaman_id + ", yname=" + yname + ", ybirth=" + ybirth + ", yphone=" + yphone
				+ ", yemail=" + yemail + ", ycompany=" + ycompany + ", yschool=" + yschool + ", yhello=" + yhello
				+ ", yface=" + yface + ", yreg=" + yreg + ", yok=" + yok + ", yaman_one=" + yaman_one + ", yaman_two="
				+ yaman_two + ", y_status=" + y_status + ", brkmsgno=" + brkmsgno + ", yaman_me=" + yaman_me
				+ ", yaman_friend=" + yaman_friend + ", msg=" + msg + ", readmsg=" + readmsg + ", me_name=" + me_name
				+ ", friend_name=" + friend_name + ", reqno=" + reqno + ", req_me=" + req_me + ", req_friend="
				+ req_friend + ", reqme_name=" + reqme_name + ", req_yn=" + req_yn + "]";
	}







}
