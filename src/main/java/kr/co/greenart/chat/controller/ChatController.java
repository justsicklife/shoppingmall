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
				
		// 만약 채팅방 아이디가 멤버 아이디 라면
		// 채팅방 메세지를 찾을때 멤버 아이디만 가져다가 되면
		// 채팅메세지가 딸려올것이다 그렇다면 
		
		// 일단 채팅방이 있는지 없는지 확인 
//		chatRoomService.chatRoomFindById(id);
		int id =1;

		// chatRoomService.chatRoomFindById(id) 값이 있다면 orElseGet 을 실행안함
		// 없다면 실행함
		
		ChatRoomDTO chatRoomDTO = new ChatRoomDTO(0,id);
		
		
		ChatRoomDTO findChatRoomDTO = chatRoomService.chatRoomFindById(id);
		if(findChatRoomDTO == null) {
			int success = chatRoomService.chatRoomInsert(chatRoomDTO);
			findChatRoomDTO = new ChatRoomDTO(chatRoomDTO.getMemberId(),id);
		} else {
			List<ChatMessageDTO> chatMessageDTO = chatMessageService.ChatMessageFindById(findChatRoomDTO.getChatRoomId());
			System.out.println("가져온 데이터 : " + chatMessageDTO);
			model.addAttribute("chatMessageList",chatMessageDTO);
		}
		
//		System.out.println(findChatRoomDTO);
		
		model.addAttribute("chatRoomId",findChatRoomDTO.getChatRoomId());
		model.addAttribute("memberId",findChatRoomDTO.getMemberId());
		
		return "/chat/chat_user";
	}
	
	@GetMapping("/admin")
	public String admin(Model model,HttpSession session) {
		
		List<ChatRoomDTO> listChatRoomDTO = chatRoomService.chatRoomFindAll();
		
		int id = 10;
		
		model.addAttribute("chatRoomList",listChatRoomDTO);
		
		model.addAttribute("memberId",id);
		
		return "/chat/chat_admin";
	}
}
