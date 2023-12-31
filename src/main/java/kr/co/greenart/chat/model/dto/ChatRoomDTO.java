package kr.co.greenart.chat.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChatRoomDTO {
	private int chatRoomId;
	private int memberIdx;
	private int chatRoomAlertCount;
	private int chatRoomSelected;
	private String chatRoomMessage;
	
	private String memberName;
	private String memberId;
}
