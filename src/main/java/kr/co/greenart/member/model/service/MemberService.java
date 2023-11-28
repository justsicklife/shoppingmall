package kr.co.greenart.member.model.service;

import kr.co.greenart.member.model.dao.MemberDao;
import kr.co.greenart.member.model.dto.MemberDto;

public interface MemberService {

	MemberDto loginMember(MemberDto m);
	
	//아이디 체크
	int checkId(String id);
	
	//이메일 체크
	int checkEmail(String email);
	
	//회원 가입
	int signupMember(MemberDto memberDto);
	
}
