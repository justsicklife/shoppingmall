package kr.co.greenart.product.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.greenart.product.model.dto.ProductDTO;
import kr.co.greenart.product.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
		
	@Autowired
	private ProductService productService;
	
	@GetMapping("/index")
	public String getIndexPage() {
		
		return "/product/index";
	}
	
	@GetMapping("/create")
	public String getCreatePage() {
		return "/product/create";
	}
	
	@GetMapping("/detail") 
	public String getDetailePage(HttpServletResponse response,@RequestParam(value="product_id",required = true) int id,Model model) throws IOException {
		
		ProductDTO productDTO= productService.productFindById(id);
		
		if (productDTO == null) {
			response.sendError(404,"404에러가 발생했습니다");
		}
		
		model.addAttribute("product",productDTO);
		
		return "/product/detail";
	}
	
//	@GetMapping("/update/{product_id}")
//	public String getUpdatePage(
//			@PathVariable("product_id") int id,
//			Model model
//			) {
//		
//		ProductDTO productDTO= productService.productFindById(id);
//		
//		model.addAttribute("product",productDTO);
//		
//		return "/product/update";
//	}
	
	@PostMapping("/create")
	public String postCreatePage(ProductDTO product,
			@RequestParam("images") MultipartFile[] upload,
			HttpServletRequest request,
			Model model,
			HttpSession session
			) {
		
		
		
		List<String> filePathList = new ArrayList<>();
		
		if(upload.length != 0) {
			Stream<MultipartFile> arrayUpload = Arrays.stream(upload);
			arrayUpload.forEach(file -> {
				// 원본 파일명
				String originalName = file.getOriginalFilename();
				
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
				String randomString = random.ints(length,0,characters.length())
						.mapToObj(characters::charAt)
						.map(Object::toString)
						.collect(Collectors.joining());
				
				String fileName = (output+ "_" + randomString+extension);
				String filePathName = request.getSession().getServletContext().getRealPath("/") + "resources\\upload\\" + fileName;
				
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
		
		if(filePathList.size() != 0) {
			 String filePathStr = String.join(",",filePathList);
			 product.setProduct_image_group(filePathStr);
		}
		
		
		productService.insertProduct(product);
		int product_id = product.getProduct_id();
		
		return "redirect:/product/detail?product_id=" + product_id;
	}
}
