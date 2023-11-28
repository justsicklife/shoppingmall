package kr.co.greenart.review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@GetMapping("/create/{product_id}")
	public String getReviewCreatePage(
			@PathVariable("product_id") int product_id,
			Model model,
			HttpSession session
			) {
		
		model.addAttribute("product_id",product_id);
		
		return "/review/create";
	}
	
}