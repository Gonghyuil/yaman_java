package com.cherry.friend.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherry.friend.domain.YamanDto;

@Repository
public class FriendDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<YamanDto> myFriendList(String yaman_one) {
		
		return sqlSession.selectList("com.cherry.friend.mapper.myFriendList.myFriendList", yaman_one);
	}

	public List<YamanDto> searchFriendList(YamanDto yamanDto){
		return sqlSession.selectList("com.cherry.friend.mapper.myFriendList.searchFriendList", yamanDto);
	}
	
	public YamanDto myInfo(String yaman_one){
		return sqlSession.selectOne("com.cherry.friend.mapper.myFriendList.myInfo", yaman_one);
	}

	public int updateMyInfo(YamanDto myInfo) {
		return sqlSession.update("com.cherry.friend.mapper.myFriendList.updateMyInfo", myInfo);
	}

	public int BrkFriend(YamanDto yamanDto) {
		return sqlSession.delete("com.cherry.friend.mapper.myFriendList.breakFriend", yamanDto);
	}

	public int BrkFd(YamanDto yamanDto) {
		return sqlSession.delete("com.cherry.friend.mapper.myFriendList.brkFriend", yamanDto);
	}

	public int brkMsg(YamanDto yamanDto) {
		return sqlSession.insert("com.cherry.friend.mapper.myFriendList.brkmsg", yamanDto);
	}

	public List<YamanDto> brkMsgInfo(String yaman_one) {
		return sqlSession.selectList("com.cherry.friend.mapper.myFriendList.brkMsgInfo", yaman_one);
	}

	public List<YamanDto> fdAddList(YamanDto yamanDto) {
		return sqlSession.selectList("com.cherry.friend.mapper.myFriendList.fdAddList", yamanDto);
	}

	public List<YamanDto> brkMessageSelect(String userId) {
		return sqlSession.selectList("com.cherry.friend.mapper.myFriendList.brkMessageSelect", userId);
	}

	public int readMsgChange(YamanDto yamanDto) {
		return sqlSession.update("com.cherry.friend.mapper.myFriendList.readMsgChange", yamanDto);
	}

	public int friendReq(YamanDto yamanDto) {
		return sqlSession.insert("com.cherry.friend.mapper.myFriendList.friendReq", yamanDto);
	}

	public int insertReq(YamanDto yamanDto) {
		return sqlSession.insert("com.cherry.friend.mapper.myFriendList.insertReq", yamanDto);
	}

	public List<YamanDto> reqMessage(String userId) {
		return sqlSession.selectList("com.cherry.friend.mapper.myFriendList.reqMessage", userId);

	}

	public int reqUpdate(YamanDto yamanDto) {
		return sqlSession.update("com.cherry.friend.mapper.myFriendList.reqUpdate", yamanDto);
	}

	public int reqInsert(YamanDto yamanDto) {
		return sqlSession.insert("com.cherry.friend.mapper.myFriendList.reqInsert", yamanDto);
	}

	public int deleteFdReq(YamanDto yamanDto) {
		return sqlSession.delete("com.cherry.friend.mapper.myFriendList.deleteFdReq", yamanDto);
	}

	public int deleteYfriend(YamanDto yamanDto) {
		return sqlSession.delete("com.cherry.friend.mapper.myFriendList.deleteYfriend", yamanDto);
	}

	public List<YamanDto> fdListRefresh(String yaman_id) {
		return sqlSession.selectList("com.cherry.friend.mapper.myFriendList.fdListRefresh", yaman_id);
	}

	public int updateYok(String yaman_id) {
		return sqlSession.update("com.cherry.friend.mapper.myFriendList.updateYok", yaman_id);
	}

	public int updateYface(YamanDto yamanDto) {
		return sqlSession.update("com.cherry.friend.mapper.myFriendList.updateYface", yamanDto);
	}

}

