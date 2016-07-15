package com.cherry.signup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class MailSerivceImpl implements MailService {

	@Autowired
	private MailSender mailSender;

	@Override
	public String sendMail(String from, String to, String subject, String text) {
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom(from);
			message.setTo(to);
			message.setSubject(subject);
			message.setText(text);
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "ok";
	}
}
