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
	
	//id찾기
	public String findId(SqlSessionTemplate sqlSession, MemberDto memberdto) {
//		MemberDto memberdto = new MemberDto();
//		
//		memberdto.setMemberName(memberName);
//		memberdto.setMemberEmail(memberEmail);
		return sqlSession.selectOne("memberMapper.findId",memberdto);
	}
	
	//pw찾기(사용 안함) 
	public String findPw(SqlSessionTemplate sqlSession, MemberDto memberdto) {
		return sqlSession.selectOne("memberMapper.findPw", memberdto);
	}
	
	//pw찾기(회원번호 가져오기)
	public String findIdx(SqlSessionTemplate sqlSession, MemberDto memberdto) {
		return sqlSession.selectOne("memberMapper.findIdx", memberdto);
	}
	
	//pw변경
	public int changePw(SqlSessionTemplate sqlSession, MemberDto memberdto) {
		return sqlSession.update("memberMapper.changePw", memberdto);
	}
}
