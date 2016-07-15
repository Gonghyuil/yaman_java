package com.cherry.photo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherry.photo.domain.PhotoDto;
import com.cherry.photo.repository.PhotoDao;

@Service
public class PhotoServiceImple implements PhotoService {

	@Autowired
	private PhotoDao photoDao;

	@Override
	public void insertPhoto(PhotoDto photoDto) {
		photoDao.insertPhoto(photoDto);
	}

	@Override
	public List<PhotoDto> onePromisePhotoAllList(String promisid) {
		return photoDao.onePromisePhotoAllList(promisid);
	}

	@Override
	public List<PhotoDto> AllMyList(PhotoDto photoDto) {
		return photoDao.AllMyList(photoDto);
	}

	@Override
	public List<PhotoDto> photoAllList(String ypromise_id) {
		return photoDao.photoAllList(ypromise_id);
	}

	@Override
	public void DeletePhoto(String yphoto_id) {
		photoDao.DeletePhoto(yphoto_id);
	}

}
