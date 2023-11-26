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
	
	
	// ResponseBody ���� ���� ��� : /WEB-INF/views/success.jsp
	// ResponseBody �� ��� : ���ڿ� success�� Ŭ���̾�Ʈ���� ��ȯ
	@PostMapping("checkMember.do")
	@ResponseBody // HTTP body�� return���� �������� ����
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
	//ȸ������ ������ �̵�
	@GetMapping("/signupForm.do")
	public String getSingUpPage() {
		return "/signup/signup";
	}
	
	//ȸ�� ����
	@PostMapping("/signup.do")
	public String signupMember(MemberDto memberDto, HttpSession session) {
		
		//��ȿ�� �˻�
		String password = memberDto.getMemberPassword();
		String passwordChk = memberDto.getMemberPasswordChk();
		String email = memberDto.getMemberEmail();
		String id = memberDto.getMemberId();
		
		String passwordRegex = "^(?=.*[a-zA-Z])(?=.*[@$!%*?&\\#])[A-Za-z\\d@$!%*?&\\#]{8,20}$";
		String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
		String idRegex = "^(?=.*[a-zA-Z])[a-zA-Z0-9]{8,16}$";
		
		//�̸��� ����
		String emailPrefix = memberDto.getEmailPrefix();
		String emailSuffix = memberDto.getEmailSuffix();
		memberDto.setMemberEmail(emailPrefix + "@" + emailSuffix);
		
		
		// id, email �ߺ� Ȯ�� �޼��� ( ajax�� ��û�ϴ� �޼��忡 email�� ��� ����� ��ȯ ���� , String chkMember = failed , emailFailed, idFailed, success �� �ϳ� ��ȯ ����)
		String chkMember = checkMember(id, email);
		System.out.println("chkMember : " + chkMember);
		
		System.out.println("member :" + memberDto);
		System.out.println(chkMember.equals("success"));
		
		if(password.matches(passwordRegex) && password.equals(passwordChk) &&
				chkMember.equals("success") && email.matches(emailRegex) && id.matches(idRegex)) {
			
			System.out.println("�ߺ� Ȯ�� �� ��ȿ�� �˻� �Ϸ�");
			
			//�н����� ��ȣȭ
			String bcryPassword = bcryptPasswordEncoder.encode(memberDto.getMemberPassword());
			memberDto.setMemberPassword(bcryPassword);
			
			//ȸ�� ����
			int result = memberSercvice.signupMember(memberDto);
			
			if(result > 0) { //�����Ͱ� ���� �����ϸ�
				System.out.println("���� �Ϸ�");
				return "signin/signin";
			} else {
				System.out.println("������ ���� ����");
				return "shop/index"; // �ӽ÷� ���� ������ �̵� ( error )
			}
		} else {
			System.out.println("ȸ������ ��ȿ�� �˻� ����ġ");
			return "shop/index"; // �ӽ÷� ���� ������ �̵� ( error )
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
