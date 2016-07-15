package com.cherry.photo.service;

import java.util.List;

import com.cherry.photo.domain.PhotoDto;

public interface PhotoService {

	public void insertPhoto(PhotoDto photo);

	public List<PhotoDto> onePromisePhotoAllList(String ypromisid);

	public List<PhotoDto> AllMyList(PhotoDto photodto);

	public List<PhotoDto> photoAllList(String ypromise_id);

	public void DeletePhoto(String yphoto_id);


}
