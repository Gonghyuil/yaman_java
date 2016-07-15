package com.cherry.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherry.chat.domain.FriendDto;
import com.cherry.chat.domain.GetMemberDto;
import com.cherry.chat.domain.LastSequenceDto;
import com.cherry.chat.domain.RoomDto;
import com.cherry.chat.domain.RoomListDto;
import com.cherry.chat.domain.SearchDto;
import com.cherry.chat.repository.ChatDao;

@Service
public class ChatServiceImple implements ChatService {
	@Autowired
	private ChatDao chatDao;

	@Override
	public List<FriendDto> myFriends(String yaman_one) {

		return chatDao.myFriends(yaman_one);
	}

	@Override
	public List<FriendDto> searchFd(SearchDto searchDto) {
		return chatDao.searchFd(searchDto);
	}

	@Override
	public int insertRoom(RoomDto roomDto) {
		return chatDao.insertRoom(roomDto);
	}

	@Override
	public int insertMyRoomList(RoomListDto roomListDto) {
		return chatDao.insertMyRoomList(roomListDto);
	}

	@Override
	public List<RoomListDto> getMyChatRoomList(String yaman_id) {
		return chatDao.getMyChatRoomList(yaman_id);
	}

	@Override
	public int deleteMyChatRoom(String ychatlist_id) {
		return chatDao.deleteMyChatRoom(ychatlist_id);
	}

	@Override
	public LastSequenceDto getLastInsert() {
		return chatDao.getLastInsert();
	}

	@Override
	public RoomListDto getListInsertRoomInfo(String ychatlist_id) {
		return chatDao.getListInsertRoomInfo(ychatlist_id);
	}

	@Override
	public List<FriendDto> getRoomMember(GetMemberDto getMemberDto) {
		return chatDao.getRoomMember(getMemberDto);
	}

}
