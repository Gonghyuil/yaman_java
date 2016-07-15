package com.cherry.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherry.chat.domain.FriendDto;
import com.cherry.chat.domain.GetMemberDto;
import com.cherry.chat.domain.LastSequenceDto;
import com.cherry.chat.domain.MessageDto;
import com.cherry.chat.domain.RoomDto;
import com.cherry.chat.domain.RoomListDto;
import com.cherry.chat.domain.SearchDto;
import com.cherry.chat.service.ChatService;
import com.cherry.chat.service.MessageService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ChatService chatService;

	@Autowired
	private MessageService messageService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	// node.js 에서 요청하는 친구리스트
	@RequestMapping(value = "/ajax/{yaman_one}", method = RequestMethod.GET)
	public void getFriends(@PathVariable("yaman_one") String yaman_one,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		String callback = request.getParameter("callback");

		JSONObject obj = new JSONObject();

		List<FriendDto> myFriendList = chatService.myFriends(yaman_one);
		obj.put("myFriendList", myFriendList);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(callback + "(" + obj.toString() + ")");
		System.out.println(callback + "(" + obj.toString() + ")");
		out.flush();
		out.close();

	}

	// node.js 에서 요청하는 내친구 목록에서 검색
	@RequestMapping(value = "/ajax/{yaman_one}/searchfd/{yname}", method = RequestMethod.GET)
	public void searchByFname(@PathVariable("yaman_one") String yaman_one, @PathVariable("yname") String yname,
			HttpServletRequest request, HttpServletResponse response, SearchDto searchDto) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String callback = request.getParameter("callback");
		
		JSONObject obj = new JSONObject();
		System.out.println(yaman_one);
		System.out.println(yname);
		searchDto.setYaman_one(yaman_one);
		searchDto.setYname(yname);

		List<FriendDto> searchFdList = chatService.searchFd(searchDto);
		obj.put("searchFdList", searchFdList);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(callback + "(" + obj.toString() + ")");
		System.out.println(callback + "(" + obj.toString() + ")");
		out.flush();
		out.close();
	}

	// 메세지 보내고 채팅룸 이름 저장
	@RequestMapping(value = "/chat/insert-roomname/{friend_one}/{friend_two}/{roomname}")
	public void insertRoom(@PathVariable("friend_one") String friend_one, @PathVariable("friend_two") String friend_two,
			@PathVariable("roomname") String roomname, HttpServletResponse response) throws IOException {

		RoomDto roomDto = new RoomDto(friend_one, friend_two, roomname);

		RoomListDto roomListDto = new RoomListDto();
		roomListDto.setYaman_id(friend_one);
		roomListDto.setRoomname(roomname);

		int message_result = chatService.insertRoom(roomDto);

		int roomList_result = chatService.insertMyRoomList(roomListDto);

		LastSequenceDto lastSequence = chatService.getLastInsert();

		System.out.println(lastSequence.getYchatlist_id());

		roomListDto = chatService.getListInsertRoomInfo(lastSequence.getYchatlist_id());
		
		System.out.println(roomListDto.getRoomname());

		GetMemberDto getMemberDto = new GetMemberDto();

		getMemberDto.setYaman_id(friend_one);
		getMemberDto.setRoomname(roomname);

		List<FriendDto> RoomMemberList = chatService.getRoomMember(getMemberDto);

		List<String> memberNameInRoom = new ArrayList<String>();

		if (RoomMemberList.size() == 0) {
			memberNameInRoom.add("참여인원이 없습니다.");
		} else {
			for (int i = 0; i < RoomMemberList.size(); i++) {
				memberNameInRoom.add(RoomMemberList.get(i).getYname());
			}
		}

		roomListDto.setYname(memberNameInRoom);

		JSONObject obj = new JSONObject();

		obj.put("ychatList_id", roomListDto.getYchatlist_id());
		obj.put("yaman_id", roomListDto.getYaman_id());
		obj.put("roomname", roomListDto.getRoomname());
		obj.put("yname", roomListDto.getYname().toString());
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println(obj.toString());
		out.write(obj.toString());
		out.flush();
		out.close();
	}

	// message를 요청받는 함수
	@RequestMapping(value = "/message")
	public void getMessage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");

		String yaman_two = request.getParameter("yaman_two");

		JSONObject obj = new JSONObject();

		List<MessageDto> getMessage = messageService.getMessage(yaman_two);
		obj.put("getMessage", getMessage);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println(obj.toString());
		out.write(obj.toString());
		out.flush();
		out.close();
	}

	// 채팅 거절 함수
	@RequestMapping(value = "/chat/nope/{mid}")
	public void nopeChat(@PathVariable("mid") String mid, HttpServletResponse response) throws IOException {
		int nope = messageService.nopeChat(mid);

		System.out.println(nope);
		JSONObject obj = new JSONObject();

		obj.put("nopeMessage", "채팅 초대를 거절했습니다.");

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println(obj.toString());
		out.write(obj.toString());
		out.flush();
		out.close();
	}

	// 채팅 수락 함수
	@RequestMapping(value = "/chat/yes/{mid}/{yaman_id}")
	public void yesChat(@PathVariable("mid") String mid,@PathVariable("yaman_id") String yaman_id, HttpServletResponse response) throws IOException {
		int yes = messageService.yesChat(mid);

		MessageDto messageDto = messageService.getRoomName(mid);
		
		RoomListDto roomListDto = new RoomListDto();
		roomListDto.setRoomname(messageDto.getRoomname());
		roomListDto.setYaman_id(yaman_id);

		int result = chatService.insertMyRoomList(roomListDto);

		GetMemberDto getMemberDto = new GetMemberDto();
		getMemberDto.setYaman_id(yaman_id);
		getMemberDto.setRoomname(messageDto.getRoomname());

		List<FriendDto> RoomMemberList = chatService.getRoomMember(getMemberDto);

		List<String> memberNameInRoom = new ArrayList<String>();

		if (RoomMemberList.size() == 0) {
			memberNameInRoom.add("참여인원이 없습니다.");
		} else {
			for (int i = 0; i < RoomMemberList.size(); i++) {
				memberNameInRoom.add(RoomMemberList.get(i).getYname());
			}
		}

		System.out.println(yes);
		JSONObject obj = new JSONObject();

		obj.put("yesMessage", "채팅 초대를 수락했습니다.");
		obj.put("roomname", messageDto.getRoomname());
		obj.put("yname", memberNameInRoom.toString());

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println(obj.toString());
		out.write(obj.toString());
		out.flush();
		out.close();
	}

	// 채팅 초대메세지 보내기
	@RequestMapping(value = "/ajax/invite/{roomname}/{friend_one}/{friend_two}", method = RequestMethod.GET)
	public void invite_friend(@PathVariable("friend_one") String friend_one,
			@PathVariable("friend_two") String friend_two, @PathVariable("roomname") String roomname,
			HttpServletRequest request, HttpServletResponse response, SearchDto searchDto) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String callback = request.getParameter("callback");

		JSONObject obj = new JSONObject();
		System.out.println(friend_one);
		System.out.println(friend_two);
		System.out.println(roomname);

		String[] friends = friend_two.split(",");
		RoomDto roomDto;

		for (int i = 1; i < friends.length; i++) {
			roomDto = new RoomDto();

			roomDto.setFriend_one(friend_one);
			roomDto.setFriend_two(friends[i]);
			roomDto.setRoomname(roomname);

			int result = chatService.insertRoom(roomDto);
		}

		obj.put("invite_msg", "초대 메세지를 전송했습니다.");

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(callback + "(" + obj.toString() + ")");
		System.out.println(callback + "(" + obj.toString() + ")");
		out.flush();
		out.close();
	}

	// 방 삭제
	@RequestMapping(value = "/deleteRoom/{ychatlist_id}")
	public void deleteRoom(@PathVariable("ychatlist_id") String ychatlist_id, HttpServletResponse response)
			throws IOException {

		chatService.deleteMyChatRoom(ychatlist_id);

		JSONObject obj = new JSONObject();
		obj.put("deleteMessage", "채팅방이 삭제되었습니다.");

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(obj.toString());
		out.flush();
		out.close();
	}

}
