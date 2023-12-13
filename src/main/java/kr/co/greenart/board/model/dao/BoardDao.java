package kr.co.greenart.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.greenart.board.model.dto.BoardDto;
import kr.co.greenart.common.model.dto.PageInfo;

@Repository
public class BoardDao {
	
	// 전체 게시글 수 조회
	public int selectListCount(SqlSessionTemplate sqlsseion) {
		return sqlsseion.selectOne("inquiryMapper.selectListCount");
	}
	
	// 목록 불러오기
	public List<BoardDto> selectListAll(SqlSessionTemplate sqlsseion, PageInfo inquiryPi){
		
		int offset = (inquiryPi.getCurrentPage() - 1) * inquiryPi.getBoardLimit();
		int limit = inquiryPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlsseion.selectList("inquiryMapper.selectListAll", null, rowBounds);
	}
}
