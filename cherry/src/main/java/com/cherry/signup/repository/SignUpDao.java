package com.cherry.signup.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherry.friend.domain.YamanDto;
import com.cherry.signup.domain.SignUpDto;



@Repository
public class SignUpDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertYaman(SignUpDto signUpDto) {
		sqlSessionTemplate.insert("com.cherry.signup.mapper.signupMapper.signUp", signUpDto);
	}

	public void insertPwd(SignUpDto signUpDto) {
		sqlSessionTemplate.insert("com.cherry.signup.mapper.signupMapper.insertPwd", signUpDto);
	};

	public void updataYface(SignUpDto signUpDto) {
		sqlSessionTemplate.update("com.cherry.signup.mapper.signupMapper.yfaceUpload", signUpDto);
	};
}
