package kr.co.greenart.member.controller;

import java.io.File;
import java.lang.System.Logger;
import java.sql.Date;
import java.util.HashMap;
import java.util.Objects;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.greenart.member.model.dto.MemberDto;
import kr.co.greenart.member.model.service.MemberService;
import kr.co.greenart.member.model.service.MemberServiceImpl;
import oracle.jdbc.proxy.annotation.Post;



@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	
	//id찾기 페이지
	//http://localhost/member/searchId
	@GetMapping("/searchId")
	public String searchId() {
		return "/member/search_id";
	}
	
	//id찾기
	@PostMapping("/findId.do")
	public String findId(@RequestParam("memberName") String memberName, 
						 @RequestParam("memberEmail") String memberEmail, 
						 Model model) 
						 throws Exception {
			
			MemberDto memberdto = new MemberDto();
			memberdto.setMemberName(memberName);
			memberdto.setMemberEmail(memberEmail);
			
			model.addAttribute("memberId", memberService.findId(memberdto));
			return "/member/find_id";
			
	}
	
	//pw찾기 페이지
	//http://localhost/member/searchPw
	@GetMapping("/searchPw")
	public String searchPw() {
		return "/member/search_pw";
	}
	
	//pw찾기
	@PostMapping("/findPw.do")
	public String findPw(@RequestParam("memberId") String memberId, 
						   @RequestParam("memberEmail") String memberEmail, 
							Model model)
							throws Exception{
		
			MemberDto memberdto = new MemberDto();
			memberdto.setMemberId(memberId);
			memberdto.setMemberEmail(memberEmail);
			
			model.addAttribute("memberIdx", memberService.findIdx(memberdto));
			System.out.println("memberIdx, memberSercvice.findIdx(memberdto) : " + memberService.findIdx(memberdto));
			
			return "/member/change_pw";
	}
	
	//pw변경
	@PostMapping("/changePw.do")
	public String changePw(HttpSession session, MemberDto memberdto) {
		
		//유효성 검사
		String password = memberdto.getMemberPassword();
		String passwordChk = memberdto.getMemberPasswordChk();
		String passwordRegex = "^(?=.*[a-zA-Z])(?=.*[@$!%*?&\\#])[A-Za-z\\d@$!%*?&\\#]{8,20}$";
		
		System.out.println("member :" + memberdto);	
		System.out.println("password : " + password);
		
		if(password.matches(passwordRegex) && password.equals(passwordChk)) {
			
			System.out.println("중복 확인 및 유효성 검사 완료");
			System.out.println("password : " + password);
			System.out.println("savePw :" + memberdto.getMemberPassword());
			
			//패스워드 암호화
			String bcryPassword = bcryptPasswordEncoder.encode(memberdto.getMemberPassword());
			memberdto.setMemberPassword(bcryPassword);
			System.out.println("bcryPassword : " + bcryPassword);
			System.out.println("member :" + memberdto);
			
			//update 서비스 실행
			int result = memberService.changePw(memberdto);
			System.out.println("result : " + result);
			System.out.println("update_member :" + memberdto);
			
			System.out.println("비밀번호 변경 완료");
			return "/signin/signin";
		} else {
			System.out.println("비밀번호 변경 실패, 유효성 검사 불일치");
			return "/shop/index"; // 임시로 메인 페이지 이동 ( error )
		}
	}
	
	//메인 페이지
	//http://localhost/member/indexPage
	@GetMapping("/indexPage")
	public String getIndexPage() {
		return "/product/index";
	}

	//로그인 페이지 (임시)
	//http://localhost/member/loginPage
	//https://nid.naver.com/internalToken/view/tokenList/pc/ko
	@GetMapping("loginPage")
	public String loginPage() {
		return "/signin/signin";
	}
	
	//로그인
	@PostMapping("/login.do")
	public String getLoginPage(MemberDto memberDto, HttpSession session, Model model ) {
		
		MemberDto loginUser = memberService.loginMember(memberDto);
		
		// Objects.isNull(loginUser) = null : true
		// ! null : false 논리 부정 사용했으니 비어있다면 false
		// getMemberPassword - 사용자 입력 패스워드 / getMemberPassword - db에 자정된 패스워드
		if(!Objects.isNull(loginUser) && bcryptPasswordEncoder.matches(memberDto.getMemberPassword(), loginUser.getMemberPassword()) && loginUser.getMemberAuth() == 1) {
			
			System.out.println("로그인 성공");
			
			session.setAttribute("memberIdx", loginUser.getMemberIdx());
			
			return "redirect:/member/indexPage";
		} else if(Objects.isNull(loginUser) || !bcryptPasswordEncoder.matches(memberDto.getMemberPassword(), loginUser.getMemberPassword())){
			System.out.println("로그인 실패");
			 model.addAttribute("loginError", true); // 로그인 실패를 나타내는 속성 추가 (signin.jsp 스크립트 실행)
			return "/signin/signin";
		} else if(loginUser.getMemberAuth() == 0){
			return "/member/registerReady";
		} else {
			System.out.println("로그인 에러");
			return "error";
			
		}
	}
	
	
	// ResponseBody 쓰지 않을 경우 : /WEB-INF/views/success.jsp
	// ResponseBody 쓸 경우 : 문자열 success를 클라이언트에게 반환
	@PostMapping("checkMember.do")
	@ResponseBody // HTTP body에 return값을 응답으로 보냄
	public String checkMember(String id, String email) {
		
		int resultId = memberService.checkId(id);
		int resultEmail = memberService.checkEmail(email);
		
//		System.out.println("resultId : " + resultId);
//		System.out.println("resultEmail : " + resultEmail);
		
		if(resultId > 0 && resultEmail > 0) {
			return "failed";
		} else if (resultId > 0 && resultEmail <= 0){
			System.out.println("아이디 중복");
			return "idFailed";
		} else if (resultId <= 0 && resultEmail > 0 ){
			System.out.println("이메일 중복");
			return "emailFailed";
		} else {
			return "success";
		}
	}
	
	//http://localhost/member/signupPage.do
	//회원가입 페이지 이동
	@GetMapping("/signupPage.do")
	public String getSingUpPage() {
		return "/signup/signup";
	}
	
	//회원 가입
	@PostMapping("/signup.do")
	public String signupMember(MemberDto memberDto, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		//유효성 검사
		String password = memberDto.getMemberPassword();
		String passwordChk = memberDto.getMemberPasswordChk();
		String id = memberDto.getMemberId();
		
		String passwordRegex = "^(?=.*[a-zA-Z])(?=.*[@$!%*?&\\#])[A-Za-z\\d@$!%*?&\\#]{8,20}$";
		String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
		String idRegex = "^(?=.*[a-zA-Z])[a-zA-Z0-9]{8,16}$";
		
		//이메일 저장
		String emailPrefix = memberDto.getEmailPrefix();
		String emailSuffix = memberDto.getEmailSuffix();
		memberDto.setMemberEmail(emailPrefix + "@" + emailSuffix);
		String email = memberDto.getMemberEmail();
		
		
		// id, email 중복 확인 메서드 ( ajax로 요청하던 메서드에 email을 담고 결과값 반환 받음 , String chkMember = failed , emailFailed, idFailed, success 중 하나 반환 받음)
		String chkMember = checkMember(id, email);
//		System.out.println("chkMember : " + chkMember);
//		
//		System.out.println("member :" + memberDto);
//		System.out.println(chkMember.equals("success"));
//		
//		System.out.println("password : " + password);
//		System.out.println("chkMember : " + chkMember);
//		System.out.println("email : " + email);
//		System.out.println("id : " + id);
		
		if(password.matches(passwordRegex) && password.equals(passwordChk) &&
				chkMember.equals("success") && email.matches(emailRegex) && id.matches(idRegex)) {
			
			System.out.println("중복 확인 및 유효성 검사 완료");
			
			//패스워드 암호화
			String bcryPassword = bcryptPasswordEncoder.encode(memberDto.getMemberPassword());
			memberDto.setMemberPassword(bcryPassword);
			
		
			//redirect되는 곳으로 데이터 전송
//			rttr.addFlashAttribute("msg", "가입이 완료되었습니다");
			rttr.addAttribute("memberEmail", memberDto.getMemberEmail());
			rttr.addAttribute("memberId", memberDto.getMemberId());
			
			//회원 가입 ( insert 서비스 실행)
//			int result = memberService.signupMember(memberDto);
			memberService.sendMail(memberDto);
			return "redirect:/member/registerAuth";
			
//			if(result > 0) { //데이터가 전송 가능하면
//				System.out.println("가입 완료");
//				return "signin/signin";
//			} else {
//				System.out.println("데이터 전송 실패");
//				return "shop/index"; // 임시로 메인 페이지 이동 ( error )
//			}
		} else {
			System.out.println("회원가입 유효성 검사 불일치");
			return "shop/index"; // 임시로 메인 페이지 이동 ( error )
		}
	}
	
	//이메일 인증
	@GetMapping("/emailConfirm")
	public String emailConfirm(String memberEmail, String key, Model model)throws Exception{
		memberService.memberAuth(memberEmail, key);
		model.addAttribute("memberEmail", memberEmail);
		model.addAttribute("authKey", key);
		
		return "/member/emailConfirm";
	}
	
	//이메일 인증 요청 페이지
	@GetMapping("/registerAuth")
	public String loginView(HttpServletRequest request, Model model, @RequestParam("memberEmail")String memberEmail, @RequestParam("memberId")String memberId) throws Exception{

		model.addAttribute("memberEmail", memberEmail);
		model.addAttribute("memberId", memberId);
		
		return "/member/registerAuth";
	}
	
	
	// 네이버 로그인
	@RequestMapping(value = "/naverLogin", method = RequestMethod.GET)
	public String naverLogin(@RequestParam(value = "code", required = false) String code, HttpSession session,
				Model model) throws Throwable {

			String access_Token = memberService.getAccessTokenNaver(code);
			// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
			System.out.println("access_Token" + access_Token);

			HashMap<String, Object> userInfo = memberService.getUserInfoNaver(access_Token);
			System.out.println("###id#### : " + userInfo.get("id"));
			System.out.println("###pw#### : " + userInfo.get("pw"));
			System.out.println("###email#### : " + userInfo.get("email"));
			System.out.println("###name#### : " + userInfo.get("name"));
			System.out.println("###phoneNum#### : " + userInfo.get("phoneNum"));
			System.out.println("###gender#### : " + userInfo.get("gender"));
			System.out.println("###birthday#### : " + userInfo.get("birthday"));
			String id = (String) userInfo.get("id");
			String email = (String) userInfo.get("email");
			
//			int checkId = memberService.checkId(id);
			int checkEmail = memberService.checkEmail(email);
			
			//중복 되는 이메일로 가입된 계정이 있을 경우, 해당 이메일 계정으로 접속함
			if (checkEmail > 0) {
				MemberDto m = new MemberDto();
				m.setMemberEmail(email);
				MemberDto loginUser = memberService.snsLoginMember(m);
				System.out.println(loginUser);
				if (!Objects.isNull(loginUser)) {
					System.out.println("데이터(네이버 계정) 있음");
					session.setAttribute("memberNum", loginUser.getMemberIdx());
					String sessionMemberIdx = String.valueOf(loginUser.getMemberIdx());
					session.setAttribute("sessionMemberIdx", sessionMemberIdx);
					session.setAttribute("memberName", loginUser.getMemberName());
					return "redirect:/member/indexPage";
				} else {
//					model.addAttribute("msg", "아이디 비밀번호를 확인해 주세요!");
//					model.addAttribute("status", "error");
					return "/signin/signin";
				}
			} else {
				System.out.println("네이버 계정 가입");
				MemberDto md = new MemberDto();
				md.setMemberId(id);
				md.setMemberPassword((String) userInfo.get("pw"));
				md.setMemberEmail((String) userInfo.get("email"));
				md.setMemberName((String) userInfo.get("name"));
				md.setMemberGender((String) userInfo.get("gender"));
				md.setMemberphoneNum((String) userInfo.get("phoneNum"));
				md.setMemberBirthday((String) userInfo.get("birthday"));

				int result = memberService.snsSingup(md);
				if (result > 0) {
					MemberDto m = new MemberDto();
					m.setMemberId(id);
					MemberDto loginUser = memberService.loginMember(m);
					System.out.println(loginUser.toString());
					if (!Objects.isNull(loginUser)) {
						session.setAttribute("memberNum", loginUser.getMemberIdx());
						String sessionMemberIdx = String.valueOf(loginUser.getMemberIdx());
						session.setAttribute("sessionMemberIdx", sessionMemberIdx);
						session.setAttribute("memberName", loginUser.getMemberName());
						return "redirect:/member/indexPage";
					} else {
//						model.addAttribute("msg", "아이디 비밀번호를 확인해 주세요!");
//						model.addAttribute("status", "error");
						return "/signin/signin";
					}
				}
				return "/signin/signin";
			}
		}
	
	// 카카오 로그인
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session,
			Model model) throws Throwable {

		String access_Token = memberService.getAccessTokenKakao(code);
		// 위의 access_Token 받는 걸 확인한 후에 밑에 진행

		HashMap<String, Object> userInfo = memberService.getUserInfoKakao(access_Token);
		System.out.println("###id#### : " + userInfo.get("id"));
		System.out.println("###pw#### : " + userInfo.get("pw"));
		System.out.println("###email#### : " + userInfo.get("email"));
//		System.out.println("###name#### : " + userInfo.get("name"));
//		System.out.println("###phoneNum#### : " + userInfo.get("phoneNum"));
//		System.out.println("###gender#### : " + userInfo.get("gender"));
//		System.out.println("###birthday#### : " + userInfo.get("birthday"));
		String id = (String) userInfo.get("id");
		String email = (String) userInfo.get("email");
		
//		int checkId = memberService.checkId(id);
		int checkEmail = memberService.checkEmail(email);
		
		//중복 되는 이메일로 가입된 계정이 있을 경우, 해당 이메일 계정으로 접속함
		if (checkEmail > 0) {
			MemberDto m = new MemberDto();
			m.setMemberEmail(email);
			MemberDto loginUser = memberService.snsLoginMember(m);
			System.out.println(loginUser);
			if (!Objects.isNull(loginUser)) {
				System.out.println("데이터(카카오 계정) 있음");
				session.setAttribute("memberNum", loginUser.getMemberIdx());
				String sessionMemberIdx = String.valueOf(loginUser.getMemberIdx());
				session.setAttribute("sessionMemberIdx", sessionMemberIdx);
				session.setAttribute("memberName", loginUser.getMemberName());
				return "redirect:/member/indexPage";
			} else {
//				model.addAttribute("msg", "아이디 비밀번호를 확인해 주세요!");
//				model.addAttribute("status", "error");
				return "/signin/signin";
			}
		} else {
			System.out.println("카카오 계정 가입");
			MemberDto md = new MemberDto();
			md.setMemberId(id);
			md.setMemberPassword((String) userInfo.get("pw"));
			md.setMemberEmail((String) userInfo.get("email"));
//			md.setMemberName((String) userInfo.get("name"));
//			md.setMemberGender((String) userInfo.get("gender"));
//			md.setMemberphoneNum((String) userInfo.get("phoneNum"));
//			md.setMemberBirthday((String) userInfo.get("birthday"));

			int result = memberService.snsSingup(md);
			if (result > 0) {
				MemberDto m = new MemberDto();
				m.setMemberId(id);
				MemberDto loginUser = memberService.loginMember(m);
				System.out.println(loginUser.toString());
				if (!Objects.isNull(loginUser)) {
					session.setAttribute("memberNum", loginUser.getMemberIdx());
					String sessionMemberIdx = String.valueOf(loginUser.getMemberIdx());
					session.setAttribute("sessionMemberIdx", sessionMemberIdx);
					session.setAttribute("memberName", loginUser.getMemberName());
					return "redirect:/member/indexPage";
				} else {
//					model.addAttribute("msg", "아이디 비밀번호를 확인해 주세요!");
//					model.addAttribute("status", "error");
					return "/signin/signin";
				}
			}
			return "/signin/signin";
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