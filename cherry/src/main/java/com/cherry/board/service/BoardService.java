package com.cherry.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cherry.board.domain.BoardDto;
import com.cherry.board.domain.EmailAnswerDto;


@Service
public interface BoardService {

	public List<BoardDto> selectList();

	public BoardDto selectOne(String yboard_id);

	public int insert(BoardDto boardDto);

	public int yboard_del(String yboard_id);

	public int EmailSave(EmailAnswerDto emailDto);
}
