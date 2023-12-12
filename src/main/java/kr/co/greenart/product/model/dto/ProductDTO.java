package kr.co.greenart.product.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	private int product_id;
	private String product_name;
	private String product_image_group;
	private String product_content;
	private Date product_open_date;
	private int product_price;
	private String product_info;
	private String product_color_group;
	private String product_size_group;
	private String product_type;

	// db에 없는값
	
	private String product_image;
}
