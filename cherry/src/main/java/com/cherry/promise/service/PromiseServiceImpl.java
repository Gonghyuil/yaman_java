package com.cherry.promise.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherry.promise.domain.GetMyPromiseDto;
import com.cherry.promise.domain.MessageDto2;
import com.cherry.promise.domain.PromiseDto;
import com.cherry.promise.repository.PromiseDao;

@Service
public class PromiseServiceImpl implements PromiseService {

	@Autowired
	private PromiseDao promiseDao;

	@Override
	public List<PromiseDto> listAll(String yaman_id) {
		return promiseDao.selectAll(yaman_id);
	}

	@Override
	public PromiseDto selectOne(String ypromise_id) {
		return promiseDao.selectOne(ypromise_id);
	}

	@Override
	public List<PromiseDto> selectList(GetMyPromiseDto getMyPromiseDto) {
		return promiseDao.selectList(getMyPromiseDto);
	}

	@Override
	public int insertPromise(PromiseDto promiseDto) {
		return promiseDao.insertPromise(promiseDto);
	}

	@Override
	public int updatePromise(PromiseDto promiseDto) {
		return promiseDao.updatePromise(promiseDto);
	}

	@Override
	public int deletePromise(String ypromise_id) {
		return promiseDao.deletePromise(ypromise_id);
	}

	@Override
	public List<PromiseDto> checkPromise(PromiseDto promiseDto) {
		return promiseDao.checkPromise(promiseDto);
	}

	@Override
	public PromiseDto selectPromiseMap(PromiseDto promiseDto) {
		return promiseDao.selectPromiseMap(promiseDto);
	}

	@Override
	public List<PromiseDto> listAllpromise(String yaman_id) {
		return promiseDao.listAllpromise(yaman_id);
	}

	// 채팅으로 약속잡기
	public int yproinsert(PromiseDto promiseDto) {
		return promiseDao.yproinsert(promiseDto);
	};

	@Override
	public List<MessageDto2> selectfriendId(String roomname) {
		return promiseDao.selectfriendId(roomname);
	};

	@Override
	public void insertYjoin(MessageDto2 messageDto) {
		promiseDao.insertYjoin(messageDto);
	};


}