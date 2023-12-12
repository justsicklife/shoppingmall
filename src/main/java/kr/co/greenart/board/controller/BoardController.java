package kr.co.greenart.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.greenart.board.model.service.BoardServiceImpl;


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardServiceImpl boardservice;
	
	
	//http://localhost/board/list
	@GetMapping("/list")
	public String boardList(){
		return "/product/detail";
	}
}
