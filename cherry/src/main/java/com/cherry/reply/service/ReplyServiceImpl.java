package com.cherry.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherry.reply.domain.ReplyDto;
import com.cherry.reply.repository.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao replyDao;

	@Override
	public int insert(ReplyDto replyDto) {
		return replyDao.insertReply(replyDto);
	}

	@Override
	public ReplyDto selectMy(ReplyDto replyDto) {
		return replyDao.selectMy(replyDto);
	}

	@Override
	public List<ReplyDto> ReplyAllList(String ypromis_id) {
		return replyDao.ReplyAllList(ypromis_id);
	}
	
	public void deleteReply(String yreply_id){
		replyDao.deleteReply(yreply_id);
	};
}
