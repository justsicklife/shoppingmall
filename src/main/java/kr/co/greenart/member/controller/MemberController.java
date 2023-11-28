package kr.co.greenart.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	@GetMapping("/index")
	public String index() {
		return "/product/create";
	}

	@GetMapping("/signin")
	public String getLoginPage() {
		return "/signin/signin";
	}

	@GetMapping("/signup")
	public String getJoinPage() {
		return "/signup/signup";
	}

}
