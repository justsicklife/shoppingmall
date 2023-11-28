package kr.co.greenart.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.greenart.member.model.dto.MemberDto;
import lombok.NoArgsConstructor;

@Repository
public class MemberDao {
	
	
	//로그인
	// selectOne : 하나만가져옴
	public MemberDto loginMember(SqlSessionTemplate sqlSession, MemberDto m) {
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}
	
	//이메일 확인
	// selectOne : 하나만가져옴
	public int checkEmail(SqlSessionTemplate sqlSession, String memberEmail) {
		return sqlSession.selectOne("memberMapper.checkEmail", memberEmail);
	}
	
	//아이디 확인
	// selectOne : 하나만가져옴
	public int checkId(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.checkId", memberId);
	}
	
	//회원 가입
	//insert : 데이터 전송
	public int signupMember(SqlSessionTemplate sqlSession, MemberDto memberdto) {
		return sqlSession.insert("memberMapper.signupMember", memberdto);
	}
}
