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
	private int memberId;
	private String chatRoomTitle;
	private int chatRoomAlertCount;
}
