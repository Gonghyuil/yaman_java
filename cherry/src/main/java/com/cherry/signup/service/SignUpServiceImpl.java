package com.cherry.signup.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherry.friend.domain.YamanDto;
import com.cherry.signup.domain.SignUpDto;
import com.cherry.signup.repository.SignUpDao;



@Service
public class SignUpServiceImpl implements SignUpService {

	@Autowired
	SignUpDao signUpDao;

	@Override
	public void insertYaman(SignUpDto signUpDto) {
		signUpDao.insertYaman(signUpDto);
	}

	public void insertPwd(SignUpDto signUpDto) {
		signUpDao.insertPwd(signUpDto);
	};

	@Override
	public void updataYface(SignUpDto signUpDto) {
		signUpDao.updataYface(signUpDto);
	};

}
