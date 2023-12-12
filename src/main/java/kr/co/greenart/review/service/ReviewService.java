package kr.co.greenart.review.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.greenart.common.model.dto.PageInfo;
import kr.co.greenart.review.model.dao.ReviewDAO;
import kr.co.greenart.review.model.dto.ReviewDTO;

@Service
public class ReviewService {
	
	@Autowired
	SqlSessionTemplate sql;
	
	@Autowired
	ReviewDAO reviewDAO;
	
	public int insertReview(ReviewDTO reviewDTO) {
		return reviewDAO.insertReview(sql,reviewDTO);
	}

	public List<ReviewDTO> reviewFindByProductId(PageInfo pi, int id) {
		return reviewDAO.reviewFindByProductId(sql,pi,id);
	}

	public ReviewDTO findReviewByMemberAndProduct(Map<String, Integer> map) {
		return reviewDAO.findReviewByMemberAndProduct(sql,map);
	}

	public ReviewDTO reviewFindByReviewId(int review_id) {
		return reviewDAO.reviewFindByReviewId(sql,review_id);
	}

	public int reviewUpdpate(ReviewDTO reviewDTO) {
		return reviewDAO.reviewUpdpate(sql,reviewDTO);
	}

	public int reviewDelete(int review_id) {
		return reviewDAO.reviewDelete(sql,review_id);
	}

//	public List<ReviewDTO> selectListAll(PageInfo pi) {
//		return reviewDAO.reviewSelectListAll(sql,pi);
//	}

	public int selectListCount(int id) {
		return reviewDAO.selectListCount(sql,id);
	}

}
