package com.cherry.signup.repository;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherry.signup.domain.YcheckDto;


@Repository
public class EmailCheckDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void NumInsert(YcheckDto ycheckDto) {
		sqlSessionTemplate.insert("com.cherry.email.mapper.emailCheck.NumInsert", ycheckDto);
	}

	public YcheckDto select(YcheckDto ycheckDto) {
		return sqlSessionTemplate.selectOne("com.cherry.email.mapper.emailCheck.numSelect", ycheckDto);
	}
}
