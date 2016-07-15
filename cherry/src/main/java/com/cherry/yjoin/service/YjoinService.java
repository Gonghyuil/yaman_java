package com.cherry.yjoin.service;

import org.springframework.stereotype.Service;

import com.cherry.yjoin.domain.YjoinDto;

@Service
public interface YjoinService {

	public int insert(YjoinDto yjoinDto);

}
