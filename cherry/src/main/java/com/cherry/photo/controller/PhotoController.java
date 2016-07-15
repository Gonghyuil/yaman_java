package com.cherry.photo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherry.login.domain.AuthInfo;
import com.cherry.photo.domain.PhotoDto;
import com.cherry.photo.service.PhotoService;

@Controller
public class PhotoController {

	private String realFolder = "D:/dev_2stProject/workspace_project/cherry/src/main/webapp/resources/images/";

	/* "resources"+File.separator+"images"+File.separator */

	@Autowired
	private PhotoService photoService;

	// 사진 업로드
	@RequestMapping(value = "/photoupload", method = RequestMethod.POST)
	public @ResponseBody List<PhotoDto> photoupload(MultipartHttpServletRequest request,
			HttpSession session) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("loginUser");
		String yaman_id = authInfo.getYaman_id();
		File dir = new File(realFolder);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		String path = "resources/images/";
		String realpath = request.getRealPath("/");
		PhotoDto photoDto = new PhotoDto();
		photoDto.setYpromise_id(request.getParameter("ypromise_id"));
		// 넘어온 파일을 리스트로 저장
		List<MultipartFile> files = request.getFiles("images");
		if (null != files && files.size() > 0) {
			for (MultipartFile multipartFile : files) {
				// 업로드 파일명
				String fileName = multipartFile.getOriginalFilename();
				// 파일명이 중복되지 않게 파일명에 시간 추가
				String newFileName = fileName.substring(fileName.lastIndexOf("."));
				// 저장 피일명
				String storedFileName = System.currentTimeMillis() + newFileName;
				// 파일 이동
				String realStoredName =  path + storedFileName;
				dir = new File(realpath+path + storedFileName);
				try {
					multipartFile.transferTo(dir);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				// yaman_id,yphotofile, yphoto_id, ypromise_id
				photoDto.setYaman_id(yaman_id);
				photoDto.setYphotofile(realStoredName);
				photoService.insertPhoto(photoDto);
			}
		}
		return photoService.AllMyList(photoDto);
	}// 사진

	//내가  미리 저장한 사진 받기
	@RequestMapping(value = "/listMyImg/{yaman_id}", method = RequestMethod.POST)
	public @ResponseBody List<PhotoDto> listMyImg(@PathVariable("yaman_id") String yaman_id,
			@RequestBody PhotoDto photoDto) {
		photoDto.setYaman_id(yaman_id);
		return photoService.AllMyList(photoDto);
	}

	@RequestMapping(value = "/photosAboutPromise/{promise_id}", method = RequestMethod.POST)
	public @ResponseBody List<PhotoDto> photosAboutPromise(@PathVariable("promise_id") String ypromise_id) {
		return photoService.photoAllList(ypromise_id);
	}

	@RequestMapping(value = "/imgDelete/{yphoto_id}", method = RequestMethod.POST)
	public @ResponseBody PhotoDto imgDelete(@PathVariable("yphoto_id") String yphoto_id) {
		System.out.println("삭제할 사진 " + yphoto_id);
		photoService.DeletePhoto(yphoto_id);
		PhotoDto photo = new PhotoDto();
		return photo;
	}

}
