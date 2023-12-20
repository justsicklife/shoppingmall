package kr.co.greenart.chat.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ChatMessageDTO {
	private int chatMessageId;
	private int memberIdx;
	private int chatRoomId;
	private String chatMessageContent;
	private String chatMessageDate;
}
