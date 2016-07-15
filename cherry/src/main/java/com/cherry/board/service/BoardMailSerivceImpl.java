package com.cherry.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class BoardMailSerivceImpl implements BoardMailService {

	@Autowired
	private MailSender mailSender;

	@Override
	public String sendMail(String answer_yaman_id, String yemail, String answer_title, String answer) {
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom(answer_yaman_id);
			message.setTo(yemail);
			message.setSubject(answer_title);
			message.setText(answer);
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "ok";
	}
}
