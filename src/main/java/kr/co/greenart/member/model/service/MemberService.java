package kr.co.greenart.member.model.service;

import javax.servlet.http.HttpServletResponse;

import kr.co.greenart.member.model.dao.MemberDao;
import kr.co.greenart.member.model.dto.MemberDto;

public interface MemberService {
	
	
	//로그인
	MemberDto loginMember(MemberDto m);
	
	//아이디 체크
	int checkId(String id);
	
	//이메일 체크
	int checkEmail(String email);
	
	//회원 가입
	int signupMember(MemberDto memberDto);
	
	//id찾기
	String findId(MemberDto memberdto);
	
	//pw찾기(사용 안함)
	String findPw(MemberDto memberdto);
	
	//pw찾기(회원번호 가져오기)
	String findIdx(MemberDto memberdto);
	
	//pw변경
	int changePw(MemberDto memberdto);
	
	//이메일 인증
	public void memberAuth(String memberEmail, String key) throws Exception;
	
	//이메일 발송
	public void sendMail(MemberDto memberdto) throws Exception;
}
