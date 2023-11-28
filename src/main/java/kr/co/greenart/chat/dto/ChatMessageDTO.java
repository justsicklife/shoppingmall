package kr.co.greenart.chat.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ChatMessageDTO {
	private int chatMessageId;
	private int memberId;
	private String chatMessageContent;
	private Date chatMessageDate;
}
