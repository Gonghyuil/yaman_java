package com.cherry.photo.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherry.photo.domain.PhotoDto;

@Repository
public class PhotoDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertPhoto(PhotoDto photoDto) {

		sqlSessionTemplate.insert("com.kedu.cherry.mapper.photoMapper.photoInsert", photoDto);
	}

	public List<PhotoDto> onePromisePhotoAllList(String promisid) {
		return sqlSessionTemplate.selectList("com.kedu.cherry.mapper.photoMapper.onePromisePhotoAllList", promisid);
	}

	public List<PhotoDto> AllMyList(PhotoDto photoDto) {
		return sqlSessionTemplate.selectList("com.kedu.cherry.mapper.photoMapper.photoAllMyList", photoDto);
	}
	
	public List<PhotoDto> photoAllList(String ypromise_id) {
		return sqlSessionTemplate.selectList("com.kedu.cherry.mapper.photoMapper.photoAllList", ypromise_id);

	}

	public void DeletePhoto(String yphoto_id) {
		sqlSessionTemplate.delete("com.kedu.cherry.mapper.photoMapper.photoDelete", yphoto_id);
	}


}
