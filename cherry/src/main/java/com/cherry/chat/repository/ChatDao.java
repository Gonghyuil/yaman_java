package com.cherry.chat.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherry.chat.domain.FriendDto;
import com.cherry.chat.domain.GetMemberDto;
import com.cherry.chat.domain.LastSequenceDto;
import com.cherry.chat.domain.RoomDto;
import com.cherry.chat.domain.RoomListDto;
import com.cherry.chat.domain.SearchDto;

@Repository
public class ChatDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<FriendDto> myFriends(String yaman_one) {
		return sqlSession.selectList("com.cherry.chat.mapper.chatMapper.myFriends", yaman_one);
	}

	public List<FriendDto> searchFd(SearchDto searchDto) {
		return sqlSession.selectList("com.cherry.chat.mapper.chatMapper.searchFd", searchDto);
	}

	public int insertRoom(RoomDto roomDto) {
		return sqlSession.insert("com.cherry.chat.mapper.chatMapper.insertRoom", roomDto);
	}

	public int insertMyRoomList(RoomListDto roomListDto) {
		return sqlSession.insert("com.cherry.chat.mapper.chatMapper.insertMyRoomList", roomListDto);
	}

	public List<RoomListDto> getMyChatRoomList(String yaman_id) {
		return sqlSession.selectList("com.cherry.chat.mapper.chatMapper.getMyChatRoomList", yaman_id);
	}

	public int deleteMyChatRoom(String ychatlist_id) {
		return sqlSession.delete("com.cherry.chat.mapper.chatMapper.deleteMyChatRoom", ychatlist_id);
	}

	public LastSequenceDto getLastInsert() {
		return sqlSession.selectOne("com.cherry.chat.mapper.chatMapper.getLastInsert");
	}

	public RoomListDto getListInsertRoomInfo(String ychatlist_id) {
		return sqlSession.selectOne("com.cherry.chat.mapper.chatMapper.getListInsertRoomInfo", ychatlist_id);
	}

	public List<FriendDto> getRoomMember(GetMemberDto getMemberDto) {
		return sqlSession.selectList("com.cherry.chat.mapper.chatMapper.getRoomMember", getMemberDto);
	}
}
