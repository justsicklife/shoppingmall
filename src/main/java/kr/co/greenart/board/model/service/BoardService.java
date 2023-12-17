package kr.co.greenart.board.model.service;

import java.util.List;

import kr.co.greenart.board.model.dao.BoardDao;
import kr.co.greenart.board.model.dto.BoardDto;
import kr.co.greenart.common.model.dto.PageInfo;
import kr.co.greenart.member.model.dto.MemberDto;

public interface BoardService {
	
	// 전체 게시글 수 조회
	int selectListCount(int id);
	
	// 문의 목록 불러오기
	List<BoardDto> selectListAll(PageInfo inquiryPi, int id );
	
	// 답변 목록 불러오기
	public List<BoardDto> selectAnswerAll(int id);
	
	// 글 작성
	public int insertInquiry(BoardDto bo);
	
	// 문의 답변
	public int inquiryAnswer(BoardDto bo);
	
	// 문의에 답변 했을시 체크 업데이트
	public int answerChkUpdate(BoardDto bo);
	
	// 유저 문의하기 수정 페이지
	BoardDto inquiryEditPage(int boardQuestionNum);
	
	// 유저 문의 업데이트
	int inquiryUpdate(BoardDto bo);
	
	//유저 문의 삭제
	int inquiryDelete(BoardDto bo);
	
	//관리자 답변 수정 페이지
	BoardDto answerEditPage(int boardQuestionNum);
	
	//관리자 답변 업데이트
	int answerUpdate(BoardDto bo);
}
