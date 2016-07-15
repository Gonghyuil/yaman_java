package com.cherry.login.service;

import com.cherry.login.domain.AuthInfo;
import com.cherry.login.domain.InfoDto;
import com.cherry.login.domain.YamanCount;

public interface LoginService {
	public AuthInfo login(InfoDto infoDto);

	public int checkLogin(String yaman_id);

	public int checkLoginOut(String yaman_id);

	public YamanCount yamanCount();

	public YamanCount yamanExitCount();
}
