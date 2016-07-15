package com.cherry.promise.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherry.promise.domain.GetMyPromiseDto;
import com.cherry.promise.domain.MessageDto2;
import com.cherry.promise.domain.PromiseDto;

@Repository
public class PromiseDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<PromiseDto> selectAll(String yaman_id) {
		return sqlSession.selectList("com.cherry.promise.mapper.PromiseMapper.selectAll", yaman_id);
	}

	public PromiseDto selectOne(String ypromise_id) {
		return sqlSession.selectOne("com.cherry.promise.mapper.PromiseMapper.selectOne", ypromise_id);
	}

	public List<PromiseDto> selectList(GetMyPromiseDto getMyPromiseDto) {
		return sqlSession.selectList("com.cherry.promise.mapper.PromiseMapper.selectList", getMyPromiseDto);
	}

	public int updatePromise(PromiseDto promiseDto) {
		return sqlSession.update("com.cherry.promise.mapper.PromiseMapper.updatePromise", promiseDto);
	}

	public int insertPromise(PromiseDto promiseDto) {
		return sqlSession.insert("com.cherry.promise.mapper.PromiseMapper.insertPromise", promiseDto);
	}

	public int deletePromise(String ypromise_id) {
		return sqlSession.delete("com.cherry.promise.mapper.PromiseMapper.deletePromise", ypromise_id);
	}

	public PromiseDto selectPromiseMap(PromiseDto promiseDto) {
		return sqlSession.selectOne("com.cherry.promise.mapper.PromiseMapper.promiseMap", promiseDto);
	}


	public List<PromiseDto> listAllpromise(String yaman_id) {
		return sqlSession.selectList("com.cherry.promise.mapper.PromiseMapper.listAllpromise", yaman_id);
	}

	// 약속 중복 체크
	public List<PromiseDto> checkPromise(PromiseDto promiseDto) {
		return sqlSession.selectList("com.cherry.promise.mapper.PromiseMapper.checkPromise", promiseDto);
	}

	// 채팅으로 약속잡기
	public int yproinsert(PromiseDto promiseDto) {
		return sqlSession.insert("com.cherry.promise.mapper.PromiseMapper.yproinsert", promiseDto);
	}

	public List<MessageDto2> selectfriendId(String roomname) {
		return sqlSession.selectList("com.cherry.promise.mapper.PromiseMapper.selectfriendId", roomname);

	};

	public void insertYjoin(MessageDto2 messageDto) {
		sqlSession.insert("com.cherry.promise.mapper.PromiseMapper.insertYjoin", messageDto);
	};

}
