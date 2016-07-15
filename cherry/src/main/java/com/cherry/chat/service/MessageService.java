package com.cherry.chat.service;

import java.util.List;

import com.cherry.chat.domain.MessageDto;
import com.cherry.chat.domain.RoomDto;

public interface MessageService {

	public List<MessageDto> getMessage(String yaman_id);

	public int nopeChat(String mid);

	public int yesChat(String mid);

	public MessageDto getRoomName(String mid);

	public int insertRoom(RoomDto roomDto);
}
