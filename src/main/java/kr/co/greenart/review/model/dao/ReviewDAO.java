package kr.co.greenart.review.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.greenart.review.model.dto.ReviewDTO;

@Repository
public class ReviewDAO {

	public int insertReview(SqlSessionTemplate sql, ReviewDTO reviewDTO) {
		return sql.insert("s_review.insertReview",reviewDTO);
	}

	public List<ReviewDTO> reviewFindByProductId(SqlSessionTemplate sql, int id) {
		return sql.selectList("s_review.reviewFindByProductId",id);
	}

	public ReviewDTO findReviewByMemberAndProduct(SqlSessionTemplate sql, Map<String, Integer> map) {
		return sql.selectOne("s_review.findReviewByMemberAndProduct",map);
	}

	public ReviewDTO reviewFindByReviewId(SqlSessionTemplate sql, int review_id) {
		return sql.selectOne("s_review.reviewFindByReviewId",review_id);
	}

	public int reviewUpdpate(SqlSessionTemplate sql, ReviewDTO reviewDTO) {
		return sql.update("s_review.reviewUpdate",reviewDTO);
	}

	public int reviewDelete(SqlSessionTemplate sql, int review_id) {
		
		return sql.delete("s_review.reviewDelete",review_id);
	}

}
