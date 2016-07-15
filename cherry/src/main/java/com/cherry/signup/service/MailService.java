package com.cherry.signup.service;

public interface MailService {
	/**
	 * 메일발송
	 * 
	 * @param from
	 *            보내는사람
	 * @param to
	 *            받는사람
	 * @param subject
	 *            제목
	 * @param text
	 *            내용
	 */
	public String sendMail(String from, String to, String subject, String text);
}
