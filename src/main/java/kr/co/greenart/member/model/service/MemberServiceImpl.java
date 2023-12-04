package kr.co.greenart.member.model.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.annotation.Retention;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.co.greenart.common.MailUtils;
import kr.co.greenart.common.TempKey;
import kr.co.greenart.member.model.dao.MemberDao;
import kr.co.greenart.member.model.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Inject
	private JavaMailSender mailSender;
	
	
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

	//회원 가입 ( 사용 안함 )
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

	//이메일 인증
    @Override
	public void memberAuth(String memberEmail, String key) throws Exception{
		memberDao.memberAuth(sqlSession, memberEmail, key);
    }
    
    //이메일 발송
	@Override
	public void sendMail(MemberDto memberdto) throws Exception {
		memberDao.signupMember(sqlSession, memberdto);
		
		String key = new TempKey().getKey(50,false);
		memberDao.createAuthKey(sqlSession, memberdto.getMemberEmail(), key);
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[쇼핑몰 프로젝트 이메일 인증 입니다.]"); //메일제목
		sendMail.setText(
				"<h1>메일인증</h1>" +
						"<br/>"+memberdto.getMemberId()+"님 "+
						"<br/>쇼핑몰 프로젝트에 회원가입 해주셔서 감사합니다."+
						"<br/>아래 [이메일 인증 확인]을 눌러주세요."+
						"<a href='http://localhost/member/emailConfirm?memberEmail=" + memberdto.getMemberEmail() +
						"&key=" + key +
						"' target='_blenk'><br>이메일 인증 확인</a>");
		sendMail.setFrom("shopprj2023@gmail.com", "[쇼핑몰 프로젝트]");
		sendMail.setTo(memberdto.getMemberEmail());
		sendMail.send();
	}
}
