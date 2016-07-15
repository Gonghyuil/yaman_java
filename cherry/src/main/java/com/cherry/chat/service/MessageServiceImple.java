package com.cherry.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherry.chat.domain.MessageDto;
import com.cherry.chat.domain.RoomDto;
import com.cherry.chat.repository.MessageDao;

@Service
public class MessageServiceImple implements MessageService {
	@Autowired
	private MessageDao messageDao;

	@Override
	public List<MessageDto> getMessage(String yaman_id) {
		return messageDao.getMessage(yaman_id);
	}

	@Override
	public int nopeChat(String mid) {
		return messageDao.nopeChat(mid);
	}

	@Override
	public int yesChat(String mid) {
		return messageDao.yesChat(mid);
	}

	@Override
	public MessageDto getRoomName(String mid) {
		return messageDao.getRoomName(mid);
	}

	@Override
	public int insertRoom(RoomDto roomDto) {
		return messageDao.insertRoom(roomDto);
	}
}
