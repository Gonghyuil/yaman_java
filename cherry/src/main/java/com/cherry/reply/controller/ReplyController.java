package com.cherry.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherry.photo.service.PhotoService;
import com.cherry.reply.domain.ReplyDto;
import com.cherry.reply.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	@Autowired
	private PhotoService photoservise;

	@RequestMapping(value = "/allreply/{ypromis_id}", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDto> photoList(@PathVariable("ypromis_id") String ypromis_id) {
		System.out.println(ypromis_id);
		List<ReplyDto> yreplyList = replyService.ReplyAllList(ypromis_id);
		System.out.println(yreplyList);
		System.out.println("들어온거야?");
		return replyService.ReplyAllList(ypromis_id);
	}

	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public @ResponseBody ReplyDto replyRes(@RequestBody ReplyDto yreply) {
		replyService.insert(yreply);
		replyService.selectMy(yreply);
		System.out.println(replyService.selectMy(yreply));
		return replyService.selectMy(yreply);
	}
	
	@RequestMapping(value = "/delrep/{yreply_id}", method = RequestMethod.POST)
	public @ResponseBody ReplyDto delrep(@PathVariable("yreply_id") String yreply_id) {
		replyService.deleteReply(yreply_id);
		ReplyDto replydto = new ReplyDto();
		return replydto;
	}
}
