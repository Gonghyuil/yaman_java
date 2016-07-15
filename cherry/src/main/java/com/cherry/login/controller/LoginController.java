package com.cherry.login.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherry.chat.domain.FriendDto;
import com.cherry.chat.domain.GetMemberDto;
import com.cherry.chat.domain.RoomListDto;
import com.cherry.chat.service.ChatService;
import com.cherry.friend.domain.YamanDto;
import com.cherry.friend.service.FriendService;
import com.cherry.login.domain.AuthInfo;
import com.cherry.login.domain.InfoDto;
import com.cherry.login.domain.MasterDto;
import com.cherry.login.domain.YamanCount;
import com.cherry.login.repository.MasterDao;
import com.cherry.login.service.LoginService;
import com.cherry.promise.domain.PromiseDto;
import com.cherry.promise.service.PromiseService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;

	@Autowired
	private FriendService friendService;

	@Autowired
	private PromiseService promiseService;

	@Autowired
	private ChatService chatSerivce;

	@Autowired
	private MasterDao masterDao;

	// 인덱스(로그인)페이지로 이동
	@RequestMapping(value = "/")
	public String index() {
		return "login/index";
	}

	// 로그인 메소드
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String goMain(HttpServletRequest request, HttpServletResponse response, Model model) {
		String yemail = request.getParameter("yemail");
		String ypass = request.getParameter("ypass");

		// 쿼리 실행을 위한 사용자 이메일/비밀번호 객체 생성
		InfoDto infoDto = new InfoDto(yemail, ypass);

		// 로그인 쿼리 실행 후 사용자 정보가 담긴 객체에 저장
		AuthInfo authInfo = loginService.login(infoDto);

		// 섹션객체의 유무, 매니져 유무 로 각 페이지 이동
		if (authInfo == null) {
			model.addAttribute("message", "no");
			return "login/index";
		} else if (authInfo.getYmaster().equals("Y")) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", authInfo);
			session.setMaxInactiveInterval(60 * 60 * 24);

			List<MasterDto> mastser = masterDao.listAll();
			model.addAttribute("MasterList", mastser);

			// 회원수 카운트
			YamanCount yamanCount = loginService.yamanCount();

			String count = yamanCount.getCount();

			model.addAttribute("yamanCount", yamanCount);

			YamanCount yamanExitCount = loginService.yamanExitCount();

			String yamanExitcount = yamanExitCount.getCount();

			model.addAttribute("yamanExitCount", yamanExitCount);

			int resultCount = (Integer.parseInt(count) - Integer.parseInt(yamanExitcount));

			model.addAttribute("resultCount", resultCount);
			return "login/yamanMaster";
		}

		// 로그인 상태로 만들기
		int result = loginService.checkLogin(authInfo.getYaman_id());

		// 내 채팅방 리스트 가져오기
		List<RoomListDto> myChatRoomList = chatSerivce.getMyChatRoomList(authInfo.getYaman_id());

		GetMemberDto getMemberDto;

		for (int i = 0; i < myChatRoomList.size(); i++) {
			getMemberDto = new GetMemberDto();
			getMemberDto.setYaman_id(authInfo.getYaman_id());
			getMemberDto.setRoomname(myChatRoomList.get(i).getRoomname());

			// 내 채팅방 참여자 가져오기
			List<FriendDto> RoomMemberList = chatSerivce.getRoomMember(getMemberDto);

			List<String> memberNameInRoom = new ArrayList<String>();

			if (RoomMemberList.size() == 0) {
				memberNameInRoom.add("참여 인원이 없습니다.");
			} else {
				for (int j = 0; j < RoomMemberList.size(); j++) {
					memberNameInRoom.add(RoomMemberList.get(j).getYname());
				}
			}
			System.out.println(memberNameInRoom.toString());
			myChatRoomList.get(i).setYname(memberNameInRoom);

		}

		model.addAttribute("myChatRoomList", myChatRoomList);

		// yaman_id로 친구 정보 가져오기
		List<YamanDto> myFriendList = friendService.friendList(authInfo.getYaman_id());
		model.addAttribute("myFriendList", myFriendList);

		// yaman_id로 내 정보 가져오기
		YamanDto myInfo = friendService.myInfo(authInfo.getYaman_id());
		model.addAttribute("myInfo", myInfo);

		// 완료된 약속
		List<PromiseDto> listAllpromise = promiseService.listAllpromise(authInfo.getYaman_id());
		model.addAttribute("listAllpromise", listAllpromise);
		System.out.println(promiseService.listAllpromise(authInfo.getYaman_id()));

		// 로그인 세션 생성
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", authInfo);
		session.setMaxInactiveInterval(60 * 60 * 24);

		// 메인페이지로 이동
		return "login/main";
	}

	// 로그아웃 메소드
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(/* @PathVariable("yaman_id") String yaman_id */ HttpServletRequest request) {
		
		// 섹션 가져오기
		HttpSession session = request.getSession();
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("loginUser");

		// 로그인 상태 변경
		int result = loginService.checkLoginOut(authInfo.getYaman_id());

		// 섹션 삭제
		session.removeAttribute("loginUser");

		return "login/index";
	}

}
