package com.cherry.friend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherry.friend.domain.YamanDto;
import com.cherry.friend.repository.FriendDao;

@Service
public class FriendServiceImpl implements FriendService {

	@Autowired
	private FriendDao friendDao;

	@Override
	public List<YamanDto> friendList(String yaman_one) {
		return friendDao.myFriendList(yaman_one);
	}

	@Override
	public List<YamanDto> searchFriendList(YamanDto yamanDto) {

		return friendDao.searchFriendList(yamanDto);
	}

	public YamanDto myInfo(String yaman_one) {
		return friendDao.myInfo(yaman_one);
	}

	@Override
	public int updateMyInfo(YamanDto myInfo) {
		return friendDao.updateMyInfo(myInfo);

	}

	@Override
	public int breakFriend(YamanDto yamanDto) {
		return friendDao.BrkFriend(yamanDto);
	}

	@Override
	public int brkFriend(YamanDto yamanDto) {
		return friendDao.BrkFd(yamanDto);
	}

	@Override
	public int brkmsg(YamanDto yamanDto) {
		return friendDao.brkMsg(yamanDto);
	}



	@Override
	public List<YamanDto> fdAddList(YamanDto yamanDto) {
		return friendDao.fdAddList(yamanDto);
	}

	@Override
	public List<YamanDto> brkMessageSelect(String userId) {
		return friendDao.brkMessageSelect(userId);
	}

	@Override
	public int readMsgChange(YamanDto yamanDto) {
		return friendDao.readMsgChange(yamanDto);
	}

	@Override
	public int friendReq(YamanDto yamanDto) {
		return friendDao.friendReq(yamanDto);
	}

	@Override
	public int insertReq(YamanDto yamanDto) {
		return friendDao.insertReq(yamanDto);
	}

	@Override
	public List<YamanDto> reqMessage(String userId) {
		return friendDao.reqMessage(userId);
	}

	@Override
	public int reqUpdate(YamanDto yamanDto) {
		return friendDao.reqUpdate(yamanDto);
	}

	@Override
	public int reqInsert(YamanDto yamanDto) {
		return friendDao.reqInsert(yamanDto);
	}

	@Override
	public int deleteFdReq(YamanDto yamanDto) {
		return friendDao.deleteFdReq(yamanDto);
	}

	@Override
	public int deleteYfriend(YamanDto yamanDto) {
		return friendDao.deleteYfriend(yamanDto);
	}

	@Override
	public List<YamanDto> fdListRefresh(String yaman_id) {
		return friendDao.fdListRefresh(yaman_id);
	}

	@Override
	public int updateYface(YamanDto yamanDto) {
		return friendDao.updateYface(yamanDto);
	}

}
