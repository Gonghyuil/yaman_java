package com.cherry.login.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherry.login.domain.MasterDto;
import com.cherry.login.domain.YamanCount;

@Repository
public class MasterDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MasterDto> listAll() {
		return sqlSession.selectList("com.cherry.login.mapper.loginMapper.masterlist");
	}

	public YamanCount yamanCount() {
		return sqlSession.selectOne("com.cherry.login.mapper.loginMapper.yamanCount");
	}

	public YamanCount yamanExitCount() {
		return sqlSession.selectOne("com.cherry.login.mapper.loginMapper.yamanExitCount");
	}
}
