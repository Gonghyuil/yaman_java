package com.cherry.reply.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherry.reply.domain.ReplyDto;

@Repository
public class ReplyDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int insertReply(ReplyDto replyDto) {
		return sqlSessionTemplate.insert("com.cherry.reply.mapper.replyMapper.replyinsert", replyDto);
	}

	public ReplyDto selectMy(ReplyDto replyDto) {
		return sqlSessionTemplate.selectOne("com.cherry.reply.mapper.replyMapper.selectMy", replyDto);
	}

	public List<ReplyDto> ReplyAllList(String ypromis_id) {
		System.out.println(ypromis_id);
		return sqlSessionTemplate.selectList("com.cherry.reply.mapper.replyMapper.replyAllList", ypromis_id);
	}
	
	public void deleteReply(String yreply_id){
		sqlSessionTemplate.delete("com.cherry.reply.mapper.replyMapper.deleteReply", yreply_id);
	}
}
