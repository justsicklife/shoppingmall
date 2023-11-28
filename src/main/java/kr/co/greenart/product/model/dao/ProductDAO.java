package kr.co.greenart.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.greenart.product.model.dto.ProductDTO;

@Repository
public class ProductDAO {

	public int insertProduct(SqlSessionTemplate sql, ProductDTO productDTO) {
		return sql.insert("s_product.insertProduct",productDTO);
	}

	public ProductDTO productFindById(SqlSessionTemplate sql, int id) {
		return sql.selectOne("s_product.productFindById",id);
	}

}
