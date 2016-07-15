package com.cherry.login.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherry.login.domain.AuthInfo;
import com.cherry.login.domain.InfoDto;

@Repository
public class LoginDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public AuthInfo login(InfoDto infoDto) {
		return sqlSession.selectOne("com.cherry.login.mapper.loginMapper.login", infoDto);
	}

	public int checkLogin(String yaman_id) {
		return sqlSession.update("com.cherry.login.mapper.loginMapper.checkLogin", yaman_id);
	}

	public int checkLoginOut(String yaman_id) {
		return sqlSession.update("com.cherry.login.mapper.loginMapper.checkLoginOut", yaman_id);
	}
}
