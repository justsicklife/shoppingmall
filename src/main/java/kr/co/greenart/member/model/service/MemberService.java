package kr.co.greenart.member.model.service;

import kr.co.greenart.member.model.dao.MemberDao;
import kr.co.greenart.member.model.dto.MemberDto;

public interface MemberService {

	MemberDto loginMember(MemberDto m);
	
	//���̵� üũ
	int checkId(String id);
	
	//�̸��� üũ
	int checkEmail(String email);
	
	//ȸ�� ����
	int signupMember(MemberDto memberDto);
	
}
