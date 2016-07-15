package com.cherry.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherry.board.domain.BoardDto;
import com.cherry.board.domain.EmailAnswerDto;
import com.cherry.board.service.BoardMailService;
import com.cherry.board.service.BoardService;
import com.cherry.login.domain.MasterDto;
import com.cherry.login.domain.YamanCount;
import com.cherry.login.repository.MasterDao;
import com.cherry.login.service.LoginService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private MasterDao masterDao;
	@Autowired
	private LoginService loginService;
	@Autowired
	private BoardMailService boardMailService;

	// 리스트
	@RequestMapping(value = "/board")
	public String home(HttpServletRequest request, HttpServletResponse response, Model model) {

		List<BoardDto> boardList = boardService.selectList();

		model.addAttribute("boardList", boardList);

		return "/Board/board";
	}

	// 상세보기
	@RequestMapping(value = "/boardView/{yboard_id}")
	public String Detail(@PathVariable("yboard_id") String yboard_id, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		BoardDto SelectOne = boardService.selectOne(yboard_id);
		model.addAttribute("SelectOne", SelectOne);
		System.out.println(SelectOne);
		System.out.println("viewBoard: " + yboard_id);

		return "/Board/boardView";
	}

	// 답변 업데이트 && 메일 보내기
	@RequestMapping(value = "/email", method = RequestMethod.POST)
	public String sendMail(HttpServletResponse response, HttpServletRequest request, Model model) throws IOException {

		request.setCharacterEncoding("UTF-8");
		// 답변 내용 저장
		String yboard_id = request.getParameter("yboard_id");
		String answer_title = request.getParameter("answer_title");
		String answer = request.getParameter("answer");
		String answer_yaman_id = request.getParameter("answer_yaman_id");
		String yemail = request.getParameter("yemail");

		EmailAnswerDto emailAnswerDto = new EmailAnswerDto();

		emailAnswerDto.setYboard_id(yboard_id);
		emailAnswerDto.setAnswer(answer);
		emailAnswerDto.setAnswer_yaman_id(answer_yaman_id);
		emailAnswerDto.setAnswer_title(answer_title);
		System.out.println(emailAnswerDto);
		boardService.EmailSave(emailAnswerDto);

		// 받는 사람 이메일 바꿔줄것
		String result = boardMailService.sendMail(answer_yaman_id, yemail, answer_title, answer);

		// 상세보기로 돌아가기
		BoardDto SelectOne = boardService.selectOne(yboard_id);
		model.addAttribute("SelectOne", SelectOne);
		System.out.println("viewBoard: " + yboard_id);

		return "/Board/boardView";

	}

	// 글쓰기완료
	@RequestMapping(value = "/board_write")
	public void writeComplet(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		request.setCharacterEncoding("UTF-8");

		String ysubject = request.getParameter("ysubject");
		String ycontent = request.getParameter("ycontent");
		String yaman_id = request.getParameter("yaman_id");

		System.out.println("받은 값 " + ysubject + ycontent + yaman_id);
		BoardDto boardDto = new BoardDto();

		boardDto.setYaman_id(yaman_id);
		boardDto.setYcontent(ycontent);
		boardDto.setYsubject(ysubject);

		int result = boardService.insert(boardDto);

		System.out.println("불만사항 접수 결과 : " + result);

		JSONObject obj = new JSONObject();
		obj.put("boardMessage", "접수되었습니다. 빠른시간 내에 메일로 답변드리겠습니다.");

		response.setContentType("text/html;charset=UTF-8"); // 한글처리
		PrintWriter out = response.getWriter();
		out.write(obj.toString());
		out.flush();
		out.close();

	}

	// 상세보기중 리스트보기
	@RequestMapping(value = "/viewBack")
	public String ViewBack(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "redirect:/board";
	}


	// 상세보기 중 글삭제
	@RequestMapping(value = "/yboardDel")
	public String yboardDel(HttpServletRequest request, HttpServletResponse response, Model model)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");

		String yboard_id = request.getParameter("yboard_id");
		boardService.yboard_del(yboard_id);

		System.out.println("deleteYboard: " + yboard_id);

		return "redirect:/board";

	}

	// 관리자페이지로 전환
	@RequestMapping(value = "/Master")
	public String Go_MasterPage(Model model) {
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

	// 회원리스트 엑셀 다운로드
	@RequestMapping(value = "/excelDownload_member")
	public String memberExcelDownload(Map<String, Object> ModelMap) throws Exception {
		System.out.println("------------FileDownloadController.excelDownload()------------");

		List<MasterDto> list = masterDao.listAll();
		ModelMap.put("yamanList", list);

		return "MemberExcelDownload";
	}

}
