package com.cherry.friend.service;

import java.util.List;

import com.cherry.friend.domain.YamanDto;

public interface FriendService {
	public List<YamanDto> friendList(String yaman_one);

	public List<YamanDto> searchFriendList(YamanDto yamanDto);

	public YamanDto myInfo(String yaman_one);

	public int updateMyInfo(YamanDto myInfo);

	public int breakFriend(YamanDto yamanDto);

	public int brkFriend(YamanDto yamanDto);

	public int brkmsg(YamanDto yamanDto);


	public List<YamanDto> fdAddList(YamanDto yamanDto);

	public List<YamanDto> brkMessageSelect(String userId);

	public int readMsgChange(YamanDto yamanDto);

	public int friendReq(YamanDto yamanDto);
	
	public int insertReq(YamanDto yamanDto);

	public List<YamanDto> reqMessage(String userId);

	public int reqUpdate(YamanDto yamanDto);

	public int reqInsert(YamanDto yamanDto);

	public int deleteFdReq(YamanDto yamanDto);

	public int deleteYfriend(YamanDto yamanDto);

	public List<YamanDto> fdListRefresh(String yaman_id);


	public int updateYface(YamanDto yamanDto);
}

