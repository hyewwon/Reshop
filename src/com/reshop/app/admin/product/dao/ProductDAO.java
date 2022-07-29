package com.reshop.app.admin.product.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reshop.app.mybatis.SqlMapConfig;

public class ProductDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;

	public ProductDAO() {
		sqlsession = factory.openSession(true);
	}

	public int getProdCnt() {
		return sqlsession.selectOne("Product.getProdCnt");
	}

	public List<ProductDTO> getProdList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<ProductDTO> prodList = sqlsession.selectList("Product.getProdList", datas);
		return prodList;
	}

	public ProductDTO getDetail(int prodnum) {
		return sqlsession.selectOne("Product.getDetail", prodnum);
	}

	public boolean updateProduct(ProductDTO product) {
		return 1 == sqlsession.update("Product.updateProduct", product);
	}

	public boolean deleteProduct(int prodnum) {
		return 1 == sqlsession.delete("Product.deleteProduct", prodnum);
	}

	public boolean insertProduct(ProductDTO product) {
		return 1 == sqlsession.insert("Product.insertProduct", product);
	}

	public ProductDTO checkProduct(int prodnum) {
		return sqlsession.selectOne("Product.checkProduct", prodnum);
	}

	public int selectProdnum(ProductDTO product) {
		return sqlsession.selectOne("Product.selectProdnum", product);
	}

	public List<ProductDTO> getProdListForUser(int startRow, int endRow, String sortColumn) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		datas.put("sortColumn", sortColumn);
		List<ProductDTO> prodList = sqlsession.selectList("Product.getProdListForUser", datas);
		return prodList;
	}

	public List<ProductDTO> getProdListForUser2(int startRow, int endRow, String sortColumn) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		datas.put("sortColumn", sortColumn);
		List<ProductDTO> prodList = sqlsession.selectList("Product.getProdListForUser2", datas);
		return prodList;
	}

	public int getProdCntForUser() {
		return sqlsession.selectOne("Product.getProdCntForUser");
	}

	public int getProdCntForUser2() {
		return sqlsession.selectOne("Product.getProdCntForUser2");
	}

	public ProductDTO getProductInfo(int prodnum) {
		return sqlsession.selectOne("Product.getProductInfo", prodnum);
	}
}
