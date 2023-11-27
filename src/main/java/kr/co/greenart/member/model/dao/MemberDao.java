package kr.co.greenart.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.greenart.member.model.dto.MemberDto;
import lombok.NoArgsConstructor;

@Repository
public class MemberDao {
	
	
	//�α���
	// selectOne : �ϳ���������
	public MemberDto loginMember(SqlSessionTemplate sqlSession, MemberDto m) {
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}
	
	//�̸��� Ȯ��
	// selectOne : �ϳ���������
	public int checkEmail(SqlSessionTemplate sqlSession, String memberEmail) {
		return sqlSession.selectOne("memberMapper.checkEmail", memberEmail);
	}
	
	//���̵� Ȯ��
	// selectOne : �ϳ���������
	public int checkId(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.checkId", memberId);
	}
	
	//ȸ�� ����
	//insert : ������ ����
	public int signupMember(SqlSessionTemplate sqlSession, MemberDto memberdto) {
		return sqlSession.insert("memberMapper.signupMember", memberdto);
	}
}
