package com.cherry.board.service;

public interface BoardMailService {
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
	public String sendMail(String answer_yaman_id, String yemail, String answer_title, String answer);
}
