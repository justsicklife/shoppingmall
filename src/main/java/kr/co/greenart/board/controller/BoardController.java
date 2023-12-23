package kr.co.greenart.board.controller;

import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.greenart.board.model.dto.BoardDto;
import kr.co.greenart.board.model.service.BoardService;
import kr.co.greenart.board.model.service.BoardServiceImpl;
import kr.co.greenart.common.model.dto.PageInfo;
import kr.co.greenart.common.template.Pagination;
import kr.co.greenart.member.model.dto.MemberDto;
import kr.co.greenart.member.model.service.MemberService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardServiceImpl boardservice;

	// 임시 접속자 ( 합치고 수정할것 )

	// http://localhost/board/list.do
//	@GetMapping("/list.do")
//	public String boardList(@RequestParam(value="ipage", defaultValue = "1")int CurrentPage,BoardDto boardDto, HttpSession session, Model model){
//		
//		//임시 ( 합치고 수정할것 )
//		boardDto.setBoardProductNum(productNum);
//		System.out.println("문의 목록 boardDto : " + boardDto);
//		
//		//전체 게시글 구하기
//		int listCount = boardservice.selectListCount(boardDto);
//		//보여질 페이지 수
//		int pageLimit = 10;
//		//한 페이지에 들어갈 게시글 수
//		int boardLimit = 8;
//		//글의 번호를 뒤에서부터 보여주기 = 전체 게시글 수 - (현재페이지 -1 ) * 한 페이지에 보여줄 게시글 수
//		int row = listCount - (CurrentPage -1) * boardLimit;
//		
//		
//		PageInfo inquiryPi = Pagination.getPageInfo(listCount, CurrentPage, pageLimit, boardLimit);
//		
//		
//		List<BoardDto> list = boardservice.selectListAll(inquiryPi, boardDto);
//		//yyyy-mm-dd
////		for(BoardDto item : list) {
////			item.setIndate(item.getIndate().substring(0,10));
////		}
//		List<BoardDto> answerList = boardservice.selectAnswerAll(boardDto);
//		
//		model.addAttribute("answerList", answerList);
//		model.addAttribute("list", list);
//		model.addAttribute("row",row);
//		model.addAttribute("inquiryPi", inquiryPi);
//		
//		//임시 접속자 ( 합치고 수정할것 )
//		model.addAttribute("memberId", memberId);
//		
//		return "/board/inquiry";
//	}

	// "문의하기" 버튼을 누르면 자바스크립트 openWrite()이 받아서 inquiry_write.jsp로 포워딩
	@GetMapping("/enrollForm.do")
	public String enrollForm(HttpSession session, Model model, @RequestParam("product_id") int productId) {

		model.addAttribute("productId", productId);

		return "/board/inquiry_write";
	}

	// 유저 글 작성
	@PostMapping("insert.do")
	@ResponseBody
	public String insertInquiry(BoardDto boardDto, HttpSession session) {

//		boardDto.setProductNum((int)session.getAttribute("productNum"));
//		boardDto.setMemberId((String)session.getAttribute("memberId"));
//		boardDto.setMemberIdx((int)session.getAttribute("memberIdx"));

		System.out.println(boardDto);

		String memberId = (String) session.getAttribute("memberId");
		int memberIdx = (Integer)session.getAttribute("memberIdx");

//		boardDto.setBoardProductNum(productNum);
		boardDto.setBoardMemberId(memberId);
		boardDto.setBoardMemberIdx(memberIdx);

		int result = boardservice.insertInquiry(boardDto);
		System.out.println("result : " + result);

		if (result > 0) {
			System.out.println("문의 글 작성 완료");
			return null;
//			return "success";
		} else {
			System.out.println("문의 글 작성 실패");
			return null;
		}
	}


	// 관리자 답변 페이지
	// "답변" 버튼을 누르면 자바스크립트 answerForm()이 받아서 admin_write.jsp로 포워딩
	@GetMapping("/answerForm.do")
	public String answerForm(BoardDto boardDto, HttpSession session, Model model) {
		try {

			String memberId = (String) session.getAttribute("memberId");

			System.out.println("boardDTO : " + boardDto);

			if (boardDto.getBoardQuestionNum() != 0) {
				// 문자열을 정수로 변환
				int parsedQuestionNum = boardDto.getBoardQuestionNum();

				// 변환된 값을 DTO에 설정
				boardDto.setBoardQuestionNum(parsedQuestionNum);
				System.out.println("boardQuestionNum: " + parsedQuestionNum);

				System.out.println("boardProductNum : " + boardDto.getBoardProductNum());

				// 임시 접속자 ( 합치고 수정할것 )
				boardDto.setBoardMemberId(memberId);
				System.out.println("boardMemberId: " + memberId);
				model.addAttribute("user", memberId);
				model.addAttribute("boardQuestionNum", boardDto.getBoardQuestionNum());
				model.addAttribute("boardProductNum", boardDto.getBoardProductNum());

				return "/board/admin_write";
			} else {
				System.out.println("boardQuestionNum 전송 되지 않음");
				// boardQuestionNum이 전송되지 않은 경우 처리
				// 원하는 방식으로 처리할 수 있도록 수정
				return "error"; // 혹은 다른 오류 처리 페이지로 리다이렉트 등
			}
		} catch (NumberFormatException e) {
			// 정수로 변환할 수 없는 경우 처리
			// 예: 클라이언트가 숫자가 아닌 값을 전송한 경우
			// 원하는 방식으로 처리할 수 있도록 수정
			return "error"; // 혹은 다른 오류 처리 페이지로 리다이렉트 등
		}
	}

	// 관리자 문의 답변 ( 테이블 1개에 기본키 2개 사용해서(질문,답변 유/무) INSERT 하면 무결성 제약 뜨는데 해결함, 코드 수정시 말
	// 할 것 )
	@PostMapping("/answer.do")
	@ResponseBody
	public String inquiryAnswer(BoardDto boardDto, HttpSession session, Model model) {

		String memberId = (String) session.getAttribute("memberName");
		int memberIdx = (Integer) session.getAttribute("memberIdx");

		System.out.println("memberIdx : " + memberIdx);

		boardDto.setBoardMemberId(memberId);
		boardDto.setBoardMemberIdx(memberIdx);

		System.out.println(boardDto);

		try {
			int result = boardservice.inquiryAnswer(boardDto);
			System.out.println("result : " + result);

			int answerChkUpdate = boardservice.answerChkUpdate(boardDto);
			System.out.println("answerChkUpdate : " + answerChkUpdate);
			System.out.println("boardDto : " + boardDto);

			System.out.println("try 답변 작성 완료");

			return "success";
//			if(result > 0) {
//				System.out.println("result > 0 큼");
////				int answerChkUpdate = boardservice.answerChkUpdate(boardDto);
////				System.out.println("answerChkUpdate : " + answerChkUpdate);
//				return "redirect:/board/list.do";
//			} else {
//				System.out.println("try 답변 작성 실패");
//				return "/common/error404";
//			}
		} catch (Exception e) {
			System.out.println("catch 실행");
			return "error";
		}
//		finally {
//			System.out.println("finally 실행");
//			return "redirect:/board/list.do";
//		}		
	}

	// 유저 문의 수정 페이지
	@GetMapping("/inquiryEdit.do")
	public String inquiryEditForm(@RequestParam(value = "boardQuestionNum") int boardQuestionNum, Model model,
			HttpSession session, BoardDto boardDto) {

		BoardDto result = boardservice.inquiryEditPage(boardQuestionNum);

		String memberId = (String) session.getAttribute("memberName");
		int memberIdx = (Integer) session.getAttribute("memberIdx");

		if (!Objects.isNull(result)) {
			model.addAttribute("detail", result);
			System.out.println("문의 수정 페이지 result : " + result);
			// 임시 아이디 넘버
			model.addAttribute("user", memberIdx);
			System.out.println("문의 수정 페이지 user : " + memberIdx);
//			model.addAttribute("user",session.getAttribute("boardMemberIdx"));

			return "/board/inquiry_update";
		} else {

			return "error";
		}
	}

	// 유저 문의 업데이트
	@PostMapping("/inquiryUpdate.do")
	@ResponseBody
	public String inquiryUpdate(BoardDto boardDto, HttpSession session) {

		System.out.println("문의 업데이트 dto : " + boardDto);
		System.out.println("문의 업데이트 boardrDto.getBoardQuestionNum() : " + boardDto.getBoardQuestionNum());

		int result = boardservice.inquiryUpdate(boardDto);

		if (result > 0) {
			System.out.println("문의 업데이트 성공");
			return "success";
		} else {
			System.out.println("문의 업데이트 실패");
			return "error";
		}

	}

	// 유저 문의 삭제
	// 관리자 답변이 존재하면 답변도 같이 삭제함
	@PostMapping("/inquiryDelete.do")
	@ResponseBody
	public String inquiryDelete(@RequestBody BoardDto boardDto, HttpSession session) {

		System.out.println("문의 삭제 boardDto : " + boardDto);
		System.out.println("문의 삭제 boardrDto.getBoardQuestionNum() : " + boardDto.getBoardQuestionNum());

		int result = boardservice.inquiryDelete(boardDto);

		if (result > 0) {
			System.out.println("문의 삭제 성공");
			return "success";
		} else {
			System.out.println("문의 삭제 실패");
			return "error";
		}
	}

	// 관리자 답변 수정 페이지
	@GetMapping("/answerEditForm.do")
	public String answerEditForm(BoardDto boardDto , Model model,
			HttpSession session) {

		BoardDto result = boardservice.answerEditPage(boardDto.getBoardQuestionNum());

		String memberId = (String) session.getAttribute("memberName");

		if (!Objects.isNull(result)) {
			model.addAttribute("detail", result);
			System.out.println("관리자 답변 수정 페이지 result : " + result);
			// 임시 아이디
			model.addAttribute("user", memberId);
			System.out.println("관리자 답변 수정 페이지 user : " + memberId);
//			model.addAttribute("user",session.getAttribute("boardMemberIdx"));
			model.addAttribute("boardQuestionNum", boardDto.getBoardQuestionNum());
			model.addAttribute("boardProductNum", boardDto.getBoardProductNum());				
			
			return "/board/admin_update";
		} else {

			return "error";
		}
	}

	// 관리자 답변 업데이트
	@PostMapping("/answerUpdate.do")
	@ResponseBody
	public String answerUpdate(BoardDto boardDto, HttpSession session) {

		System.out.println("관리자 답변 업데이트 dto : " + boardDto);
		System.out.println("관리자 답변 boardrDto.getBoardQuestionNum() : " + boardDto.getBoardQuestionNum());

		// 임시로 BoardQuestionNum 지정
//		int limitBoardQuestionNum = boardDto.getBoardQuestionNum();
		// 세션에 없어서 현재 NULL임
//		ystem.out.println("문의 업데이트 (int)session.getAttribute(\"BoardQuestionNum\") : " + (int)session.getAttribute("BoardQuestionNum"));

//		if(boardrDto.getBoardQuestionNum() == (int)session.getAttribute("BoardQuestionNum")){
//		if (boardDto.getBoardQuestionNum() == limitBoardQuestionNum) {
			int result = boardservice.answerUpdate(boardDto);
//					System.out.println("(INT)BoardQuestionNum : " + (int)session.getAttribute("BoardQuestionNum"));

			if (result > 0) {
				System.out.println("관리자 답변 업데이트 성공");
				return "success";
			} else {
				System.out.println("관리자 답변 업데이트 실패");
				return "error";
			}
//		} 
//		else {
//			System.out.println("세션(BoardQuestionNum) 존재 안함");
//			return "error";
//		}
	}
}
