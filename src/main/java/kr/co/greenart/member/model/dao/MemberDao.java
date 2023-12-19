package kr.co.greenart.member.model.dao;

import java.util.HashMap;
import java.util.Map;

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
	
	//sns(이메일) 로그인
	public MemberDto snsLoginMember(SqlSessionTemplate sqlSession, MemberDto m ) {
		return sqlSession.selectOne("memberMapper.snsLoginMember",m);
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
	
	
	//이메일 인증
	public void createAuthKey(SqlSessionTemplate sqlsession, String memberEmail,String authKey){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("authKey", authKey);
		
		sqlsession.selectOne("memberMapper.createAuthKey", map);
		
	}
	
	//이메일 인증
	public void memberAuth(SqlSessionTemplate sqlsession, String memberEmail, String key) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authKey", key);
		map.put("memberEmail", memberEmail);
		sqlsession.update("memberMapper.memberAuth", map);
	}
	
	//sns 로그인, 가입
	public int snsSingup(SqlSessionTemplate sqlSession, MemberDto md) {
		return sqlSession.insert("memberMapper.snsSingup", md);
	}
	
	
	//마이페이지
	public MemberDto myPage(SqlSessionTemplate sqlsession, int memberIdx) {
		return sqlsession.selectOne("memberMapper.myPage", memberIdx);
	}
	
	//마이페이지 업데이트
	public int updateMyPage(SqlSessionTemplate sqlsession, MemberDto memberdto) {
		return sqlsession.update("memberMapper.updateMyPage", memberdto);
	}
	
	//회원 탈퇴
	public int memberDelete(SqlSessionTemplate sqlsession, MemberDto bo) {
		return sqlsession.delete("memberMapper.memberDelete", bo);
	}
	
	//회원 탈퇴 ( 이메일 코드 삭제 )
	public int memberAuthDelete(SqlSessionTemplate sqlsession, MemberDto bo) {
		return sqlsession.delete("memberMapper.memberAuthDelete", bo);
	}
	
}
