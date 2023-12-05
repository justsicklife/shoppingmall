package kr.co.greenart.chat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.greenart.chat.model.dto.ChatMessageDTO;
import kr.co.greenart.chat.model.dto.ChatRoomDTO;
import kr.co.greenart.chat.service.ChatMessageService;
import kr.co.greenart.chat.service.ChatRoomService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {
	
	private final ChatRoomService chatRoomService;
	
	private final ChatMessageService chatMessageService;
	
	@GetMapping("/user")
	public String room(Model model,HttpSession session) {

		// memberId
		int id = 15;
		
//		ChatRoomDTO chatRoomDTO = new ChatRoomDTO(0,id);
//		
//		// 멤버 아이디로 채팅방 찾기
//		ChatRoomDTO findChatRoomDTO = chatRoomService.chatRoomFindById(id);
//		
//		// 채팅방이 없다면
//		if(findChatRoomDTO == null) {
//			// 새로 생성
//			int success = chatRoomService.chatRoomInsert(chatRoomDTO);
//			
//			findChatRoomDTO = new ChatRoomDTO(chatRoomDTO.getMemberId(),id);
//		}
		
//		model.addAttribute("chatRoomId",findChatRoomDTO.getChatRoomId());
		model.addAttribute("memberId",id);
		
		return "/chat/chat_user";
	}
	
	@GetMapping("/admin")
	public String admin(Model model,HttpSession session) {
		
		List<ChatRoomDTO> listChatRoomDTO = chatRoomService.chatRoomFindAll();
		
		// memberId 
		int id = 10;
		
		model.addAttribute("chatRoomList",listChatRoomDTO);
		
		model.addAttribute("memberId",id);
		
		return "/chat/chat_admin";
	}
}
