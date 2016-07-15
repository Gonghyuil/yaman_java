package com.cherry.signup.service;

import com.cherry.signup.domain.YcheckDto;

public interface EmailChekService {

	public void NumInsert(YcheckDto ycheckDto);

	public YcheckDto select(YcheckDto ycheckDto);
}
