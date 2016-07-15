package com.cherry.chat.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherry.chat.domain.MessageDto;
import com.cherry.chat.domain.RoomDto;

@Repository
public class MessageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MessageDto> getMessage(String yaman_id) {
		return sqlSession.selectList("com.cherry.chat.mapper.chatMapper.getMessage", yaman_id);
	}

	public int nopeChat(String mid) {
		return sqlSession.update("com.cherry.chat.mapper.chatMapper.nopeChat", mid);
	}

	public int yesChat(String mid) {
		return sqlSession.update("com.cherry.chat.mapper.chatMapper.yesChat", mid);
	}

	public MessageDto getRoomName(String mid) {
		return sqlSession.selectOne("com.cherry.chat.mapper.chatMapper.getRoomName", mid);
	}

	public int insertRoom(RoomDto roomDto) {
		return sqlSession.insert("com.cherry.chat.mapper.chatMapper.insertRoom", roomDto);
	}
}
