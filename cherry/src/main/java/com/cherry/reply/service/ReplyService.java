package com.cherry.reply.service;

import java.util.List;

import com.cherry.reply.domain.ReplyDto;

public interface ReplyService {

	public int insert(ReplyDto replyDto);

	public ReplyDto selectMy(ReplyDto replyDto);

	public List<ReplyDto> ReplyAllList(String ypromis_id);
	
	public void deleteReply(String yreply_id);
}
