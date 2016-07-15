package com.cherry.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherry.board.domain.BoardDto;
import com.cherry.board.domain.EmailAnswerDto;
import com.cherry.board.repository.BoardDao;

@Service
public class BoardServiceImple implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<BoardDto> selectList() {
		return boardDao.selectList();
	}

	@Override
	public BoardDto selectOne(String yboard_id) {
		return boardDao.selectOne(yboard_id);
	}

	@Override
	public int insert(BoardDto boardDto) {
		return boardDao.insert(boardDto);
	}

	@Override
	public int yboard_del(String yboard_id) {
		return boardDao.yboard_del(yboard_id);
	}

	@Override
	public int EmailSave(EmailAnswerDto emailAnswerDto) {
		return boardDao.EmailSave(emailAnswerDto);
	}


}

