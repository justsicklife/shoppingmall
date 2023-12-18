package kr.co.greenart.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println(session.getAttribute("memberIdx"));
		int id =  (Integer)session.getAttribute("memberIdx");

		model.addAttribute("memberId",id);
		
		return "/chat/chat_user";
	}
	
	@GetMapping("/admin")
	public String admin(Model model,HttpSession session) {
		
		List<ChatRoomDTO> listChatRoomDTO = chatRoomService.chatRoomFindAll();
		
		// memberId 
		int id =  (Integer)session.getAttribute("memberIdx");
				
		model.addAttribute("chatRoomList",listChatRoomDTO);
		
		model.addAttribute("memberId",id);
		
		return "/chat/chat_admin";
	}
	
	@PostMapping("/find")
	@ResponseBody
	public ChatRoomDTO find(ChatRoomDTO chatRoomDTO) {
		
		System.out.println("chatROOMDTO : " + chatRoomDTO);
		ChatRoomDTO findChatRoomDTO = chatRoomService.chatRoomFindById(chatRoomDTO.getMemberId());
		
		if(findChatRoomDTO == null) {
			return new ChatRoomDTO(-1,-1,null,0);
		} else {
			return findChatRoomDTO;			
		}
		
	}
	
	
	@PostMapping("/create")
	@ResponseBody
	public ChatRoomDTO create(ChatRoomDTO chatRoomDTO) {
		System.out.println("chatRoomDTO : " + chatRoomDTO);
		int success = chatRoomService.chatRoomInsert(chatRoomDTO);
		System.out.println("success : " + success);
		
		
		ChatRoomDTO findChatRoomDTO = new ChatRoomDTO(chatRoomDTO.getChatRoomId(),chatRoomDTO.getMemberId(),chatRoomDTO.getChatRoomTitle(),0);
		
		System.out.println("create :" +findChatRoomDTO);
		return findChatRoomDTO;
	}
}
