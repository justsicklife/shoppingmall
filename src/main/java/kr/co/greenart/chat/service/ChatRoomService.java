package kr.co.greenart.chat.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import kr.co.greenart.chat.model.dao.ChatRoomDAO;
import kr.co.greenart.chat.model.dto.ChatRoomDTO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatRoomService {

	private final SqlSessionTemplate sql;
	
	private final ChatRoomDAO chatRoomDAO;
	
	public ChatRoomDTO chatRoomFindById(int id) {
		return chatRoomDAO.chatRoomFindById(sql,id);
	}
	
	public int chatRoomInsert(ChatRoomDTO chatRoomDTO) {
		return chatRoomDAO.chatRoomInsert(sql,chatRoomDTO);
	}

	public List<ChatRoomDTO> chatRoomFindAll() {
		return chatRoomDAO.chatRoomFindAll(sql);
	}
	
}