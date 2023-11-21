package kr.co.greenart.shop.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
    private ServletContext servletContext;
	
	@GetMapping("/index")
	public String getIndexPage() {
		return "/shop/index";
	}

	@GetMapping("/login")
	public String getLoginPage() {
		return "/singin/singin";
	}

	@GetMapping("/singup")
	public String getSingUpPage() {
		return "/singup/singup";
	}

}
