package kr.co.greenart.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.greenart.member.model.dao.MemberDao;
import kr.co.greenart.member.model.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;

	
	
	//로그인
	@Override
	public MemberDto loginMember(MemberDto m) {
		return memberDao.loginMember(sqlSession, m);
	}
	
	//아이디 확인
	@Override
	public int checkId(String id) {
		return memberDao.checkId(sqlSession, id);
	}
	
	//이메일 확인
	@Override
	public int checkEmail(String email) {
		return memberDao.checkEmail(sqlSession, email);
	}

	//회원 가입
	@Override
	public int signupMember(MemberDto memberDto) {
		return memberDao.signupMember(sqlSession, memberDto);
	}
	
	
}
