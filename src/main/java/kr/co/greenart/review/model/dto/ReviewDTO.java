package kr.co.greenart.review.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReviewDTO {
	private int review_id;
	private int member_idx;
	private int product_id;
	private int review_score;
	private Date review_open_date;
	private String review_content;
	private int review_like;
	private int review_unlike;
	
	// db에없는거
	private String member_id;
}
