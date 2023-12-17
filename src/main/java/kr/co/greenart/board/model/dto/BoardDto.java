package kr.co.greenart.board.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor // 파라미터가 없는 디폴트 생성자를 생성
@AllArgsConstructor // 모든 필드 값을 파라미터로 받는 생성자를 생성
@ToString // toString() 메소드를 자동으로 생성
public class BoardDto {
	
	private int boardQuestionNum;
	private int boardAnswerNum;
	private int boardProductNum;
	private int boardMemberIdx;
	private String boardMemberId;
	private String boardCategory;
	private int boardSecret;
	private String boardTitle;
	private String boardContent;
	private String boardIndate;
	private int boardAnswer_Y;
}
