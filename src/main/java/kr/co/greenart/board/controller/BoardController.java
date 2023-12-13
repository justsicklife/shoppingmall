package kr.co.greenart.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.greenart.board.model.dto.BoardDto;
import kr.co.greenart.board.model.service.BoardServiceImpl;
import kr.co.greenart.common.model.dto.PageInfo;
import kr.co.greenart.common.template.Pagination;


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardServiceImpl boardservice;
	
	
	//http://localhost/board/list.do
	@GetMapping("/list.do")
	public String boardList(@RequestParam(value="ipage", defaultValue = "1")int CurrentPage, HttpSession session, Model model){
		
		//전체 게시글 구하기
		int listCount = boardservice.selectListCount();
		//보여질 페이지 수
		int pageLimit = 10;
		//한 페이지에 들어갈 게시글 수
		int boardLimit = 8;
		//글의 번호를 뒤에서부터 보여주기 = 전체 게시글 수 - (현재페이지 -1 ) * 한 페이지에 보여줄 게시글 수
		int row = listCount - (CurrentPage -1) * boardLimit;
		
		
		PageInfo inquiryPi = Pagination.getPageInfo(listCount, CurrentPage, pageLimit, boardLimit);
		
		
		List<BoardDto> list = boardservice.selectListAll(inquiryPi);
		//yyyy-mm-dd
//		for(BoardDto item : list) {
//			item.setIndate(item.getIndate().substring(0,10));
//		}
		
		
		model.addAttribute("list", list);
		model.addAttribute("row",row);
		model.addAttribute("inquiryPi", inquiryPi);
		
		return "/board/inquiry";
	}
}
