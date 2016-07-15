package com.cherry.friend.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherry.chat.controller.HomeController;
import com.cherry.friend.domain.YamanDto;
import com.cherry.friend.service.FriendService;
import com.cherry.login.domain.AuthInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FriendController {
	
	@Autowired
	private FriendService friendService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	// 내친구 목록
	@RequestMapping("search/{testId}")
	public @ResponseBody List<YamanDto> search(@PathVariable("testId") String yaman_one,
			@RequestParam("searchName") String yname, Locale locale, HttpServletResponse response) {
		logger.info("Welcome home! The client locale is {}.", locale);

		// System.out.println("yaman_one[" + yaman_one + "]");
		// System.out.println("searchName[" + yname + "]");

		YamanDto yamanDto = new YamanDto();
		yamanDto.setYaman_id(yaman_one);
		yamanDto.setYname(yname);

		// System.out.println(yamanDto);
		List<YamanDto> searchFriendList = friendService.searchFriendList(yamanDto);

		// System.out.println(searchFriendList);
		// if (searchFriendList.size() == 0)
		// return new ArrayList<YamanDto>();



		return searchFriendList;
	}

	// 내정보 변경
	@RequestMapping("/update")
	public @ResponseBody void updateInfo(@RequestBody YamanDto myInfo) {
		friendService.updateMyInfo(myInfo);
	}

	// 친구추가탭 검색
	@RequestMapping("/add")
	public @ResponseBody List<YamanDto> selectFriendList(@RequestBody YamanDto yamanDto, HttpSession session) {

		AuthInfo authInfo = (AuthInfo) session.getAttribute("loginUser");
		String yaman_id = authInfo.getYaman_id();
		yamanDto.setYaman_id(yaman_id);
		// System.out.println(yamanDto);

		List<YamanDto> fdAddList = friendService.fdAddList(yamanDto);
		// System.out.println("add" + fdAddList);
		return fdAddList;
	}

	// 절교하기 부분
	@RequestMapping("/breakFriend")
	public @ResponseBody YamanDto breakFriend(@RequestBody YamanDto yamanDto) {
		friendService.breakFriend(yamanDto);// yfriend : 친구상태를 delete
		friendService.brkFriend(yamanDto);// 내 상태를 친구와 delete
		friendService.brkmsg(yamanDto);// 절교 메세지 insert
		// Sys tem.out.println(yamanDto);
		return yamanDto;
	}

	// brkmessage 조회 부분
	@RequestMapping("/brkMessage")
	public @ResponseBody List<YamanDto> brkMessageSelect(HttpSession session) {

		AuthInfo authInfo = (AuthInfo) session.getAttribute("loginUser");
		String userId = authInfo.getYaman_id();
		List<YamanDto> brkMessage = friendService.brkMessageSelect(userId);
		// System.out.println("brkMessage"+brkMessage);
		return brkMessage;

	}

	// 절교메세지를 받은 사람이 메세지를 확인 하면 update해주는 컨트롤러
	@RequestMapping("/updateReadMsg")
	public void updateReadMsg(@RequestBody YamanDto yamanDto, HttpSession session) {
		friendService.readMsgChange(yamanDto);
		// System.out.println("updateReadMsg " + yamanDto);
	}

	// 친구추가 탭에서 검색으로 검색된 사람들 중 추가하고 싶은 친구의 checkbox를 체크하여
	// 요청버튼을 눌렀을때 선택된 사람들의 정보를 받아오는 컨트롤러
	@RequestMapping("/friendReq")
	public void reqInsert(@RequestParam(value = "loginId") String yaman_one,
			@RequestParam(value = "loginName") String yname,
			@RequestParam(value = "checkArray[]") List<String> checkArray) {

		String[] reqList = checkArray.toArray(new String[checkArray.size()]);

		YamanDto yamanDto = new YamanDto();
		for (String yaman_two : reqList) {
			yamanDto.setYaman_two(yaman_two);
			yamanDto.setYaman_one(yaman_one);
			yamanDto.setReq_me(yaman_one);
			yamanDto.setReq_friend(yaman_two);
			yamanDto.setReqme_name(yname);
		}
		System.out.println("friendReq" + yamanDto);
		// yfriend 테이블에 insert 한다.
		friendService.friendReq(yamanDto);
		// friendreq 테이블에 insert 한다.
		friendService.insertReq(yamanDto);
	}

	// 로그인을 하였을때 친구요청이 들어왔다면 메세지함 친구요청탭에 요청을 뿌려주는 컨트롤러
	@RequestMapping("/reqMessage")
	public @ResponseBody List<YamanDto> reqMessageSelect(HttpServletRequest request) {

		HttpSession session = request.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("loginUser");
		String userId = authInfo.getYaman_id();
		List<YamanDto> reqMessage = friendService.reqMessage(userId);
		// System.out.println("reqMessage" + reqMessage);
		return reqMessage;

	}

	// 친구요청 수락을 했을 경우
	@RequestMapping("/addFriend")
	public void addFriend(@RequestBody YamanDto yamanDto) {

		// 요청보낸 친구ID와 내ID를 갖고 yfriend의 상태를 1로 바꿔준다.(update)
		friendService.reqUpdate(yamanDto);

		// 거꾸로 내ID와 친구ID를 1인 상태로 insert 해준다.(요청할때는 한쪽에서만 일방적인 요청이기때문)
		friendService.reqInsert(yamanDto);

		// friendReq 테이블에 있는 요청 값(메세지)를 지운다.
		friendService.deleteFdReq(yamanDto);// yaman_two
		// System.out.println("addFriend" + yamanDto);
	}

	// 친구요청 거절을 했을 경우
	@RequestMapping("rejectFriend")
	public void rejectFriend(@RequestBody YamanDto yamanDto) {

		// 요청을 보낸 친구ID와 내ID를 갖고 yfriend의 상태 0을 삭제한다.(delete)
		friendService.deleteYfriend(yamanDto);
		System.out.println(yamanDto);
		// friendReq 테이블에 있는 요청값(메세지)를 지운다.
		friendService.deleteFdReq(yamanDto);// yaman_two
	}

	@RequestMapping("loginRefresh")
	public @ResponseBody List<YamanDto> fdListRefresh(HttpSession session) {

		AuthInfo authInfo = (AuthInfo) session.getAttribute("loginUser");
		String yaman_id = authInfo.getYaman_id();

		List<YamanDto> fdListRefresh = friendService.fdListRefresh(yaman_id);
		return fdListRefresh;
	}

	// 사진관련
	@RequestMapping(value = "/myImgUpdate", method = RequestMethod.POST)
	public @ResponseBody YamanDto myImgUpdate(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		String realFolder = "D:/YONG/Developer/dev_2stProject/workspace_project/cherry/src/main/webapp/resources/images/";
		YamanDto yamanDto = new YamanDto();
		File dir = new File(realFolder);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}

		AuthInfo authInfo = (AuthInfo) session.getAttribute("loginUser");
		String yaman_id = authInfo.getYaman_id();

		MultipartFile file = request.getFile("updateMyFace");

		String fileName = file.getOriginalFilename();

		fileName = new String(fileName.getBytes("8859_1"), "utf-8");

		if (null != file && file.getSize() > 0) {
			
			String newFilename = fileName.substring(fileName.lastIndexOf("."));
			String storedFileName = System.currentTimeMillis() + newFilename;
			dir = new File(realFolder + storedFileName);
			file.transferTo(dir);
			yamanDto.setYface(storedFileName);
			yamanDto.setYaman_id(yaman_id);
			
		} else {

			String noImg = "없음";
			yamanDto.setYface(noImg);
			yamanDto.setYaman_id(yaman_id);

		}
		friendService.updateYface(yamanDto);
		return yamanDto;
	}

}