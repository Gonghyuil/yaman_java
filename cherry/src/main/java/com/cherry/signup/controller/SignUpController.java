package com.cherry.signup.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherry.signup.domain.SignUpDto;
import com.cherry.signup.domain.YcheckDto;
import com.cherry.signup.service.EmailChekService;
import com.cherry.signup.service.MailSerivceImpl;
import com.cherry.signup.service.SignUpService;

@Controller
public class SignUpController {
	
	@Autowired
	MailSerivceImpl ms;
	@Autowired
	EmailChekService emailCheckService;

	private String realFolder = "D:/dev_2stProject/workspace_project/cherry/src/main/webapp/resources/images/";
	
	@RequestMapping(value = "/singupemail", method = RequestMethod.POST)
	public void sendMail(HttpServletResponse res, 
			@RequestParam(value = "ycheck_id", required = false) String ycheck_id)
			throws IOException {

		int ynum = (int) (Math.random() * 1000000) + 1;
		YcheckDto ycheckDto = new YcheckDto(ycheck_id, Integer.toString(ynum));
		emailCheckService.NumInsert(ycheckDto);

		// 보내는 사람, 받는사람, 제목, 내용
		String result = 
					ms.sendMail("test@test.com", ycheckDto.getYcheck_id(), "회원가입 인증 메일입니다.", ycheckDto.getYnum());
		res.getWriter().print(ycheckDto.getYcheck_id());
	}

	// 메일 인증
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public @ResponseBody YcheckDto checkNum(@RequestBody YcheckDto ycheckDto) {
		return emailCheckService.select(ycheckDto);
	}

	@Autowired
	SignUpService signUpService;

	// 회원가입
	@RequestMapping(value = "/sign_up", method = RequestMethod.POST)
		public @ResponseBody SignUpDto signUp(@RequestBody SignUpDto signUpDto) {
			System.out.println(signUpDto);
			signUpService.insertYaman(signUpDto);
			signUpService.insertPwd(signUpDto);

			System.out.println("등록후" + signUpDto.toString());
			return signUpDto;
		}
	// 회원가입시 사진 업로드
	@RequestMapping(value = "/signUpImg", method = RequestMethod.POST)
	public @ResponseBody SignUpDto signUpImg(MultipartHttpServletRequest request)
			throws IllegalStateException, IOException {
		
		SignUpDto signUpDto = new SignUpDto();
		signUpDto.setYemail(request.getParameter("imgEmail"));
		File dir = new File(realFolder);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}

		MultipartFile file = request.getFile("hiddenInput");
		if (null != file && file.getSize() > 0) {
			String fileName = file.getOriginalFilename();
			String newFilename = fileName.substring(fileName.lastIndexOf("."));
			String storedFileName = System.currentTimeMillis() + newFilename;
			dir = new File(realFolder + storedFileName);
			file.transferTo(dir);
			signUpDto.setYface(storedFileName);
		}
		signUpService.updataYface(signUpDto);
		return signUpDto;
	}
}
