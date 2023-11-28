package kr.co.greenart.chat.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {

	private final SimpMessagingTemplate template; // 특정 Broker 로 메시지 전달
	
//	private final MemberServiceImpl memberServiceImpl;
	
	
	@MessageMapping(value="/chat/enter")
	public void enter() {
		//채널에 구독하고 있는 사용자들 중 모두에게가 아닌 특정한 사용자에게 메세지를 보낼 수 있도록 해주는 메소드
		template.convertAndSend("/sub/chat/room","입장하셨습니다.");
	}
	
	@MessageMapping(value="/chat/message")
	public void message() {
		template.convertAndSend("/sub/chat/room","메세지 보냄");
	}
}
