package com.cherry.board.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherry.board.domain.BoardDto;
import com.cherry.board.domain.EmailAnswerDto;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<BoardDto> selectList() {
		return sqlSession.selectList("com.cherry.board.mapper.BoardMapper.selectList");
	}

	public BoardDto selectOne(String yboard_id) {
		return sqlSession.selectOne("com.cherry.board.mapper.BoardMapper.selectOne", yboard_id);
	}

	public int insert(BoardDto boardDto) {
		return sqlSession.insert("com.cherry.board.mapper.BoardMapper.insert", boardDto);

	}

	public int yboard_del(String yboard_id) {
		return sqlSession.update("com.cherry.board.mapper.BoardMapper.yboard_del", yboard_id);
	}

	public int EmailSave(EmailAnswerDto emailAnswerDto) {
		return sqlSession.update("com.cherry.board.mapper.BoardMapper.emailSave", emailAnswerDto);
	}

}
