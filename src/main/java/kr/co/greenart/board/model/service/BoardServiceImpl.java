package kr.co.greenart.board.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.greenart.board.model.dao.BoardDao;
import kr.co.greenart.board.model.dto.BoardDto;
import kr.co.greenart.common.model.dto.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSessionTemplate sqlsession; //mybatis에서 사용되는 내장 템플릿
	
	@Autowired
	private BoardDao boardDao;
	
	
	// 전체 게시글 수 조회
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlsession);
	}

	// 목록 불러오기
	@Override
	public List<BoardDto> selectListAll(PageInfo inquiryPi) {
		return boardDao.selectListAll(sqlsession, inquiryPi);
	}

}
