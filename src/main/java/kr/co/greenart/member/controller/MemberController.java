package kr.co.greenart.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/singin")
	public String getLoginPage() {
		return "/member/singin";
	}
	
	@GetMapping("/singup")
	public String getJoinPage() {
		return "/member/singup";
	}
}
