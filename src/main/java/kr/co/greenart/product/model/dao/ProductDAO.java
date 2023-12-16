package kr.co.greenart.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.greenart.product.model.dto.ProductDTO;

@Repository
public class ProductDAO {

	public int insertProduct(SqlSessionTemplate sql, ProductDTO productDTO) {
		System.out.println(productDTO);
		return sql.insert("s_product.insertProduct",productDTO);
	}

	public ProductDTO productFindById(SqlSessionTemplate sql, int id) {
		return sql.selectOne("s_product.productFindById",id);
	}

	public List<ProductDTO> productFindByType(SqlSessionTemplate sql, String type) {
		return sql.selectList("s_product.productFindByType",type);
	}


}
