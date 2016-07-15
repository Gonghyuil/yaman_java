package com.cherry.yjoin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherry.yjoin.domain.YjoinDto;
import com.cherry.yjoin.repository.YjoinDao;

@Service
public class YjoinServiceImpl implements YjoinService {

	@Autowired
	private YjoinDao yjoinDao;

	@Override
	public int insert(YjoinDto yjoinDto) {
		return yjoinDao.insertYjoin(yjoinDto);

	}


}
