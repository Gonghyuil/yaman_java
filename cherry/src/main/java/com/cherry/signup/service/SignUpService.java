package com.cherry.signup.service;

import com.cherry.signup.domain.SignUpDto;

public interface SignUpService {

	public void insertYaman(SignUpDto signUpDto);

	public void updataYface(SignUpDto signUpDto);

	public void insertPwd(SignUpDto signUpDto);
	
}
