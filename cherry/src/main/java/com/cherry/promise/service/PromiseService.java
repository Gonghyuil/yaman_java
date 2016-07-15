package com.cherry.promise.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cherry.promise.domain.GetMyPromiseDto;
import com.cherry.promise.domain.MessageDto2;
import com.cherry.promise.domain.PromiseDto;

@Service
public interface PromiseService {

	// 전체 리스트
	List<PromiseDto> listAll(String yaman_id);

	// 아이디별 상세약속
	PromiseDto selectOne(String ypromise_id);

	// 일자별 약속 리스트
	List<PromiseDto> selectList(GetMyPromiseDto getMyPromiseDto);

	// 약속 수정하기
	int insertPromise(PromiseDto promiseDto);

	// 약속 삭제하기
	int deletePromise(String ypromise_id);

	// 약속 업데이트하기
	int updatePromise(PromiseDto promiseDto);

	// 일정 중복 체크
	List<PromiseDto> checkPromise(PromiseDto promiseDto);

	// 지도 가져오는
	public PromiseDto selectPromiseMap(PromiseDto promiseDto);

	public List<PromiseDto> listAllpromise(String yaman_id);

	// 채팅으로 약속잡기
	// 추가분
	public int yproinsert(PromiseDto promiseDto);

	public List<MessageDto2> selectfriendId(String roomname);

	public void insertYjoin(MessageDto2 messageDto);

}