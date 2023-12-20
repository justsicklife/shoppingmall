package kr.co.greenart.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.greenart.chat.model.dto.ChatRoomDTO;

@Repository
public class ChatRoomDAO { 

	public ChatRoomDTO chatRoomFindById(SqlSessionTemplate sql, int id) {
		return sql.selectOne("s_chatRoom.findById",id);
	}

	public int chatRoomInsert(SqlSessionTemplate sql, ChatRoomDTO chatRoomDTO) {
		return sql.insert("s_chatRoom.chatRoomInsert" , chatRoomDTO);
	}

	public List<ChatRoomDTO> chatRoomFindAll(SqlSessionTemplate sql) {
		return sql.selectList("s_chatRoom.chatRoomFindAll");
	}

	public int chatRoomSelected(SqlSessionTemplate sql, int id) {
		return sql.update("s_chatRoom.chatRoomSelected",id);
	}

	public int chatRoomSelectedRemove(SqlSessionTemplate sql) {
		return sql.update("s_chatRoom.chatRoomSelectedRemove");
	}

}
