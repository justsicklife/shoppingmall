package kr.co.greenart.member.model.dto;

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
}
