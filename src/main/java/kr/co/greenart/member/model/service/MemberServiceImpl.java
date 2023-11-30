package kr.co.greenart.member.model.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.annotation.Retention;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch;
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
	
	//id 찾기
	@Override
	public String findId(MemberDto memberdto) {
		
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out;
//		
//		try {
//			out = response.getWriter();
//			String id = memberDao.findId(sqlSession, memberName, memberEmail);
//			
//			if (id == null) {
//				out.println("<script>");
//				out.println("alert('가입된 아이디가 없습니다.');");
//				out.println("history.go(-1);");
//				out.println("</script>");
//				out.close();
//				return null;
//			} else {
//				return id;
//			}
//		} catch (IOException e) {
//		
//			e.printStackTrace();
//		}
//		return null;
		
		return memberDao.findId(sqlSession, memberdto);
	}

	//pw 찾기(사용 안함)
	@Override
	public String findPw(MemberDto memberdto) {
		return memberDao.findPw(sqlSession, memberdto);
	}

	//pw 찾기(회원번호 가져오기)
	@Override
	public String findIdx(MemberDto memberdto) {
		return memberDao.findIdx(sqlSession, memberdto);
	}
	
	//pw변경
	@Override
	public int changePw(MemberDto memberdto) {
		return memberDao.changePw(sqlSession, memberdto);
	}

}
