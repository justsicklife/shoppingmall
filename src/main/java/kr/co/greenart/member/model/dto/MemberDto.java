package kr.co.greenart.member.model.dto;

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
public class MemberDto {

	private int memberIdx;
	private String memberName;
	private String emailPrefix;
	private String emailSuffix;
	private String memberEmail;
	private String memberId;
	private String memberPassword;
	private String memberPasswordChk;
	private int memberAdrrNum;
	private String memberAdrrFirst;
	private String memberAdrrSecond;
	private String memberphoneNum;
	private String memberGender;
	private String memberBirthday;
	private String memberJoinDate;
	private String memberRemoveDate;
	
	private int memberAuth; //이메인 인증시 1, 미인증 0
}
