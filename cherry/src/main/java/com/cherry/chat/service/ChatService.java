package com.cherry.chat.service;

import java.util.List;

import com.cherry.chat.domain.FriendDto;
import com.cherry.chat.domain.GetMemberDto;
import com.cherry.chat.domain.LastSequenceDto;
import com.cherry.chat.domain.RoomDto;
import com.cherry.chat.domain.RoomListDto;
import com.cherry.chat.domain.SearchDto;

public interface ChatService {
	public List<FriendDto> myFriends(String yaman_one);

	public List<FriendDto> searchFd(SearchDto searchDto);

	public int insertRoom(RoomDto roomDto);

	public int insertMyRoomList(RoomListDto roomListDto);

	public List<RoomListDto> getMyChatRoomList(String yaman_id);

	public int deleteMyChatRoom(String ychatlist_id);

	public LastSequenceDto getLastInsert();

	public RoomListDto getListInsertRoomInfo(String ychatlist_id);

	public List<FriendDto> getRoomMember(GetMemberDto getMemberDto);
}
