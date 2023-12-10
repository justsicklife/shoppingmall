package kr.co.greenart.review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.greenart.review.model.dto.ReviewDTO;
import kr.co.greenart.review.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/create")
	public String getReviewCreatePage(
			@RequestParam("member_id") int member_id,
			@RequestParam("product_id") int product_id,
			Model model,
			HttpSession session
			) {
		
		model.addAttribute("product_id",product_id);
		model.addAttribute("member_id",member_id);
		
		return "/review/create";
	}
	
	
	@PostMapping("/create")
	public String postReviewCreatePage(ReviewDTO reviewDTO) {
		
		int succecss = reviewService.insertReview(reviewDTO);

		return "redirect:/product/detail?product_id=" + reviewDTO.getProduct_id();
	}
	
	@GetMapping("/update")
	public String getUpdatePage(
			Model model,
			@RequestParam("review_id") int review_id) {
		
		ReviewDTO review = reviewService.reviewFindByReviewId(review_id);
		
		model.addAttribute("review",review);
		
		return "/review/update";
	}
	
	@PostMapping("/update")
	public String postUpdate( ReviewDTO reviewDTO) {
		
		int success = reviewService.reviewUpdpate(reviewDTO);
		
		
		
		return "redirect:/product/detail?product_id=" + reviewDTO.getProduct_id();	
	}
	
	@PostMapping("/delete")
	public String postDelete(ReviewDTO reviewDTO) {
		
		int success = reviewService.reviewDelete(reviewDTO.getReview_id());
		
		
		return "redirect:/product/detail?product_id=" + reviewDTO.getProduct_id();
	}
}