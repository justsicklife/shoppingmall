package kr.co.greenart.member.model.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import kr.co.greenart.member.model.dao.MemberDao;
import kr.co.greenart.member.model.dto.MemberDto;

public interface MemberService {
	
	
	//로그인
	MemberDto loginMember(MemberDto m);
	
	//sns(이메일)로그인
	MemberDto snsLoginMember(MemberDto m);
	
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
	
	
	//마이페이지 보기
	MemberDto myPage(int memberIdx);
	
	//마이페이지 업데이트
	int updateMyPage(MemberDto memberdto);
	
	
	
	//이메일 인증
	public void memberAuth(String memberEmail, String key) throws Exception;
	
	//이메일 발송
	public void sendMail(MemberDto memberdto) throws Exception;
	
	
	
	//sns 로그인, 가입
	int snsSingup(MemberDto memberdto);
	
	
	//카카오 로그인
	String getAccessTokenKakao(String authorize_code) throws Throwable;
	
	public HashMap<String, Object> getUserInfoKakao(String access_Token) throws Throwable;
	
	//네이버 로그인
	String getAccessTokenNaver(String authorize_code) throws Throwable;
	
	public HashMap<String, Object> getUserInfoNaver(String access_Token) throws Throwable;
	
	
	//회원 탈퇴
	int memberDelete(MemberDto bo);
	
	//회원 탈퇴 ( 이메일 인증 삭제 )
	int memberAuthDelete(MemberDto bo);
	
}
