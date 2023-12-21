package kr.co.greenart.chat.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import kr.co.greenart.chat.model.dao.ChatMessageDAO;
import kr.co.greenart.chat.model.dto.ChatMessageDTO;
import kr.co.greenart.chat.model.dto.ChatRoomDTO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatMessageService {
	
	private final SqlSessionTemplate sql;
		
	private final ChatMessageDAO chatMessageDAO;
		
	public List<ChatMessageDTO> ChatMessageFindById(int chatRoomId) {
		return ChatMessageDAO.ChatMessageFindById(sql,chatRoomId);
	}
	
	public int ChatMessageInsert(ChatMessageDTO chatMessageDTO) {
		return ChatMessageDAO.ChatMessageInsert(sql,chatMessageDTO);
	}

}
