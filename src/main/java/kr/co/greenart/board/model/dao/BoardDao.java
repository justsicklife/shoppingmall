package kr.co.greenart.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.greenart.board.model.dto.BoardDto;
import kr.co.greenart.common.model.dto.PageInfo;
import kr.co.greenart.member.model.dto.MemberDto;

@Repository
public class BoardDao {
	
	// 전체 게시글 수 조회
	public int selectListCount(SqlSessionTemplate sqlsseion, int id) {
		return sqlsseion.selectOne("inquiryMapper.selectListCount", id);
	}
	
	// 문의 목록 불러오기
	public List<BoardDto> selectListAll(SqlSessionTemplate sqlsseion, PageInfo inquiryPi, int id){
		
		int offset = (inquiryPi.getCurrentPage() - 1) * inquiryPi.getBoardLimit();
		int limit = inquiryPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlsseion.selectList("inquiryMapper.selectListAll", id, rowBounds);
	}
	
	// 답변 목록 불러오기
	public List<BoardDto> selectAnswerAll(SqlSessionTemplate sqlsession, int id){
		return sqlsession.selectList("inquiryMapper.selectAnswerAll", id);
	}
	
	// 글 작성
	public int insertInquiry(SqlSessionTemplate sqlsession, BoardDto bo) {
		return sqlsession.insert("inquiryMapper.insertInquiry", bo);
	}
	
	// 문의 답변하기
	public int inquiryAnswer(SqlSessionTemplate sqlsession, BoardDto bo) {
		return sqlsession.insert("inquiryMapper.inquiryAnswer", bo);
	}
	
	// 문의에 답변 했을시 체크 업데이트
	public int answerChkUpdate(SqlSessionTemplate sqlsession, BoardDto bo) {
		return sqlsession.update("inquiryMapper.answerChkUpdate",bo);
	}
	
	// 유저 문의하기 수정 페이지
	public BoardDto inquiryEditPage(SqlSessionTemplate sqlsession, int boardQuestionNum) {
		return sqlsession.selectOne("inquiryMapper.inquiryEditPage", boardQuestionNum);
	}
	
	// 유저 문의 업데이트
	public int inquiryUpdate(SqlSessionTemplate sqlsession, BoardDto bo)
	{
		return sqlsession.update("inquiryMapper.inquiryUpdate", bo);
	}
	
	// 유저 문의 삭제
	public int inquiryDelete(SqlSessionTemplate sqlsession, BoardDto bo) {
		return sqlsession.delete("inquiryMapper.inquiryDelete", bo);
	}
	
	// 관리자 답변 수정 페이지
	public BoardDto answerEditPage(SqlSessionTemplate sqlsession, int boardQuestionNum) {
		return sqlsession.selectOne("inquiryMapper.answerEditPage", boardQuestionNum);
	}
	
	//관리자 답변 업데이트
	public int answerUpdate(SqlSessionTemplate sqlsession, BoardDto bo) {
		return sqlsession.update("inquiryMapper.answerUpdate", bo);
	}
}
