package kr.co.greenart.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.greenart.chat.service.ChatRoomService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {
	
	private final ChatRoomService chatRoomService;
	
	@GetMapping("/user/{userId}")
	public String room(Model model,HttpSession session,@PathVariable("userId") int id) {
		
		// 일단 채팅방이 있는지 없는지 확인 
//		chatRoomService.chatRoomFindById();
		// 있다면 채팅 기록 가져오기
		// 없다면 채팅방 새로 만들기
		
		return "/chat/chat_user";
	}
	
	@GetMapping("/admin")
	public String admin(Model model,HttpSession session) {
		
		return "/chat/chat_admin";
	}
}
