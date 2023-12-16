package kr.co.greenart.product.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.greenart.product.model.dao.ProductDAO;
import kr.co.greenart.product.model.dto.ProductDTO;

@Service
public class ProductService {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	@Autowired
	private ProductDAO productDAO;
	
	public int insertProduct(ProductDTO productDTO) {
		return productDAO.insertProduct(sql,productDTO);
	}
	
	public ProductDTO productFindById(int id) {
		return productDAO.productFindById(sql,id);
	}
	
	public List<ProductDTO> productFindByType(String type) {
		return productDAO.productFindByType(sql,type);
	}

}
