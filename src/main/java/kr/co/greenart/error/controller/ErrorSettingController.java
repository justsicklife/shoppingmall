package kr.co.greenart.error.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class ErrorSettingController {

	@GetMapping("/error404")
	public String Error404(Model model) {
		model.addAttribute("code","ERROR_404");
		return "/common/error404";
	}
	
}
