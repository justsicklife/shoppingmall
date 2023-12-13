package kr.co.greenart.board.model.service;

import java.util.List;

import kr.co.greenart.board.model.dto.BoardDto;
import kr.co.greenart.common.model.dto.PageInfo;

public interface BoardService {
	
	// 전체 게시글 수 조회
	int selectListCount();
	
	// 목록 불러오기
	List<BoardDto> selectListAll(PageInfo inquiryPi);
}
