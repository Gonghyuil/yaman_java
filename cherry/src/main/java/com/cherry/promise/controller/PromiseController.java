package com.cherry.promise.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherry.login.domain.AuthInfo;
import com.cherry.photo.service.PhotoService;
import com.cherry.promise.domain.GetMyPromiseDto;
import com.cherry.promise.domain.MessageDto2;
import com.cherry.promise.domain.PromiseDto;
import com.cherry.promise.service.PromiseService;
import com.cherry.yjoin.domain.YjoinDto;
import com.cherry.yjoin.service.YjoinService;

@Controller
public class PromiseController {
	
	@Autowired
	private PromiseService promiseService;

	private static final Logger logger = LoggerFactory.getLogger(PromiseController.class);
		
	// 약속 상세
	@RequestMapping(value = "/ypromise_id/{ypromise_id}", method = RequestMethod.GET)
	public String promiseListById(@PathVariable("ypromise_id") String ypromise_id, Model model) {
		// logger.info("display view Promise list by ypromise_id ",
		// ypromise_id);
		logger.info("display view Promise list by ypromise_id : " + ypromise_id);
		PromiseDto promisebyid = promiseService.selectOne(ypromise_id);
		logger.info("/ypromise_id/{ypromise_id} : 약속장소 : " + promisebyid.getYproloc());
		model.addAttribute("promiselistbyid", promisebyid);
		return "promise/list";
	}

	// 약속 상세
	@RequestMapping(value = "/ypromise/{ypromise_id}", method = RequestMethod.GET)
	public void promiseById(@PathVariable("ypromise_id") String ypromise_id, HttpServletResponse response)
			throws IOException {
		PromiseDto promiseById = promiseService.selectOne(ypromise_id);
		logger.info("/ypromise_id/{ypromise_id} : 약속장소 : " + promiseById.getYproloc());
		JSONObject jobject = new JSONObject(promiseById);
		// jobject.put("promiseById", promiseById);
		System.out.println("JSON결과는요 : " + jobject.toString());
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jobject);
		out.flush();
		out.close();
	}

	
	// 약속 날짜에 대한 약속상세리스트
	@RequestMapping(value = "/yprodate/{yprodate}", method = RequestMethod.GET)
	public void selectList(@PathVariable("yprodate") String yprodate, HttpServletResponse response,
			HttpServletRequest request) throws IOException {

		logger.info("display view Promise list by yprodate : " + yprodate);

		HttpSession session = request.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("loginUser");

		GetMyPromiseDto getMyPromiseDto = new GetMyPromiseDto(authInfo.getYaman_id(), yprodate);

		List<PromiseDto> promiseListByDate = promiseService.selectList(getMyPromiseDto);
		// System.out.println("쿼리 결과값 : " + promiseListByDate.toString());

		JSONObject jobject = new JSONObject();

		jobject.put("promiseListByDate", promiseListByDate);

		System.out.println("json 결과 값 : " + jobject.toString());

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jobject);
		out.flush();
		out.close();

	}

	// 약속 수정하기
	@RequestMapping(value = "/update_promise", method = RequestMethod.POST)
	public @ResponseBody PromiseDto updatePromise(@RequestBody PromiseDto promiseDto) {
		logger.info("update a promise : " + promiseDto);
		promiseService.updatePromise(promiseDto);
		logger.info("promiseDto after updating : " + promiseDto);
		return promiseDto;
	}

	// 약속 추가하기
	@Autowired
	private YjoinService yjoinService;
	private YjoinDto yjoinDto;

	@RequestMapping(value = "/write/", method = RequestMethod.POST)
	public @ResponseBody PromiseDto writePromise(HttpServletRequest request,
			@RequestBody PromiseDto promiseDto) {
		// logger.info("uprodate value {} ", yprodate);
		logger.info("write new Promise : " + promiseDto);
		promiseService.insertPromise(promiseDto);

		HttpSession session = request.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("loginUser");
		yjoinDto = new YjoinDto(promiseDto.getYpromise_id(), authInfo.getYaman_id());
		yjoinService.insert(yjoinDto);
		return promiseDto;
	}

	// 약속 삭제하기
	@RequestMapping(value = "/deletePromise/{ypromise_id}", method = RequestMethod.GET)
	public void deletePromise(@PathVariable("ypromise_id") String ypromise_id, Model model,
			HttpServletResponse response) throws IOException {
		promiseService.deletePromise(ypromise_id);
		logger.info("promise_id " + ypromise_id + "delete");
	}

	// 약속 중복 체크하기(일자 & 시간)
	@RequestMapping(value = "/checkPromise/{yprodate}/{yprostart}", method = RequestMethod.GET)
	public @ResponseBody List<PromiseDto> checkPromise(@PathVariable("yprodate") String yprodate,
			@PathVariable("yprostart") String yprostart, Model model) {
		logger.info("yprodate " + yprodate + " yprostart " + yprostart);
		PromiseDto promiseDto = new PromiseDto(yprodate, yprostart);
		List<PromiseDto> promiselist = promiseService.checkPromise(promiseDto);
		logger.info("약속 중복 체크 리스트 : " + promiselist.toString());
		model.addAttribute("promiselist", promiselist);
		return promiselist;
	}

	// 약속 리스트 엑셀다운로드하기
	@RequestMapping(value = "/excelDownload")
	public String excelDownload(Map<String, Object> ModelMap, HttpServletRequest request) throws Exception {
		System.out.println("------------FileDownloadController.excelDownload()------------");

		HttpSession session = request.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("loginUser");

		List<PromiseDto> list = promiseService.listAll(authInfo.getYaman_id());
		ModelMap.put("promiselist", list);

		return "excelDownload";
	}

	// 약속 지도 가져오기
	@RequestMapping(value = "/promiseMapInfoDetail/{ypromise_id}", method = RequestMethod.POST)
	public @ResponseBody PromiseDto promiseMapInfoDetail(@PathVariable("ypromise_id") String ypromise_id) {
		PromiseDto promiseDto = new PromiseDto();
		promiseDto.setYpromise_id(ypromise_id);
		return promiseService.selectPromiseMap(promiseDto);
	}

	@Autowired
	private PhotoService photoservice;
	// 완료된 약속

	@RequestMapping(value = "/endpromise", method = RequestMethod.GET)
	public String endPromise(Model model) {
		String yaman_id = "1";
		List<PromiseDto> listAllpromise = promiseService.listAllpromise(yaman_id);
		model.addAttribute("listAllpromise", listAllpromise);
		System.out.println(promiseService.listAllpromise(yaman_id));

		/*
		 * PhotoDto photo = new PhotoDto(); List<PhotoDto> photoMyList =
		 * photoservice.AllMyList(photo); model.addAttribute("photoMyList",
		 * photoMyList);
		 */

		return "promise/endPromise";
	}

	@RequestMapping(value = "/prosub")
	public void proajax(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String callback = request.getParameter("callback");

		String yproname = request.getParameter("yproname");
		String yprodate = request.getParameter("yprodate");
		String yprostart = request.getParameter("yprostart");
		String yproloc = request.getParameter("yproloc");
		String yprolocx = request.getParameter("yprolocx");
		String yprolocy = request.getParameter("yprolocy");
		String roomname = request.getParameter("roomname");
		String yaman_id = request.getParameter("yaman_id");

		System.out.println(yprolocx);

		PromiseDto ypromiseDto = new PromiseDto();
		ypromiseDto.setYproname(yproname);
		ypromiseDto.setYprodate(yprodate);
		ypromiseDto.setYprostart(yprostart);
		ypromiseDto.setYproloc(yprolocy);
		ypromiseDto.setYprolocx(yprolocx);
		ypromiseDto.setYprolocy(yprolocy);

		System.out.println("약속 저장 값" + ypromiseDto);
		int check = promiseService.yproinsert(ypromiseDto);

		System.out.println("중간결과" + check);

		System.out.println(ypromiseDto + "약속을 저장후");
		for (MessageDto2 messageDto2 : promiseService.selectfriendId(roomname)) {
			messageDto2.setYpromise_id(ypromiseDto.getYpromise_id());
			promiseService.insertYjoin(messageDto2);
		}

		JSONObject obj = new JSONObject();

		// DTO 생성해서 받아온값 저장하고 json오브젝트에 넣어주기

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(callback + "(" + obj.toString() + ")");
		System.out.println(callback + "(" + obj.toString() + ")");
		out.flush();
		out.close();
	}

	@RequestMapping(value = "/earlyProm/{yaman_id}")
	public void pastPromise(@PathVariable("yaman_id") String yaman_id, HttpServletResponse response)
			throws IOException {
		// 약속 탭 -> 빠른일정
		List<PromiseDto> promiselist = promiseService.listAll(yaman_id);

		JSONObject obj = new JSONObject();

		obj.put("promiselist", promiselist);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(obj.toString());
		out.flush();
		out.close();
	}

}
