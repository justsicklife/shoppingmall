package kr.co.greenart.chat.controller;

import java.util.List;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import kr.co.greenart.chat.model.dto.ChatMessageDTO;
import kr.co.greenart.chat.model.dto.ChatRoomDTO;
import kr.co.greenart.chat.service.ChatMessageService;
import kr.co.greenart.chat.service.ChatRoomService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {

	private final SimpMessagingTemplate template; // 특정 Broker 로 메시지 전달
	
	private final ChatMessageService chatMessageService;
	
	private final ChatRoomService chatRoomService;

	// 방에 들어왔을때
	@MessageMapping(value="/chat/enter")
	public void enter(ChatMessageDTO message) {
		template.convertAndSend("/sub/chat/room/" + message.getChatRoomId(),message);
	}
	
	// 메세지를 입력했을때
	@MessageMapping(value="/chat/message")
	public void message(ChatMessageDTO message) {
//		System.out.println("message : " + message);
		int ok = chatMessageService.ChatMessageInsert(message);

		template.convertAndSend("/sub/chat/room/" + message.getChatRoomId() ,message);
	}

	// 메세지 내역을 가져올때
	@MessageMapping(value="/user/history")
	public void userHistory(ChatRoomDTO chatRoomDTO) {
		System.out.println("ChatRoomDTO : " + chatRoomDTO);
		
		List<ChatMessageDTO> chatMessageDTO = chatMessageService.ChatMessageFindById(chatRoomDTO.getChatRoomId());
//		System.out.println("chatMessage : " + chatMessageDTO);
		template.convertAndSend("/sub/user/history/" + chatRoomDTO.getChatRoomId() ,chatMessageDTO);
	}
	
	// 메세지 내역을 가져올때
		@MessageMapping(value="/admin/history")
		public void adminHistory(ChatRoomDTO chatRoomDTO) {
			System.out.println("ChatRoomDTO : " + chatRoomDTO);
			
			List<ChatMessageDTO> chatMessageDTO = chatMessageService.ChatMessageFindById(chatRoomDTO.getChatRoomId());
//			System.out.println("chatMessage : " + chatMessageDTO);
			template.convertAndSend("/sub/admin/history/" + chatRoomDTO.getChatRoomId() ,chatMessageDTO);
		}
	
	// 채팅방 목록을 가져올때
	@MessageMapping(value="/chat/list")
	public void list() {
		List<ChatRoomDTO> listChatRoomDTO = chatRoomService.chatRoomFindAll();
		System.out.println("list : " + listChatRoomDTO);
		template.convertAndSend("/sub/chat/list",listChatRoomDTO);
	}
	
	// 현재 방에 있는지 없는지
	@MessageMapping(value="/room/find")
	public void find(ChatRoomDTO chatRoomDTO) {
		System.out.println("chatROOMDTO : " + chatRoomDTO);
		ChatRoomDTO findChatRoomDTO = chatRoomService.chatRoomFindById(chatRoomDTO.getMemberId());
		
//		System.out.println("findChatRoomDTO : " + findChatRoomDTO);
		
		// 방이없다면 
		if(findChatRoomDTO == null) {
			template.convertAndSend("/sub/room/find",new ChatRoomDTO(-1,-1));				
		} else {
			template.convertAndSend("/sub/room/find",findChatRoomDTO);			
		}
		
	}
	
	@MessageMapping(value="/room/create")
	public void create(ChatRoomDTO chatRoomDTO) {
		int success = chatRoomService.chatRoomInsert(chatRoomDTO);
		System.out.println("success : " + success);
		ChatRoomDTO findChatRoomDTO = new ChatRoomDTO(chatRoomDTO.getChatRoomId(),chatRoomDTO.getMemberId());
		System.out.println("create :" +findChatRoomDTO);
		template.convertAndSend("/sub/room/create",findChatRoomDTO);
	}
	
	@MessageMapping(value="/chat/alarm")
	public void alarm(ChatRoomDTO chatRoomDTO) {
		template.convertAndSend("/sub/chat/alarm",chatRoomDTO);
	}
}


