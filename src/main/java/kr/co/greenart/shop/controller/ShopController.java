package kr.co.greenart.shop.controller;

import java.io.File;
import java.sql.Date;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.greenart.member.model.dto.MemberDto;
import kr.co.greenart.member.model.service.MemberService;
import kr.co.greenart.member.model.service.MemberServiceImpl;



@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private MemberServiceImpl memberSercvice;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@GetMapping("/index.do")
	public String getIndexPage() {
		return "/shop/index";
	}

	@GetMapping("/login.do")
	public String getLoginPage() {
		return "/signin/signin";
	}
	
	
	// ResponseBody 쓰지 않을 경우 : /WEB-INF/views/success.jsp
	// ResponseBody 쓸 경우 : 문자열 success를 클라이언트에게 반환
	@PostMapping("checkMember.do")
	@ResponseBody // HTTP body에 return값을 응답으로 보냄
	public String checkMember(String id, String email) {
		
		int resultId = memberSercvice.checkId(id);
		int resultEmail = memberSercvice.checkEmail(email);
		
		if(resultId > 0 && resultEmail > 0) {
			return "failed";
		} else if (resultId > 0 && resultEmail == 0){
			return "emailFailed";
		} else if (resultId == 0 && resultEmail > 0 ){
			return "idFailed";
		} else {
			return "success";
		}
	}
	
	//http://localhost/shop/signupForm.do
	//회원가입 페이지 이동
	@GetMapping("/signupForm.do")
	public String getSingUpPage() {
		return "/signup/signup";
	}
	
	//회원 가입
	@PostMapping("/signup.do")
	public String signupMember(MemberDto memberDto, HttpSession session) {
		
		//유효성 검사
		String password = memberDto.getMemberPassword();
		String passwordChk = memberDto.getMemberPasswordChk();
		String email = memberDto.getMemberEmail();
		String id = memberDto.getMemberId();
		
		String passwordRegex = "^(?=.*[a-zA-Z])(?=.*[@$!%*?&\\#])[A-Za-z\\d@$!%*?&\\#]{8,20}$";
		String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
		String idRegex = "^(?=.*[a-zA-Z])[a-zA-Z0-9]{8,16}$";
		
		//이메일 저장
		String emailPrefix = memberDto.getEmailPrefix();
		String emailSuffix = memberDto.getEmailSuffix();
		memberDto.setMemberEmail(emailPrefix + "@" + emailSuffix);
		
		
		// id, email 중복 확인 메서드 ( ajax로 요청하던 메서드에 email을 담고 결과값 반환 받음 , String chkMember = failed , emailFailed, idFailed, success 중 하나 반환 받음)
		String chkMember = checkMember(id, email);
		System.out.println("chkMember : " + chkMember);
		
		System.out.println("member :" + memberDto);
		System.out.println(chkMember.equals("success"));
		
		if(password.matches(passwordRegex) && password.equals(passwordChk) &&
				chkMember.equals("success") && email.matches(emailRegex) && id.matches(idRegex)) {
			
			System.out.println("중복 확인 및 유효성 검사 완료");
			
			//패스워드 암호화
			String bcryPassword = bcryptPasswordEncoder.encode(memberDto.getMemberPassword());
			memberDto.setMemberPassword(bcryPassword);
			
			//회원 가입
			int result = memberSercvice.signupMember(memberDto);
			
			if(result > 0) { //데이터가 전송 가능하면
				System.out.println("가입 완료");
				return "signin/signin";
			} else {
				System.out.println("데이터 전송 실패");
				return "shop/index"; // 임시로 메인 페이지 이동 ( error )
			}
		} else {
			System.out.println("회원가입 유효성 검사 불일치");
			return "shop/index"; // 임시로 메인 페이지 이동 ( error )
		}
	}
	
	
	
	
	@GetMapping("/create")
	public String getCreatePage() {
		return "/shop/create";
	}
	
	@GetMapping("/detail")
	public String getDetail() {
		return "/shop/detail";
	}
	
	@GetMapping("/review")
	public String getReview() {
		return "/board/review";
	}
	
	@GetMapping("/chat_admin")
	public String getChatAdmin() {
		return "/chat/chat_admin";
	}
	
	@GetMapping("/chat_user")
	public String getChatUser() {
		return "/chat/chat_user";
	}
}
