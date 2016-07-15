package com.cherry.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherry.login.domain.AuthInfo;
import com.cherry.login.domain.InfoDto;
import com.cherry.login.domain.YamanCount;
import com.cherry.login.repository.LoginDao;
import com.cherry.login.repository.MasterDao;

@Service
public class LoginServiceImple implements LoginService {
	@Autowired
	private LoginDao loginDao;

	@Autowired
	private MasterDao masterDao;

	@Override
	public AuthInfo login(InfoDto infoDto) {
		return loginDao.login(infoDto);
	}

	@Override
	public int checkLogin(String yaman_id) {
		return loginDao.checkLogin(yaman_id);
	}

	@Override
	public int checkLoginOut(String yaman_id) {
		return loginDao.checkLoginOut(yaman_id);
	}

	@Override
	public YamanCount yamanCount() {
		return masterDao.yamanCount();
	}

	@Override
	public YamanCount yamanExitCount() {
		return masterDao.yamanExitCount();
	}

}
