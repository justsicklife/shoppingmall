package kr.co.greenart.product.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.IntSummaryStatistics;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.greenart.board.model.dto.BoardDto;
import kr.co.greenart.board.model.service.BoardServiceImpl;
import kr.co.greenart.common.model.dto.PageInfo;
import kr.co.greenart.common.template.Pagination;
import kr.co.greenart.product.model.dto.ProductDTO;
import kr.co.greenart.product.service.ProductService;
import kr.co.greenart.review.model.dto.ReviewDTO;
import kr.co.greenart.review.service.ReviewService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private BoardServiceImpl boardservice;
	
	@GetMapping("/index")
	public String getIndexPage(HttpSession session, Model model) {

		// 해야될거
		// 1. 각자 type 에 맞는 상품 들을 불러온다
		List<String> types = new ArrayList<>(Arrays.asList("outer", "top", "bottom", "shoes"));

		Stream<String> straem = types.stream();

		straem.forEach((item) -> {

			List<ProductDTO> productType = productService.productFindByType(item);

			for (int i = 0; i < productType.size(); i++) {
				productType.get(i).setProduct_image((productType.get(i).getProduct_image_group().split(",")[0]));
			}

			productType.forEach((type) -> {
				type.setProduct_image(type.getProduct_image_group().split(",")[0]);
			});

			System.out.println(productType);
			model.addAttribute(item, productType);
		});

		return "/product/index";
	}

	@GetMapping("/create")
	public String getCreatePage(HttpSession session, Model model) {

		String msg = (String) session.getAttribute("msg");

		session.removeAttribute("msg");

		model.addAttribute("msg", msg);

		return "/product/create";
	}

	@GetMapping("/detail")
	public String getDetailePage(HttpServletResponse response,
			@RequestParam(value = "product_id", required = true) int id, Model model,
			@RequestParam(value = "rpage", defaultValue = "1") int reviewCurrentPage,
			// q&a 페이지
			@RequestParam(value = "ipage", defaultValue = "1") int inquryCurrentPage, HttpSession session)
			throws IOException {

		// 상품을 가져온다
		ProductDTO productDTO = productService.productFindById(id);

		// 상품이 없다면 404 페이지 보여준다
		if (productDTO == null) {
			response.sendError(404, "404에러가 발생했습니다");
		}

		// 점수갯수 구하는 스트림
		List<Integer> scoreNums = Arrays.asList(1, 2, 3, 4, 5).stream().map(x -> {
			Map<String, Integer> map = new HashMap<>();
			map.put("score", x);
			map.put("id", productDTO.getProduct_id());

			return reviewService.getStarCountById(map);
		}).collect(Collectors.toList());

		IntSummaryStatistics countScore = scoreNums.stream().mapToInt(num -> num).summaryStatistics();

		double sumScore = 0;

		for (int i = 1; i <= 5; i++) {
			sumScore += scoreNums.get(i - 1) * i;
		}

		// 평균 구하는거
		if(sumScore != 0) {
			sumScore /= countScore.getSum();			
		} else {
			sumScore = 0;
		}
		
		model.addAttribute("sumScore", sumScore);

		model.addAttribute("scores", scoreNums);

		// 임시 유저 아이디
		Object idObject = session.getAttribute("memberIdx");
		int memberId = -1;

		if (session.getAttribute("memberIdx") != null && idObject instanceof Integer) {
			memberId = (Integer) idObject;
		}

		// qna 코드

		// 전체 게시글 구하기
		int listCount = boardservice.selectListCount(id);
		// 보여질 페이지 수
		int pageLimit = 5;
		// 한 페이지에 들어갈 게시글 수
		int boardLimit = 4;
		// 글의 번호를 뒤에서부터 보여주기 = 전체 게시글 수 - (현재페이지 -1 ) * 한 페이지에 보여줄 게시글 수
		int row = listCount - (inquryCurrentPage - 1) * boardLimit;

		PageInfo inquiryPi = Pagination.getPageInfo(listCount, inquryCurrentPage, pageLimit, boardLimit);

		List<BoardDto> list = boardservice.selectListAll(inquiryPi, id);

		System.out.println(list);
		
		List<BoardDto> answerList = boardservice.selectAnswerAll(id);
	
		System.out.println("answerList : "  + answerList);
		
		Object memberNameObj = session.getAttribute("memberName");
		String memberName = null;
	
		if (memberNameObj != null && memberNameObj instanceof String) {
			memberName = (String)memberNameObj;
		}
				
		model.addAttribute("answerList", answerList);
		model.addAttribute("boardList", list);
		model.addAttribute("boardRow",row);
		model.addAttribute("inquiryPi", inquiryPi);
		
		model.addAttribute("memberName",memberName);
		
		// qna

		int reviewListCount = reviewService.selectListCount(id);

		// 페이지 제한 수
		int reviewPageLimit = 5;
		// 리뷰 제한수
		int reviewLimit = 5;

		PageInfo pi = Pagination.getPageInfo(reviewListCount, reviewCurrentPage, reviewPageLimit, reviewLimit);

		// 상품아이디 와 같은 리뷰를 가져올때
		List<ReviewDTO> reviewList = reviewService.reviewFindByProductId(pi, id);

		Map<String, Integer> map = new HashMap<>();
		map.put("member_id", memberId);
		map.put("product_id", id);

		// 리뷰를 가져오는데 자기가 작성한 리뷰 를 가져온다.
		ReviewDTO curUserReviewDTO = reviewService.findReviewByMemberAndProduct(map);

		model.addAttribute("reviewPi", pi);

		model.addAttribute("reviewListCount", reviewListCount);

		model.addAttribute("reviewCurUser", curUserReviewDTO);

		model.addAttribute("reviewList", reviewList);

		model.addAttribute("product", productDTO);

		model.addAttribute("member_id", memberId);
		
		model.addAttribute("product_id",id);
		
		return "/product/detail";
	}

	@PostMapping("/create")
	public String postCreatePage(ProductDTO product,
			@RequestParam(name = "images", defaultValue = "", required = false) MultipartFile[] upload,
			HttpServletRequest request, Model model, HttpSession session) {

		List<String> filePathList = new ArrayList<>();

		System.out.println(upload.length);
		System.out.println(upload);

		if (upload.length != 0) {
			Stream<MultipartFile> arrayUpload = Arrays.stream(upload);
			arrayUpload.forEach(file -> {
				// 원본 파일명
				String originalName = file.getOriginalFilename();

				if (file.getOriginalFilename().equals("")) {
					return;
				}

				// 확장자 구하기
				String extension = originalName.substring(originalName.lastIndexOf("."));

				// 현재 년-월-일-시-분-초
				LocalDateTime now = LocalDateTime.now();

				// 년월시분초 형식을 데이터 가공
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmmss");
				String output = now.format(formatter);

				// 랜덤 문자열 생성
				int length = 8; // 생성할 문자열의 길이
				String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&";

				Random random = new Random();
				String randomString = random.ints(length, 0, characters.length()).mapToObj(characters::charAt)
						.map(Object::toString).collect(Collectors.joining());

				String fileName = (output + "_" + randomString + extension);
				String filePathName = request.getSession().getServletContext().getRealPath("/") + "resources\\upload\\"
						+ fileName;

				System.out.println(filePathName);

				filePathList.add("/resources/upload/" + fileName);
				Path filePath = Paths.get(filePathName);

				try {
					file.transferTo(filePath);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

			});
		}

		if (filePathList.size() != 0) {
			String filePathStr = String.join(",", filePathList);
			product.setProduct_image_group(filePathStr);
		}

		if (product.getProduct_image_group() == null) {
			session.setAttribute("msg", "이미지가 없습니다.");
			return "redirect:/product/create";
		}

		productService.insertProduct(product);
		int product_id = product.getProduct_id();

		return "redirect:/product/detail?product_id=" + product_id;
	}
}
