package kr.co.greenart.chat.controller;

import java.util.List;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import kr.co.greenart.chat.model.dto.ChatMessageDTO;
import kr.co.greenart.chat.model.dto.ChatRoomDTO;
import kr.co.greenart.chat.service.ChatMessageService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {

	private final SimpMessagingTemplate template; // 특정 Broker 로 메시지 전달
	
	private final ChatMessageService chatMessageService;
	
	
	@MessageMapping(value="/chat/enter")
	public void enter(ChatMessageDTO message) {
		//채널에 구독하고 있는 사용자들 중 모두에게가 아닌 특정한 사용자에게 메세지를 보낼 수 있도록 해주는 메소드
//		System.out.println("enter : " + message);
//		int ok = chatMessageService.ChatMessageInsert(message);
		template.convertAndSend("/sub/chat/room/" + message.getChatRoomId(),message);
	}
	
	@MessageMapping(value="/chat/message")
	public void message(ChatMessageDTO message) {
		System.out.println("message : " + message);
		int ok = chatMessageService.ChatMessageInsert(message);

		template.convertAndSend("/sub/chat/room/" + message.getChatRoomId() ,message);
	}
	
	@MessageMapping(value="/chat/history")
	public void history(ChatRoomDTO chatRoomDTO) {
		System.out.println("ChatRoomDTO : " + chatRoomDTO);
		
		List<ChatMessageDTO> chatMessageDTO = chatMessageService.ChatMessageFindById(chatRoomDTO.getChatRoomId());
		System.out.println("chatMessage : " + chatMessageDTO);
		template.convertAndSend("/sub/chat/history/" + chatRoomDTO.getChatRoomId() ,chatMessageDTO);
	}
}


