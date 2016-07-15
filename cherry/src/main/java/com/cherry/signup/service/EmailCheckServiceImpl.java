package com.cherry.signup.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherry.signup.domain.YcheckDto;
import com.cherry.signup.repository.EmailCheckDao;



@Service
public class EmailCheckServiceImpl implements EmailChekService {

	@Autowired
	private EmailCheckDao emailCheckDao;

	@Override
	public void NumInsert(YcheckDto ycheckDto) {
		emailCheckDao.NumInsert(ycheckDto);
	}

	@Override
	public YcheckDto select(YcheckDto ycheckDto) {
		return emailCheckDao.select(ycheckDto);
	}

	
}
