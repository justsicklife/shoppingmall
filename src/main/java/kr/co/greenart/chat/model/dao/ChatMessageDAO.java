package kr.co.greenart.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.greenart.chat.model.dto.ChatMessageDTO;
import kr.co.greenart.chat.model.dto.ChatRoomDTO;

@Repository
public class ChatMessageDAO {

	public static List<ChatMessageDTO> ChatMessageFindById(SqlSessionTemplate sql, int chatRoomId) {
		return sql.selectList("s_chat_message.ChatMessageFindById",chatRoomId);
	}

	public static int ChatMessageInsert(SqlSessionTemplate sql, ChatMessageDTO chatMessageDTO) {
		return sql.insert("s_chat_message.ChatMessageInsert",chatMessageDTO);
	}

}
