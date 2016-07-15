package com.cherry.yjoin.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherry.yjoin.domain.YjoinDto;

@Repository
public class YjoinDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertYjoin(YjoinDto yjoinDto) {
		return sqlSession.insert("com.cherry.join.mapper.JoinMapper.insertYjoin", yjoinDto);
	}

}
